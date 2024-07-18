package controller.web;

import DAO.impl.UserDaoImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Post;
import model.User;
import service.ICommunityService;
import service.Impl.ComunityServiceImpl;

import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/profileother"})
public class ProfileOtherServlet extends HttpServlet {
    ICommunityService i = new ComunityServiceImpl() ;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userIdStr = request.getParameter("userid");
        if (userIdStr == null || userIdStr.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/searchuser.jsp");
            return;
        }

        try {
            int userId = Integer.parseInt(userIdStr);
            UserDaoImpl userService = new UserDaoImpl();
            User userOther = userService.findOne(userId);
            List<Post> posts = i.getPostsByUserId(userId);
//            for (Post post : posts) {
//                System.out.println(post);
//            }
            HttpSession session = request.getSession();
            if(session.getAttribute("posts") != null) {
                session.removeAttribute("posts");
            }
            session.setAttribute("posts", posts);
            if (userOther != null) {
                request.setAttribute("profileUser", userOther);
                request.getRequestDispatcher("/profileother.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "User not found!");
                request.getRequestDispatcher("/searchuser.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/searchuser.jsp");
        }
    }
}
