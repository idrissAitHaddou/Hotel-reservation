package com.example.hotelholidayv1.router;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet({"/admin/logout", "/admin/login", "/admin/dashboard", "/admin/rooms", "/admin/profile", "/admin/booking", "/admin/rooms-rates", "/admin/promotion", "/admin/extras"})
public class RouterAdminServlet extends HttpServlet {
    private HttpSession checkSession;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getServletPath()!=null?request.getServletPath():"";
        checkSession = request.getSession();
        switch(path) {
            case "/admin/logout":
                HttpSession removeSession = request.getSession();
                removeSession.removeAttribute("sessionsAdmin");
                response.sendRedirect("/admin/login");
                break;
            case "/admin/login":
                HttpSession session = request.getSession();
                if(session.getAttribute("sessionsAdmin") == null) {
                    RequestDispatcher login = request.getRequestDispatcher("../admin/views/login/index.jsp");
                    login.include( request, response );
                    return;
                }
                response.sendRedirect("/admin/dashboard");
                break;
            case "/admin/dashboard":
                view(request, response, "../admin/views/dashboard/index.jsp");
                break;
            case "/admin/rooms":

                view(request, response, "../admin/views/rooms/index.jsp");
                break;
            case "/admin/profile":
                view(request, response, "../admin/views/profile/index.jsp");
                break;
            case "/admin/booking":
                view(request, response, "../admin/views/booking/index.jsp");
                break;
            case "/admin/rooms-rates":
                view(request, response, "../admin/views/roomRates/index.jsp");
                break;
            case "/admin/promotion":
                view(request, response, "../admin/views/promotion/index.jsp");
                break;
            case "/admin/extras":
                view(request, response, "../admin/views/extras/index.jsp");
                break;

        }
    }

    public void view(HttpServletRequest request, HttpServletResponse response, String pathView) throws ServletException, IOException  {
        if(checkSession.getAttribute("sessionsAdmin") != null) {
            RequestDispatcher header = request.getRequestDispatcher("../admin/component/header.jsp");
            header.include( request, response );
            RequestDispatcher sidebar = request.getRequestDispatcher("../admin/component/sidebar.jsp");
            sidebar.include( request, response );
            RequestDispatcher main = request.getRequestDispatcher(pathView);
            main.include( request, response );
            RequestDispatcher footer = request.getRequestDispatcher("../admin/component/footer.jsp");
            footer.include( request, response );
            return;
        }
        response.sendRedirect("/admin/login");
        RequestDispatcher login = request.getRequestDispatcher("../admin/views/login/index.jsp");
        login.include( request, response );
    }

}
