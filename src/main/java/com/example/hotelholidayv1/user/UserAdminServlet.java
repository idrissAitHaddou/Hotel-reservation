package com.example.hotelholidayv1.user;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "UserAdminServlet", value = "/UserAdminServlet")
public class UserAdminServlet extends HttpServlet {

    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Mapping(request, response);
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
