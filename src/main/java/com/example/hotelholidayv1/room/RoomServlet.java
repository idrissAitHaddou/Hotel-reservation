package com.example.hotelholidayv1.room;

import com.example.hotelholidayv1.helpers.DataConverter;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@WebServlet({"/admin/room/store", "/room/update", "/room/get", "/room/delete"})
@MultipartConfig
public class RoomServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Mapping(request, response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Mapping(request, response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void Mapping(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String path = request.getServletPath()!=null?request.getServletPath():"";
        switch(path) {
            case "/room/get": getAllRoomController(request,response); break;
            case "/admin/room/store": storeRoomController(request); break;
            case "/room/update": updateRoomController(request); break;
            case "/room/delete": destroyRoomController(); break;
        }
    }

    public Room convertToRoomObject(HttpServletRequest request) {
        return new Room(request.getParameter("room_number"), request.getParameter("floor_number"),
                request.getParameter("promo_id"), request.getParameter("type_room"));
    }

    private void getAllRoomController(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        ResultSet rsRooms = RoomService.getAllRoomService();
        List<?> rooms = DataConverter.toList(rsRooms);

        System.out.println(DataConverter.toList(rsRooms));
        request.setAttribute("rooms",rooms);
        RequestDispatcher req = request.getRequestDispatcher("/admin/rooms");
        req.forward(request,response);
    }

    private void storeRoomController(HttpServletRequest request){
        Room room = convertToRoomObject(request);
        RoomService.storeRoomService(room);

    }
    private void updateRoomController(HttpServletRequest request){

    }
    private void destroyRoomController(){

    }

}
