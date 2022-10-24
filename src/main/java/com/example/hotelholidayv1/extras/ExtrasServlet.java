package com.example.hotelholidayv1.extras;

import com.example.hotelholidayv1.helpers.DataConverter;
import com.example.hotelholidayv1.room.Room;
import com.example.hotelholidayv1.room.RoomRepository;
import com.example.hotelholidayv1.room.RoomService;
import com.example.hotelholidayv1.user.User;
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
import java.util.Objects;

@WebServlet({"/admin/extra/store", "/admin/extra/update", "/admin/extra/get","/admin/extra/one", "/admin/extra/delete"})

public class ExtrasServlet extends HttpServlet {
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
            case "/admin/extra/get": getAllExtraController(request,response); break;
            case "/admin/extra/one": getOneExtraController(request,response); break;
            case "/admin/extra/store": storeExtraController(request,response); break;
            case "/admin/extra/update": updateExtraController(request,response); break;
            case "/admin/extra/delete":  destroyExtraController(request, response); break;

        }
    }

    public Extras convertToExtraObject(HttpServletRequest request) {
        return new Extras(request.getParameter("id_extra"),request.getParameter("rate"), request.getParameter("type_extra"));
    }

    private void getAllExtraController(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        ResultSet rsRooms = ExtrasService.getAllExtrasService(-1);
        PrintWriter out = response.getWriter();
        List<HashMap<String,Object>> rooms = DataConverter.toList(rsRooms);
        String json = new Gson().toJson(rooms);
        out.println(json);
        out.flush();
    }
    private void getOneExtraController(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = DataConverter.parseInt(request.getParameter("id"));
        System.out.println(id);
        ResultSet rsExtras = ExtrasService.getAllExtrasService(id);
        PrintWriter out = response.getWriter();
        List<HashMap<String,Object>> extras = DataConverter.toList(rsExtras);
        String json = new Gson().toJson(extras);
        out.println(json);
        out.flush();
    }

    private void storeExtraController(HttpServletRequest request, HttpServletResponse response) throws  IOException {
        if (!request.getParameter("type_extra").trim().isEmpty() && !request.getParameter("rate").trim().isEmpty()){
            Extras extras = convertToExtraObject(request);
            ExtrasService.storeExtrasService(extras);
            response.sendRedirect("/admin/extras?success=true&message=Extras added successfully!!");
        }else
            response.sendRedirect("/admin/extras?success=false&message=Extras failed to add!!");

    }
    private void updateExtraController(HttpServletRequest request,HttpServletResponse response) throws IOException {
        if (!request.getParameter("id_extra").trim().isEmpty()&&!request.getParameter("rate").trim().isEmpty() && !request.getParameter("type_extra").trim().isEmpty()){
            Extras extra = convertToExtraObject(request);
            if (extra.id_extra != 0 && ExtrasService.updateExtrasService(extra))
                response.sendRedirect("/admin/extras?success=true&message=Extras updated successfully!!");
            else
                response.sendRedirect("/admin/extras?success=false&message=Extras failed to update!!");

        }else
            response.sendRedirect("/admin/extras?success=false&message=Something went wrong!!");

    }
    private void destroyExtraController(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = DataConverter.parseInt(request.getParameter("id"));
        PrintWriter out = response.getWriter();
        HashMap<String, Object> success = new HashMap<>();
        if(id != -1){
            if(ExtrasService.deleteExtrasService(id)){
                success.put("success","success");
                success.put("message","Extras deleted successfully");
                String json = new Gson().toJson(success);
                out.println(json);
                out.flush();
            }else{
                success.put("success","error");
                success.put("message","Extras failed to delete");
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
