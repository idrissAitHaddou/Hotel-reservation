package com.example.hotelholidayv1.room;

import com.example.hotelholidayv1.helpers.DataConverter;
import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.*;
import java.sql.Array;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@WebServlet({"/admin/room/store", "/admin/room/update", "/admin/room/get","/admin/room/one", "/admin/room/delete"})
@MultipartConfig
public class RoomServlet extends HttpServlet {
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
            case "/admin/room/one": getOneRoomController(request,response); break;
            case "/admin/room/store": storeRoomController(request,response); break;
            case "/admin/room/update": updateRoomController(request,response); break;
            case "/admin/room/delete":  destroyRoomController(request, response); break;

        }
    }

    public Room convertToRoomObject(HttpServletRequest request) {
        return new Room(request.getParameter("id_room"),request.getParameter("room_number"), request.getParameter("floor_number"),
                request.getParameter("promo_id"), request.getParameter("type_room"));
    }

    private void getAllRoomController(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
       ResultSet rsRooms = RoomService.getAllRoomService(-1);
        PrintWriter out = response.getWriter();
        List<HashMap<String,Object>> rooms = DataConverter.toList(rsRooms);
        String json = new Gson().toJson(rooms);
        out.println(json);
        out.flush();
    }
    private void getOneRoomController(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = DataConverter.parseInt(request.getParameter("id"));
        System.out.println(id);
        ResultSet rsRooms = RoomService.getAllRoomService(id);
        PrintWriter out = response.getWriter();
        List<HashMap<String,Object>> rooms = DataConverter.toList(rsRooms);
        for (HashMap<String,Object> room: rooms) {
            System.out.println(room);
        }
        String json = new Gson().toJson(rooms);
        out.println(json);
        out.flush();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            //fetch form data

            Part part = request.getPart("file");
            String fileName = part.getSubmittedFileName();

            String path = getServletContext().getRealPath("/asses/"+fileName);

            InputStream is = part.getInputStream();
            boolean test = uploadFile(is,path);
            if(test){
                out.println("uploaded");
            }else{
                out.println("something wrong");
            }
        }
    }

    public boolean uploadFile(InputStream is, String path){
        boolean test = false;
        try{
            byte[] byt = new byte[is.available()];
            is.read();

            FileOutputStream fops = new FileOutputStream(path);
            fops.write(byt);
            fops.flush();
            fops.close();

            test = true;

        }catch(Exception e){
            e.printStackTrace();
        }

        return test;
    }

    private void storeRoomController(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        if (!request.getParameter("room_number").trim().isEmpty() && !request.getParameter("floor_number").trim().isEmpty() && !request.getParameter("type_room").trim().isEmpty()){
            Room room = convertToRoomObject(request);
            List<String> images = new ArrayList<>();
            images.add(request.getParameter("images"));
            System.out.println(request.getParameter("images"));
            RoomService.storeRoomService(room,images);
            response.sendRedirect("/admin/rooms?success=true&message=Room added successfully!!");
        }else
            response.sendRedirect("/admin/rooms?success=false&message=Room failed to add!!");
    }
    private void updateRoomController(HttpServletRequest request,HttpServletResponse response) throws IOException {
        if (!request.getParameter("id_room").trim().isEmpty()&&!request.getParameter("room_number").trim().isEmpty() && !request.getParameter("floor_number").trim().isEmpty() && !request.getParameter("type_room").trim().isEmpty()){
            Room room = convertToRoomObject(request);
            System.out.println(room.id_room);

            if (room.id_room != 0 && RoomService.updateRoomService(room))
                response.sendRedirect("/admin/rooms?success=true&message=Room updated successfully!!");
            else
                response.sendRedirect("/admin/rooms?success=true&message=Room failed to update!!");

        }else
            response.sendRedirect("/admin/rooms?success=false&message=Something went wrong!!");

    }
    private void destroyRoomController(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = DataConverter.parseInt(request.getParameter("id"));
        PrintWriter out = response.getWriter();
        if(id != -1){
           if(RoomService.deleteRoomService(id)){
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
