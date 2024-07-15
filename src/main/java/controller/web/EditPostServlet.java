package controller.web;

import DAO.impl.PostDAOImpl;
import model.Post;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/EditPost")
public class EditPostServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve parameters from the form
        int postId = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String content = request.getParameter("content");

        // Assume you have stored user ID in the session or passed it as a parameter
        int userId = Integer.parseInt(request.getParameter("idUser"));

        // Create a Post object with updated data
        Post updatedPost = new Post(postId, title, content, userId);

        // Update the post in the database
        PostDAOImpl postDAO = new PostDAOImpl();
        try {
            postDAO.updatePost(updatedPost);
            response.sendRedirect(request.getContextPath() + "/listpost");
        } catch (SQLException e) {
            throw new ServletException("Error updating post", e);
        }
    }
}
