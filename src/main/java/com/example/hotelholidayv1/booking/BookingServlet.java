package com.example.hotelholidayv1.booking;

import com.example.hotelholidayv1.extras.ExtrasService;
import com.example.hotelholidayv1.helpers.DataConverter;
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

@WebServlet({"/admin/booking/get", "/admin/booking/delete"})
@MultipartConfig
public class BookingServlet extends HttpServlet {
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
            case "/admin/booking/get": getAllBookingController(request,response); break;
            case "/admin/booking/delete":  destroyBookingController(request, response); break;

        }
    }
    private void getAllBookingController(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        ResultSet bookings = BookingService.getAllBookingService(-1);
        PrintWriter out = response.getWriter();
        List<HashMap<String,Object>> isBookings = DataConverter.toList(bookings);
        String json = new Gson().toJson(isBookings);
        out.println(json);
        out.flush();
    }
    private void destroyBookingController(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = DataConverter.parseInt(request.getParameter("id"));
        BookingService.deleteBookingService(id);
        PrintWriter out = response.getWriter();
        HashMap<String, String> isResponse = new HashMap<>();
        isResponse.put("message","success");
        String json = new Gson().toJson(isResponse);
        out.println(json);
        out.flush();
    }
}
