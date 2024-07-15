//package controller.web;
//
//import DAO.impl.CommentDAOImpl;
//import DAO.impl.PostDAOImpl;
//import jakarta.servlet.http.HttpSession;
//import model.Comment;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import model.Post;
//
//import java.io.IOException;
//import java.sql.SQLException;
//import java.time.LocalDateTime;
//import java.time.format.DateTimeFormatter;
//import java.util.List;
//
//@WebServlet(urlPatterns = {"/listcomment"})
//public class CommentServlet extends HttpServlet {
//
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        CommentDAOImpl commentDAO = new CommentDAOImpl();
//        PostDAOImpl postDAO = new PostDAOImpl();
//        String id_raw = request.getParameter("id");
//        Post p = new Post();
//        List<Comment> comments = null;
//        System.out.println("ok");
//        try {
//            int id = Integer.parseInt(id_raw);
//            comments = commentDAO.getCommentById(id);
//            p = postDAO.getPostById(id);
//            System.out.println("ok2");
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        HttpSession session = request.getSession();
//        if(session.getAttribute("comments") != null) {
//            session.removeAttribute("comments");
//            System.out.println("ok3");
//        }
//        if(session.getAttribute("post") != null) {
//            session.removeAttribute("post");
//        }
//        session.setAttribute("post",p);
//        session.setAttribute("comments", comments);
//        request.getRequestDispatcher("comment.jsp").forward(request, response);
//    }
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//        LocalDateTime now = LocalDateTime.now();
//
//        // Định dạng ngày giờ theo pattern mong muốn
//        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
//        String formattedDateTime = now.format(formatter);
//        String message = request.getParameter("message");
//        int idUser = Integer.parseInt(request.getParameter("idUser"));
//        int idPost = Integer.parseInt(request.getParameter("idPost"));
//
//        Comment newComment = new Comment();
//        newComment.setMessage(message);
//        newComment.setCreatedDate(formattedDateTime); // Lấy thời gian hiện tại và chuyển thành chuỗi
//        newComment.setIdUser(idUser);
//        newComment.setIdPost(idPost);
//
//        //HttpSession s = request.getSession();
//
//        CommentDAOImpl commentDAO = new CommentDAOImpl();
//        try {
//            commentDAO.addComment(newComment);
//            int postId = Integer.parseInt(request.getParameter("idPost"));
////            if(s.getAttribute("comments") != null) {
////                s.removeAttribute("comments");
////            }
//            //s.setAttribute("comments", commentDAO.getCommentById(idPost));
//            response.sendRedirect(request.getContextPath() + "/listcomment?id=" + postId);
//        } catch (SQLException e) {
//            throw new ServletException("Error adding comment", e);
//        }
//    }
//}
