//package controller.web;
//
//import model.Comment;
//import DAO.impl.CommentDAOImpl;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//import java.io.IOException;
//import java.sql.SQLException;
//import java.time.LocalDateTime;
//import java.time.format.DateTimeFormatter;
//
//@WebServlet("/updateComment")
//public class UpdateCommentServlet extends HttpServlet {
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        CommentDAOImpl commentDAO = new CommentDAOImpl();
//        int commentId = Integer.parseInt(request.getParameter("commentId"));
//        String message = request.getParameter("message");
//        LocalDateTime now = LocalDateTime.now();
//        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
//        String formattedDateTime = now.format(formatter);
//
//        Comment updatedComment = new Comment();
//        updatedComment.setId(commentId);
//        updatedComment.setMessage(message);
//        updatedComment.setCreatedDate(formattedDateTime);
//
//        try {
//            commentDAO.updateComment(updatedComment);
//            int postId = Integer.parseInt(request.getParameter("postId"));
//
//            response.sendRedirect(request.getContextPath() + "/listcomment?id=" + postId);
//        } catch (SQLException e) {
//            throw new ServletException("Error updating comment", e);
//        }
//    }
//}
