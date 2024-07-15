//package controller.web;
//
//import DAO.impl.EditUserDAOImpl;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import model.User;
//
//import java.io.IOException;
//import java.util.List;
//
//@WebServlet(urlPatterns = {"/ListUsers"})
//public class ListUsersServlet extends HttpServlet {
//
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        EditUserDAOImpl editUserDAO = new EditUserDAOImpl();
//        List<User> userList = editUserDAO.getAllUsers();
//
//        // Set attribute in request scope to be accessed in JSP
//        request.setAttribute("userList", userList);
//
//        // Forward to JSP page to display the user list
//        request.getRequestDispatcher("/listusers.jsp").forward(request, response);
//    }
//}
