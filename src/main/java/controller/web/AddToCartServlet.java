package controller.web;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.User;

import java.io.IOException;

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = null;
        user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login");// sửa lại url parttent cho đúng theo dự án
        }
        String courseId = request.getParameter("courseId");

        // Retrieve cookies
        Cookie[] cookies = request.getCookies();
        Cookie cartCookie = null;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("cart")) {
                    cartCookie = cookie;
                    break;
                }
            }
        }

        // Create a new cookie if it doesn't exist
        if (cartCookie == null) {
            cartCookie = new Cookie("cart", "");
        }

        // Append new courseId to the cart cookie value
        String cartValue = cartCookie.getValue();
        if (cartValue.isEmpty()) {
            cartValue = user.getUsername() + "_" + courseId;
        } else {
            cartValue += "_" + user.getUsername() + "_" + courseId;
        }
            String[] coursesitemlist = cartValue.split("_");
            int count = coursesitemlist.length / 2;
            cartCookie.setValue(cartValue);
            cartCookie.setMaxAge(60 * 60 * 24 * 30); // Cookie valid for 30 day
            response.addCookie(cartCookie);
            session.setAttribute("countcart", count);
            // Redirect to home page or cart page
            response.sendRedirect("home");// này sao k dùng getRequestDispatcher í như này nó reload trang mất

    }
}