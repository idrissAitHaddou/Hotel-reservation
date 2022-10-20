package com.example.hotelholidayv1.extras;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/extra/get","/extra/store","/extra/update","/extra/delete"})

public class ExtrasServlet extends HttpServlet {

    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Mapping(request, response);
    }

    public void Mapping(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        String path = request.getServletPath()!=null?request.getServletPath():"";
        switch(path) {
            case "/extra/get": getAllExtrasController(); break;
            case "/extra/store": storeExtrasController(request); break;
            case "/extra/update": updateExtrasController(); break;
            case "/extra/delete": destroyExtrasController(); break;
        }
    }

    public void getAllExtrasController() {
        ExtrasService.getAllExtrasService();
    }
    public void storeExtrasController(HttpServletRequest request) {
        ExtrasService.storeExtrasService();
    }
    public void updateExtrasController() {
        ExtrasService.updateExtrasService();
    }
    public void destroyExtrasController() {
        ExtrasService.deleteExtrasService();
    }
}
