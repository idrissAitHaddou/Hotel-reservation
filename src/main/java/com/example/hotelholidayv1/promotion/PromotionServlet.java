package com.example.hotelholidayv1.promotion;

import com.example.hotelholidayv1.helpers.DataConverter;
import com.example.hotelholidayv1.room.Room;
import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@WebServlet({"/admin/promotion/update", "/admin/promotion/get"})
@MultipartConfig
public class PromotionServlet extends HttpServlet {
    public static final String IMAGES_FOLDER = "assets/uploads";
    public static String uploadPath;
    @Override
    public void init() throws ServletException {
        uploadPath = getServletContext().getRealPath( IMAGES_FOLDER );
        File uploadDir = new File( uploadPath );
        if ( ! uploadDir.exists() ) uploadDir.mkdir();
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Mapping(request, response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Mapping(request, response);
        } catch (SQLException | ParseException e) {
            throw new RuntimeException(e);
        }
    }

    public void Mapping(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ParseException {
        String path = request.getServletPath()!=null?request.getServletPath():"";
        switch(path) {
            case "/admin/promotion/get": getAllPromoController(response); break;
//            case "/admin/room/one": getOneRoomController(request,response); break;
//            case "/admin/room/store": storeRoomController(request,response); break;
            case "/admin/promotion/update": updatePromoController(request,response); break;
//            case "/admin/room/delete":  destroyRoomController(request, response); break;

        }
    }

    public static Promotion convertToPromoObject(HttpServletRequest request, String fileName) throws ParseException {
        int isPercentage = Integer.parseInt(request.getParameter("percentageParam"));
        return new Promotion(isPercentage, fileName, request.getParameter("startDateParam"), request.getParameter("endDateParam"));
    }


    public void getAllPromoController(HttpServletResponse response) throws IOException, SQLException {
        ResultSet promotions = PromotionService.getAllPromoService();
        PrintWriter out = response.getWriter();
        List<HashMap<String,Object>> rooms = DataConverter.toList(promotions);
        String json = new Gson().toJson(rooms);
        out.println(json);
        out.flush();
    }
    public void updatePromoController(HttpServletRequest request, HttpServletResponse response) throws ParseException, ServletException, IOException, SQLException {
        PrintWriter out = response.getWriter();
        Gson gson = new Gson();
        Integer[] roomsId = gson.fromJson(request.getParameter("roomsParam"), Integer[].class);
        Part file = null;
        if(request.getParameter("statusFile").equals("true")){
            file = request.getPart("fileSrc");
        }
        String newName = PromotionService.addPromotionservice(request, roomsId, file, uploadPath);
        HashMap<String, String> isResponse = new HashMap<>();
        isResponse.put("src",newName);
        String json = new Gson().toJson(isResponse);
        out.println(json);
        out.flush();
    }
}
