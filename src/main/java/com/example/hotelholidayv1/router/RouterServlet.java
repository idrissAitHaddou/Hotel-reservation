package com.example.hotelholidayv1.router;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = {"/admin", "/admin/dashboard", "/admin/rooms", "/admin/profile"})
public class RouterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath()!=null?request.getServletPath():"";
        switch(path) {
            case "/admin/dashboard":
                view(request, response, "../admin/views/dashboard/index.jsp");
                break;
            case "/admin/rooms":
                view(request, response, "../admin/views/rooms/index.jsp");
                break;
            case "/admin/profile":
                view(request, response, "../admin/views/profile/index.jsp");
                break;
        }
    }

    public void view(HttpServletRequest request, HttpServletResponse response, String pathView) throws ServletException, IOException  {
        RequestDispatcher header = request.getRequestDispatcher("../admin/component/header.jsp");
        header.include( request, response );
        RequestDispatcher sidebar = request.getRequestDispatcher("../admin/component/sidebar.jsp");
        sidebar.include( request, response );
        RequestDispatcher main = request.getRequestDispatcher(pathView);
        main.include( request, response );
        RequestDispatcher footer = request.getRequestDispatcher("../admin/component/footer.jsp");
        footer.include( request, response );
    }

}
