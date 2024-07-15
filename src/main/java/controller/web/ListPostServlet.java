package controller.web;

import DAO.impl.PostDAOImpl;
import jakarta.servlet.http.HttpSession;
import model.Post;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(urlPatterns = {"/listpost"})
public class ListPostServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PostDAOImpl postDAO = new PostDAOImpl();
        List<Post> posts = null;
        try {
            posts = postDAO.getAllPosts();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        HttpSession session = request.getSession();
        if(session.getAttribute("posts") != null) {
            session.removeAttribute("posts");
        }
        session.setAttribute("posts", posts);
        request.getRequestDispatcher("/post.jsp").forward(request, response);
    }
}
