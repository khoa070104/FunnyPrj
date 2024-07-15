//package controller.web;
//
//import DAO.impl.CommentDAOImpl;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//import java.io.IOException;
//import java.sql.SQLException;
//
//@WebServlet("/deleteComment")
//public class DeleteCommentServlet extends HttpServlet {
//
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        // Lấy commentId từ request
//        CommentDAOImpl commentDAO = new CommentDAOImpl();
//        int commentId = Integer.parseInt(request.getParameter("commentId"));
//
//        try {
//            commentDAO.deleteComment(commentId);
//            int postId = Integer.parseInt(request.getParameter("postId")); // Lấy postId từ request
//            response.sendRedirect(request.getContextPath() + "/listcomment?id=" + postId);
//        } catch (SQLException e) {
//            throw new ServletException("Error deleting comment", e);
//        }
//    }
//}
