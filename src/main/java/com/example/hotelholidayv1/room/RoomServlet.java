package com.example.hotelholidayv1.room;

import com.example.hotelholidayv1.helpers.DataConverter;
import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@WebServlet({"/admin/room/store", "/admin/room/update", "/admin/room/get","/admin/room/one", "/admin/room/delete"})
@MultipartConfig
public class RoomServlet extends HttpServlet {
    public static final String IMAGES_FOLDER = "/assets/uploads/rooms";
    public String uploadPath;
    @Override
    public void init() throws ServletException {
        uploadPath = getServletContext().getRealPath( IMAGES_FOLDER );
        File uploadDir = new File( uploadPath );
        if ( ! uploadDir.exists() ) uploadDir.mkdir();
        System.out.println(uploadPath);
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
    private void storeRoomController(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        if (!request.getParameter("room_number").trim().isEmpty() && !request.getParameter("floor_number").trim().isEmpty() && !request.getParameter("type_room").trim().isEmpty()){
            Room room = convertToRoomObject(request);
            List<String> images = new ArrayList<>();
            try {
                long unixTime;
                System.out.println(request.getParts().size());
                for ( Part part : request.getParts()) {
                    String fileName = getFileName( part );
                    if(!fileName.equals("Default.file") && fileName != null) {
                        unixTime = System.currentTimeMillis() / 1000L;
                        String fullPath = uploadPath + File.separator + fileName;
                        String extension = fileName.substring(fileName.lastIndexOf('.') + 1);
                        String name = fileName.substring(0,fileName.lastIndexOf('.') - 1);
                        String newName = name + unixTime + "." + extension;
                        String newFileName = uploadPath + File.separator + newName;
                        part.write(fullPath);
                        File file1 = new File(fullPath);
                        File file2 = new File(newFileName);
                        file1.renameTo(file2);
                        images.add(newFileName);
                    }
                }
            } catch (ServletException e) {
                System.out.println(e.getMessage());
            }
            images.add(request.getParameter("images"));
            System.out.println(request.getParameter("images"));
            RoomService.storeRoomService(room,images);
            response.sendRedirect("/admin/rooms?success=true&message=Room added successfully!!");
        }else
            response.sendRedirect("/admin/rooms?success=false&message=Room failed to add!!");
    }

    /*
     * Récupération du nom du fichier dans la requête.
     */
    private String getFileName( Part part ) {
        for ( String content : part.getHeader( "content-disposition" ).split( ";" ) ) {
            if ( content.trim().startsWith( "filename" ) )
                return content.substring( content.indexOf( "=" ) + 2, content.length() - 1 );
        }
        return "Default.file";
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
