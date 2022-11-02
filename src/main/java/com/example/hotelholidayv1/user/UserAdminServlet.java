package com.example.hotelholidayv1.user;

import com.example.hotelholidayv1.helpers.DataConverter;
import com.example.hotelholidayv1.roomRates.RoomRates;
import com.example.hotelholidayv1.roomRates.RoomRatesService;
import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@WebServlet({"/admin/validate/login", "/admin/update", "/admin/get", "/admin/check/password", "/admin/update/password", "/admin/get/statics"})
@MultipartConfig
public class UserAdminServlet extends HttpServlet {
    private String baseUrl = "http://localhost:8080";
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
            case "/admin/get": getAllUserController(request, response); break;
            case "/admin/update": updateUserController(request, response); break;
            case "/admin/check/password": checkPassowrdUserController(request, response); break;
            case "/admin/update/password": updatePasswordController(request, response); break;
            case "/admin/get/statics": getAllStaticsController(request, response); break;
            case "/admin/validate/login": loginController(request, response); break;
        }
    }

    public User convertToUserObject(HttpServletRequest request) {
        return new User(request.getParameter("firstname"), request.getParameter("lastname"),
                request.getParameter("email"), request.getParameter("password"));
    }

    public void loginController(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        User user = convertToUserObject(request);
        String message = "error";
        if(UserService.loginService(user)) {
            message = "success";
            HttpSession sessionAdmin = request.getSession();
            sessionAdmin.setAttribute("sessionsAdmin", user.email);
        }
        PrintWriter out = response.getWriter();
        HashMap<String, String> isResponse = new HashMap<>();
        isResponse.put("message",message);
        String json = new Gson().toJson(isResponse);
        out.println(json);
        out.flush();
    }

    public void getAllUserController(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        ResultSet rsRooms = UserService.getAllUserService(-1);
        PrintWriter out = response.getWriter();
        List<HashMap<String,Object>> rooms = DataConverter.toList(rsRooms);
        String json = new Gson().toJson(rooms);
        out.println(json);
        out.flush();
    }

    public void updateUserController(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User user = convertToUserObject(request);
        UserService.updateUserService(user);
        PrintWriter out = response.getWriter();
        HashMap<String, String> isResponse = new HashMap<>();
        isResponse.put("message","success");
        String json = new Gson().toJson(isResponse);
        out.println(json);
        out.flush();
    }

    public void checkPassowrdUserController(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        User user = convertToUserObject(request);
        String message = "error";
        if(UserService.checkPassowrdUserService(user)) { message = "success"; }
        PrintWriter out = response.getWriter();
        HashMap<String, String> isResponse = new HashMap<>();
        isResponse.put("message",message);
        String json = new Gson().toJson(isResponse);
        out.println(json);
        out.flush();
    }

    public void updatePasswordController(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User user = convertToUserObject(request);
        UserService.updatePasswordService(user);
        PrintWriter out = response.getWriter();
        HashMap<String, String> isResponse = new HashMap<>();
        isResponse.put("message","success");
        String json = new Gson().toJson(isResponse);
        out.println(json);
        out.flush();
    }

    public void getAllStaticsController(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        HashMap<String, String> rsStatics = UserService.getAllStaticsUserService();
        PrintWriter out = response.getWriter();
        String json = new Gson().toJson(rsStatics);
        out.println(json);
        out.flush();
    }
}
