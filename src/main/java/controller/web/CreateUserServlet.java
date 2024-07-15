package controller.web;

import DAO.impl.EditUserDAOImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

import java.io.IOException;


@WebServlet("/CreateUser")
public class CreateUserServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String fullName = request.getParameter("fullName");
        String password = request.getParameter("password");
        String avatar = request.getParameter("avatar");
        String phone = request.getParameter("phone");
        int role = Integer.parseInt(request.getParameter("role"));
        int status = Integer.parseInt(request.getParameter("status"));
        String code = request.getParameter("code");

        User user = new User(username, email, fullName, password, avatar, phone, role, status, code);

        EditUserDAOImpl userDAO = new EditUserDAOImpl();
        userDAO.createUser(user);

        response.sendRedirect("ListUsers"); // Redirect to the user list page
    }
}