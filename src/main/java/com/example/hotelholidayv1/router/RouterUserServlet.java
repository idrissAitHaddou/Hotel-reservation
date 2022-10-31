package com.example.hotelholidayv1.router;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
@WebServlet(urlPatterns = {"/booking","/explore","/rooms-suites","/checkout","/room-details","/confirmation"})
public class RouterUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath()!=null?request.getServletPath():"";
        switch(path) {
            case "/booking":
                view(request, response, "/user/views/booking/index.jsp");
                break;
            case "/explore":
                view(request, response, "/user/views/explore/index.jsp");
                break;
            case "/rooms-suites":
                view(request, response, "/user/views/rooms/index.jsp");
                break;
            case "/room-details":
                view(request, response, "/user/views/details/index.jsp");
                break;
            case "/checkout":
                view(request, response, "/user/views/checkout/index.jsp");
                break;
            case "/confirmation":
                view(request, response, "/user/views/confirmation/index.jsp");
                break;
        }
    }

    public void view(HttpServletRequest request, HttpServletResponse response, String pathView) throws ServletException, IOException  {
        RequestDispatcher main = request.getRequestDispatcher(pathView);
        main.include( request, response );
    }
}
