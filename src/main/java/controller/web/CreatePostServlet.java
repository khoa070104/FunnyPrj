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

@WebServlet("/CreatePost")
public class CreatePostServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve data from the form
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        int idUser = Integer.parseInt(request.getParameter("idUser")); // Assuming you pass user ID from session or form

        // Create a new Post object
        Post newPost = new Post();
        newPost.setTitle(title);
        newPost.setContent(content);
        newPost.setIdUser(idUser); // Set the ID of the user creating the post

        // Call DAO to add the post to the database
        PostDAOImpl postDAO = new PostDAOImpl();
        try {
            postDAO.addPost(newPost);
            response.sendRedirect(request.getContextPath() + "/listpost"); // Redirect to the post list page
        } catch (SQLException e) {
            throw new ServletException("Error adding post", e);
        }
    }
}
