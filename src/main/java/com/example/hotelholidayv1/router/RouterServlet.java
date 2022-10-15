package com.example.hotelholidayv1.router;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "RouterServlet", value = "/RouterServlet")
public class RouterServlet extends HttpServlet {
    public void router(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String> routers = new HashMap<String, String>();
        routers.put("views/home/index.jsp", "admin/dashboard");
        String url = request.getRequestURL().toString();
        String baseURL = url.substring(0, url.length() - request.getRequestURI().length()) + request.getContextPath() + "/";
        String urlC = request.getRequestURL().toString();
        String route = urlC.substring(baseURL.length());
    }
}
