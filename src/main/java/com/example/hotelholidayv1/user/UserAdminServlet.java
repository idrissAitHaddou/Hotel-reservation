package com.example.hotelholidayv1.user;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet({"/admin/store", "/admin/update", "/admin/get", "/admin/delete"})
@MultipartConfig
public class UserAdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Mapping(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Mapping(request, response);
    }
    public void Mapping(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        String path = request.getServletPath()!=null?request.getServletPath():"";
        switch(path) {
            case "/admin/get": getAllUserController(); break;
            case "/admin/store": storeUserController(request); break;
            case "/admin/update": updateUserController(); break;
            case "/admin/delete": destroyUserController(); break;
        }
    }
    public User convertToUserObject(HttpServletRequest request) {
        return new User(request.getParameter("firstname"), request.getParameter("lastname"),
                request.getParameter("email"), request.getParameter("password"));
    }
    public void getAllUserController() {
    }
    public void storeUserController(HttpServletRequest request) {
        UserService.storeUserService(convertToUserObject(request));
    }
    public void updateUserController() {
        UserService.updateUserService();
    }
    public void destroyUserController() {
        UserService.deleteUserService();
    }
}
