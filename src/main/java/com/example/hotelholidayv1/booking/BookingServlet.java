package com.example.hotelholidayv1.booking;
import com.example.hotelholidayv1.email.SendEmailService;
import com.example.hotelholidayv1.helpers.DataConverter;
import com.example.hotelholidayv1.helpers.Methods;
import com.example.hotelholidayv1.room.RoomService;
import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

@WebServlet({"/admin/booking/get", "/admin/booking/delete","/check-availability-room","/booking-data","/booking/room","/booking/room/details","/booking/room/pay"})
@MultipartConfig
public class BookingServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Mapping(request, response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Mapping(request, response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void Mapping(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String path = request.getServletPath()!=null?request.getServletPath():"";
        switch(path) {
            case "/admin/booking/get": getAllBookingController(request,response); break;
            case "/admin/booking/delete":  destroyBookingController(request, response); break;
            case "/check-availability-room":  checkAvailabilityController(request, response); break;
            case "/booking-data":  dataRoomController(request, response); break;
            case "/booking/room":  bookingController(request, response); break;
            case "/booking/room/details":  bookingDetailsController(request, response); break;
            case "/booking/room/pay":  payController(request, response); break;

        }
    }
    private void getAllBookingController(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        ResultSet bookings = BookingService.getAllBookingService(-1);
        PrintWriter out = response.getWriter();
        List<HashMap<String,Object>> isBookings = DataConverter.toList(bookings);
        String json = new Gson().toJson(isBookings);
        out.println(json);
        out.flush();
    }
    private void destroyBookingController(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = DataConverter.parseInt(request.getParameter("id"));
        BookingService.deleteBookingService(id);
        PrintWriter out = response.getWriter();
        HashMap<String, String> isResponse = new HashMap<>();
        isResponse.put("message","success");
        String json = new Gson().toJson(isResponse);
        out.println(json);
        out.flush();
    }

    private void checkAvailabilityController(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        String startDate = request.getParameter("start_date");
        String endDate = request.getParameter("end_date");
        int idRoom = DataConverter.parseInt(request.getParameter("idRoom"));
        ResultSet slates = RoomService.checkRoomAvailability(startDate,endDate,idRoom);
        List<HashMap<String,Object>> mapList = DataConverter.toList(slates);
        boolean isAvailable = mapList.size()>0;
        PrintWriter out = response.getWriter();
        HashMap<String, String> isResponse = new HashMap<>();
        isResponse.put("message",isAvailable?"success":"Error bro");
        String json = new Gson().toJson(isResponse);
        out.println(json);
        out.flush();
    }
    private void dataRoomController(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        PrintWriter out = response.getWriter();
        HashMap<String, Object> isResponse = new HashMap<>();
        String startDate = request.getParameter("start");
        String endDate = request.getParameter("end");
        int idRoom = DataConverter.parseInt(request.getParameter("room"));
        System.out.println(Methods.diffDateInDay(startDate,endDate));
        if(idRoom==-1 || startDate == null || endDate == null || startDate.isEmpty() || endDate.isEmpty() || Methods.diffDateInDay(startDate,endDate)<1){
            isResponse.put("message","this room is Not Available");
            isResponse.put("status","error");
        }else{
            ResultSet slates = RoomService.checkRoomAvailability(startDate,endDate,idRoom);
            List<HashMap<String,Object>> mapList = DataConverter.toList(slates);
            /*get images and rates */
            for (HashMap<String,Object> map:mapList) {
                int id  = DataConverter.parseInt(String.valueOf(map.get("id_room")));
                ResultSet images = RoomService.getAllImageService(id);
                List<HashMap<String,Object>> mapListImages = DataConverter.toList(images);
                map.put("images",mapListImages);
                ResultSet rates = RoomService.getRateByDateService(startDate,endDate,id);
                List<HashMap<String,Object>> mapListRates = DataConverter.toList(rates);
                double total = 0;
                for (HashMap<String,Object> mapRate:mapListRates) {
                    total += Double.parseDouble(String.valueOf(mapRate.get("rate")));
                }
                double average = total/mapListRates.size();
                map.put("rates",mapListRates);
                map.put("average",average);

            }

            isResponse.put("status","success");
            isResponse.put("data",mapList);
        }
        String json = new Gson().toJson(isResponse);
        out.println(json);
        out.flush();
    }
    private void bookingController(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        PrintWriter out = response.getWriter();
        HashMap<String, Object> isResponse = new HashMap<>();
        String startDate = request.getParameter("start_date");
        String endDate = request.getParameter("end_date");
        int idRoom = DataConverter.parseInt(request.getParameter("room_id"));
        String email = request.getParameter("email");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String tel = request.getParameter("tel");
        String extras = request.getParameter("extras");
        String numberOfPerson = request.getParameter("person-number");
        double average = 0L;
        if (startDate != null && endDate != null && idRoom != -1 && email != null){
            ResultSet rooms = RoomService.checkRoomAvailability(startDate,endDate,idRoom);
            List<HashMap<String,Object>> mapList = DataConverter.toList(rooms);
            String matricule = "BO" + (int)System.currentTimeMillis()/100;
            if (mapList.size()>0) {
                for (HashMap<String,Object> room :mapList) {
                    int id  = DataConverter.parseInt(String.valueOf(room.get("id_room")));
                    ResultSet rates = RoomService.getRateByDateService(startDate,endDate,id);
                    List<HashMap<String,Object>> mapListRates = DataConverter.toList(rates);
                    double total = 0;
                    for (HashMap<String,Object> mapRate:mapListRates) {
                        total += Double.parseDouble(String.valueOf(mapRate.get("rate")));
                    }
                    average = total/mapListRates.size();

                }
                int[] arrExtras = null;
                if (!extras.isEmpty()) {
                    arrExtras = Arrays.stream(extras.split(",")).mapToInt(Integer::parseInt).toArray();
                    }
            System.out.println(Arrays.toString(arrExtras));
                int numberPerson = 1;
                if(numberOfPerson != null){
                    numberPerson = DataConverter.parseInt(numberOfPerson);
                }else{
                    numberPerson = Methods.returnNumberOfPersonByRoom(String.valueOf(mapList.get(0).get("type_room")));
                }
                System.out.println(numberPerson);
                double rate = average * Methods.diffDateInDay(startDate,endDate);
                if(BookingService.saveBooking(idRoom, firstname, lastname, tel , matricule, email, startDate, endDate,rate,arrExtras,numberPerson)){
                    isResponse.put("status","success");
                    isResponse.put("matricule",matricule);
                }
            }
        }
        String json = new Gson().toJson(isResponse);
        out.println(json);
        out.flush();
    }

    private void bookingDetailsController(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        PrintWriter out = response.getWriter();
        HashMap<String, Object> isResponse = new HashMap<>();
        String matricule = request.getParameter("matricule");
        if (matricule != null){
            ResultSet booking = BookingService.getBookingByMatricule(matricule);
            List<HashMap<String,Object>> mapList = DataConverter.toList(booking);
            // get extras
            for (HashMap<String,Object> map : mapList){
                int idBooking = (int) map.get("id_booking");
                ResultSet extras = BookingService.getExtrasByBooking(idBooking);
                List<HashMap<String,Object>> extrasList = DataConverter.toList(extras);
                map.put("extras",extrasList);
            }
            if (mapList.size()>0) {
                isResponse.put("status","success");
                isResponse.put("data",mapList);
            }
        }
        String json = new Gson().toJson(isResponse);
        out.println(json);
        out.flush();
    }

    private void payController(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        PrintWriter out = response.getWriter();
        HashMap<String, Object> isResponse = new HashMap<>();
        String matricule  = request.getParameter("matricule");
        if (matricule != null) {
            if(BookingService.getPayBooking(matricule)){
                ResultSet booking = BookingService.getBookingByMatricule(matricule);
                List<HashMap<String,Object>> mapList = DataConverter.toList(booking);
                String email = String.valueOf(mapList.get(0).get("email"));
                String firstname = String.valueOf(mapList.get(0).get("firstname"));
                String lastname = String.valueOf(mapList.get(0).get("lastname"));
                String tel = String.valueOf(mapList.get(0).get("tel"));
                String startDate = String.valueOf(mapList.get(0).get("start_date"));
                String endDate = String.valueOf(mapList.get(0).get("end_date"));
                String typeRoom = String.valueOf(mapList.get(0).get("type_room"));
                String rate = String.valueOf(mapList.get(0).get("rate"));
                String extras = "";
                int idBooking = (int) mapList.get(0).get("id_booking");
                ResultSet extrasRs = BookingService.getExtrasByBooking(idBooking);
                List<HashMap<String,Object>> extrasList = DataConverter.toList(extrasRs);
                for (HashMap<String,Object> map : extrasList){
                    extras += String.valueOf(map.get("type_extra")) + " ";
                }
                String htmlMessage = "<h1>Booking Details</h1>"+"<p>Bonjour " + firstname + " " + lastname + ",</p>" +
                        "<p>Vous avez effectué une réservation pour une chambre " + typeRoom + " du " + startDate + " au " + endDate + ".</p>" +
                        "<p>Le prix total est de " + rate + " €.</p>" +
                        "<p>Vous avez choisi les extras suivants : " + extras + "</p>" +
                        "<p>Vous pouvez nous contacter au " + tel + " pour plus d'informations.</p>" +
                        "<p>Merci de votre confiance.</p>"+
                        "<p>Le personnel de l'hôtel.</p>";
                if (SendEmailService.sendEmail(email,htmlMessage)){
                    isResponse.put("statusEmail","success");
                }else{
                    isResponse.put("statusEmail","error");
                }
                isResponse.put("status","success");
            }
        }
        String json = new Gson().toJson(isResponse);
        out.println(json);
        out.flush();

    }


}
