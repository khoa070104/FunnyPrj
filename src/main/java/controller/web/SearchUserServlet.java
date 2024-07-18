package controller.web;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.User;
import DAO.impl.SearchUserDAOImpl;

@WebServlet("/searchUser")
public class SearchUserServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SearchUserDAOImpl searchUserDAO = new SearchUserDAOImpl();

        // Lấy danh sách tất cả người dùng
        List<User> allUsers = searchUserDAO.getAllUsers();

        // Đặt attribute cho danh sách tất cả người dùng
        request.setAttribute("allUsers", allUsers);

        // Forward đến JSP để hiển thị form tìm kiếm và danh sách người dùng
        request.getRequestDispatcher("/searchuser.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy email từ form
        String email = request.getParameter("email");

        // Gọi DAO để tìm kiếm người dùng theo email
        SearchUserDAOImpl searchUserDAO = new SearchUserDAOImpl();
        List<User> allUsers = searchUserDAO.getUserByEmail(email);
            request.setAttribute("userList", allUsers);

        // Forward đến JSP để hiển thị kết quả
        request.getRequestDispatcher("/searchuser.jsp").forward(request, response);
    }
}

