//package controller.web;
//
//import DAO.impl.PostDAOImpl;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//import java.io.IOException;
//import java.sql.SQLException;
//
//@WebServlet("/deletePost")
//public class DeletePostServlet extends HttpServlet {
//
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        // Lấy postId từ request
//        PostDAOImpl postDAO = new PostDAOImpl();
//        int postId = Integer.parseInt(request.getParameter("id"));
//
//        try {
//            postDAO.deletePost(postId);
//            response.sendRedirect(request.getContextPath() + "/listpost");
//        } catch (SQLException e) {
//            throw new ServletException("Error deleting post", e);
//        }
//    }
//}
