package controller.web;

import DAO.IUserDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.User;
import service.IUserService;
import service.Impl.UserServiceImpl;

import java.io.IOException;

@WebServlet(urlPatterns = {"/profile","/update-profile"})
public class UserController extends HttpServlet {
    IUserService u = new UserServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getRequestURI().toString();

        if(url.contains("profile")){
            getProfile(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Your code here
        String url = request.getRequestURI().toString();
        if(url.contains("update-profile")){
            postProfile(request,response);
        }
    }

    protected void getProfile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("profile.jsp").forward(request,response);
    }
    protected void postProfile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullName = request.getParameter("fullname");
        String phone = request.getParameter("phone");
        String username = request.getParameter("username");
        User user = new User(username,fullName,phone);
        u.updateProfile(user);
        HttpSession s = request.getSession();
        User sessionUser = (User) s.getAttribute("user");
        if (s != null) {
            sessionUser.setFullName(fullName);
            sessionUser.setPhone(phone);
            s.setAttribute("user", sessionUser);
        }

        response.sendRedirect("profile");
    }
}
