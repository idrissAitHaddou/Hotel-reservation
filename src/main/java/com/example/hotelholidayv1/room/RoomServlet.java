package com.example.hotelholidayv1.room;

import com.example.hotelholidayv1.helpers.DataConverter;
import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

@WebServlet({"/admin/room/store", "/admin/room/update", "/admin/room/get","/admin/room/details","/admin/room/one/details","/admin/room/one", "/admin/room/delete", "/admin/room/delete/image","/room/details"})
@MultipartConfig
public class RoomServlet extends HttpServlet {
    public static final String IMAGES_FOLDER = "/assets/uploads/rooms";
    public String uploadPath;
    @Override
    public void init() throws ServletException {
        uploadPath = getServletContext().getRealPath( IMAGES_FOLDER );
        File uploadDir = new File( uploadPath );
        if ( ! uploadDir.exists() ) uploadDir.mkdir();
    }
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
            case "/admin/room/get": getAllRoomController(request,response); break;
            case "/admin/room/details": getAllRoomWithDetailsController(request,response); break;
            case "/admin/room/one/details": getOneRoomWithDetailsController(request,response); break;
            case "/admin/room/one": getOneRoomController(request,response); break;
            case "/admin/room/store": storeRoomController(request,response); break;
            case "/admin/room/update": updateRoomController(request,response); break;
            case "/admin/room/delete":  destroyRoomController(request, response); break;
            case "/admin/room/delete/image":  deleteRoomImageController(request, response); break;
            case "/room/details":  getRoomDetailsController(request, response); break;
        }
    }

    public Room convertToRoomObject(HttpServletRequest request) {
        return new Room(request.getParameter("id_room"),request.getParameter("room_number"), request.getParameter("floor_number"),
                request.getParameter("promo_id"), request.getParameter("type_room"));
    }

    private void getAllRoomController(HttpServletRequest request, HttpServletResponse response) throws  IOException, SQLException {
        ResultSet rsRooms = RoomService.getAllRoomService(-1);
        PrintWriter out = response.getWriter();
        List<HashMap<String,Object>> rooms = DataConverter.toList(rsRooms);
        String json = new Gson().toJson(rooms);
        out.println(json);
        out.flush();
    }
    private void getAllRoomWithDetailsController(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String start_date = request.getParameter("start_date") != null ? request.getParameter("start_date"):null;
        String end_date = request.getParameter("end_date") != null ? request.getParameter("end_date"):null;
        ResultSet rsRooms = RoomService.getAllRoomService(-1);
        PrintWriter out = response.getWriter();
        List<HashMap<String,Object>> rooms = DataConverter.toList(rsRooms);
        for (HashMap<String,Object> room: rooms) {
            int idRoom = DataConverter.parseInt(String.valueOf(room.get("id_room")));
            System.out.println(idRoom);
            ResultSet rsImages = RoomService.getAllImageService(idRoom);
            List<HashMap<String,Object>> images = DataConverter.toList(rsImages);
            room.put("images",images);
            ResultSet rsRate = RoomService.getAllRatesRoomService(idRoom);
            List<HashMap<String,Object>> rates = DataConverter.toList(rsRate);
            double total=0;
            for (HashMap<String,Object> rate: rates) {
                total += Double.parseDouble(String.valueOf(rate.get("rate")));
            }
            room.put("avg",total/rates.size());
            room.put("rates",rates);
        }

        String json = new Gson().toJson(rooms);
        out.println(json);
        out.flush();
    }

    private void getRoomDetailsController(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        PrintWriter out = response.getWriter();
        int idRoom = request.getParameter("id_room") != null ? Integer.parseInt(request.getParameter("id_room")):-1;
        HashMap<String, Object> rooms = RoomService.getRoomDetails(idRoom);

        String json = new Gson().toJson(rooms);
        out.println(json);
        out.flush();
    }
    private void getOneRoomWithDetailsController(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int idRoom = request.getParameter("id") != null ? DataConverter.parseInt(request.getParameter("id")):-1;
        ResultSet rsRooms = RoomService.getOneRoomWithDetailsService(idRoom);
        PrintWriter out = response.getWriter();
        List<HashMap<String,Object>> rooms = DataConverter.toList(rsRooms);
        for (HashMap<String,Object> room: rooms) {
            System.out.println(idRoom);
            ResultSet rsImages = RoomService.getAllImageService(idRoom);
            List<HashMap<String,Object>> images = DataConverter.toList(rsImages);
            room.put("images",images);
        }

        String json = new Gson().toJson(rooms);
        out.println(json);
        out.flush();
    }
    private void getOneRoomController(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = DataConverter.parseInt(request.getParameter("id"));
        ResultSet rsRooms = RoomService.getAllRoomService(id);
        ResultSet imagesRoom = RoomService.getAllImageService(id);
        PrintWriter out = response.getWriter();
        List<HashMap<String,Object>> rooms = DataConverter.toList(rsRooms);
        List<HashMap<String,Object>> images = DataConverter.toList(imagesRoom);
        HashMap<String, Object> data = new HashMap<>();
        data.put("rooms", rooms);
        data.put("images", images);
        String isData = new Gson().toJson(data);
        out.println(isData);
        out.flush();
    }
    private void storeRoomController(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException, ServletException {
        PrintWriter out = response.getWriter();
        HashMap<String, String> isResponse = new HashMap<>();
        Room room = convertToRoomObject(request);
        RoomService.storeRoomService(request, room, uploadPath);
        isResponse.put("message","success");
        String json = new Gson().toJson(isResponse);
        out.println(json);
        out.flush();
    }

    private void updateRoomController(HttpServletRequest request,HttpServletResponse response) throws IOException, SQLException {
        Room room = convertToRoomObject(request);
        RoomService.updateRoomService(room, request, uploadPath);
        PrintWriter out = response.getWriter();
        HashMap<String, String> isResponse = new HashMap<>();
        isResponse.put("message","success");
        String json = new Gson().toJson(isResponse);
        out.println(json);
        out.flush();
    }
    private void deleteRoomImageController(HttpServletRequest request,HttpServletResponse response) throws IOException, SQLException {
        PrintWriter out = response.getWriter();
        HashMap<String, String> isResponse = new HashMap<>();
        if(RoomService.deleteRoomImageService(request, uploadPath)) {
            isResponse.put("message","success");
        }else {
            isResponse.put("message","error");
        }
        String json = new Gson().toJson(isResponse);
        out.println(json);
        out.flush();
    }
    private void destroyRoomController(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        int id = DataConverter.parseInt(request.getParameter("id"));
        PrintWriter out = response.getWriter();
        if(id != -1){
           if(RoomService.deleteRoomService(id, uploadPath)){
               HashMap<String, Object> success = new HashMap<>();
               success.put("success","success");
               success.put("message","Room deleted successfully");
               String json = new Gson().toJson(success);
               out.println(json);
               out.flush();
           }else{
               HashMap<String, Object> success = new HashMap<>();
               success.put("success","error");
               success.put("message","Room failed to delete");
               String json = new Gson().toJson(success);
               out.println(json);
               out.flush();
           }
        }else{
            HashMap<String, Object> success = new HashMap<>();
            success.put("success","error");
            success.put("message","something went wrong");
            String json = new Gson().toJson(success);
            out.println(json);
            out.flush();
        }
    }
}
