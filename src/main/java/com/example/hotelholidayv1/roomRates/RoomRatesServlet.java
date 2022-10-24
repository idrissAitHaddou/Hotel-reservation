package com.example.hotelholidayv1.roomRates;

import com.example.hotelholidayv1.helpers.DataConverter;
import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

@WebServlet({"/admin/room-rates/store", "/admin/room-rates/update", "/admin/room-rates/get","/admin/room-rates/one", "/admin/room-rates/delete"})

public class RoomRatesServlet extends HttpServlet {
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
            case "/admin/room-rates/get": getAllRoomRatesController(request,response); break;
            case "/admin/room-rates/one": getOneRoomRatesController(request,response); break;
            case "/admin/room-rates/store": storeRoomRatesController(request,response); break;
            case "/admin/room-rates/update": updateRoomRatesController(request,response); break;
            case "/admin/room-rates/delete":  destroyRoomRatesController(request, response); break;
        }
    }

    public RoomRates convertToRoomRatesObject(HttpServletRequest request) {
        return new RoomRates(request.getParameter("id_room_rate"),request.getParameter("room_id"), request.getParameter("start_date"),
                request.getParameter("end_date"), request.getParameter("rate"));
    }

    private void getAllRoomRatesController(HttpServletRequest request, HttpServletResponse response) throws  IOException, SQLException {
        ResultSet rsRooms = RoomRatesService.getAllRoomRatesService(-1);
        PrintWriter out = response.getWriter();
        List<HashMap<String,Object>> rooms = DataConverter.toList(rsRooms);
        String json = new Gson().toJson(rooms);
        out.println(json);
        out.flush();
    }
    private void getOneRoomRatesController(HttpServletRequest request, HttpServletResponse response) throws  IOException, SQLException {
        int id = DataConverter.parseInt(request.getParameter("id"));
        ResultSet rsRooms = RoomRatesService.getAllRoomRatesService(id);
        PrintWriter out = response.getWriter();
        List<HashMap<String,Object>> rooms = DataConverter.toList(rsRooms);
        String json = new Gson().toJson(rooms);
        out.println(json);
        out.flush();
    }

    private void storeRoomRatesController(HttpServletRequest request, HttpServletResponse response) throws IOException {
        if (request.getParameter("room_id")!=null && !request.getParameter("rate").trim().isEmpty() && !request.getParameter("start_date").trim().isEmpty()&& !request.getParameter("end_date").trim().isEmpty()){
            RoomRates roomRates = convertToRoomRatesObject(request);
            RoomRatesService.storeRoomRatesService(roomRates);
            response.sendRedirect("/admin/rooms-rates?success=true&message=Room added successfully!!");
        }else
            response.sendRedirect("/admin/rooms-rates?success=false&message=Room failed to add!!");

    }
    private void updateRoomRatesController(HttpServletRequest request,HttpServletResponse response) throws IOException {
        if (!request.getParameter("id_room_rate").trim().isEmpty() && !request.getParameter("rate").trim().isEmpty() && !request.getParameter("start_date").trim().isEmpty() && !request.getParameter("end_date").trim().isEmpty()){
            RoomRates room = convertToRoomRatesObject(request);
            if (room.id_room_rate != 0 && RoomRatesService.updateRoomRatesService(room))
                response.sendRedirect("/admin/rooms-rates?success=true&message=Room rates updated successfully!!");
            else
                response.sendRedirect("/admin/rooms-rates?success=false&message=Room rates failed to update!!");

        }else
            response.sendRedirect("/admin/rooms-rates?success=false&message=Something went wrong!!");

    }
    private void destroyRoomRatesController(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = DataConverter.parseInt(request.getParameter("id"));
        PrintWriter out = response.getWriter();
        HashMap<String, Object> success = new HashMap<>();
        if(id != -1){
            if(RoomRatesService.deleteRoomRatesService(id)){
                success.put("success","success");
                success.put("message","Room deleted successfully");
                String json = new Gson().toJson(success);
                out.println(json);
                out.flush();
            }else{
                success.put("success","error");
                success.put("message","Room failed to delete");
                String json = new Gson().toJson(success);
                out.println(json);
                out.flush();
            }
        }else{
            success.put("success","error");
            success.put("message","something went wrong");
            String json = new Gson().toJson(success);
            out.println(json);
            out.flush();
        }
    }
}
