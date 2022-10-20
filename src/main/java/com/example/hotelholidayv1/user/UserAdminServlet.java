package com.example.hotelholidayv1.user;

import com.example.hotelholidayv1.extras.ExtrasService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;


@WebServlet(urlPatterns = {"/admin/get","/admin/store","/admin/update","/admin/delete"})
public class UserAdminServlet extends HttpServlet {
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
