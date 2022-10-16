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
                view(request, response, "../admin/index.jsp");
                break;
            case "/admin":
                view(request, response, "../admin/index.jsp");
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
        RequestDispatcher dispatcher0 = request.getRequestDispatcher("../admin/component/header.jsp");
        dispatcher0.include( request, response );
        RequestDispatcher dispatcher2 = request.getRequestDispatcher("../admin/component/sidebar.jsp");
        dispatcher2.include( request, response );
        RequestDispatcher dispatcher1 = request.getRequestDispatcher(pathView);
        dispatcher1.include( request, response );
        RequestDispatcher dispatcher8 = request.getRequestDispatcher("../admin/component/footer.jsp");
        dispatcher8.include( request, response );
    }

}
