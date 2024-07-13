package controller.web;

import DAO.impl.ItemDAOImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Course;
import model.User;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = {"/cart", "/removecart"})
public class CartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getRequestURI();
        if (url.endsWith("/cart")) {
            viewCart(request, response);
        } else if (url.endsWith("/removecart")) {
            removeCart(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    private void viewCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login"); // sửa lại url pattern cho đúng theo dự án
            return;
        }

        // Retrieve cookies
        Cookie[] cookies = request.getCookies();
        String cartValue = "";
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("cart".equals(cookie.getName())) {
                    cartValue = cookie.getValue();
                    break;
                }
            }
        }

        List<String> listid = new ArrayList<>();
        if (!cartValue.isEmpty()) {
            String[] items = cartValue.split("_");
            for (int i = 0; i < items.length; i++) {
                if (i % 2 == 0 && user.getUsername().equals(items[i])) {
                    listid.add(items[i + 1]);
                }
            }
        }

        ItemDAOImpl itemdao = new ItemDAOImpl();
        List<Course> courses = new ArrayList<>();
        for (String id : listid) {
            courses.add(itemdao.getCourseById(Integer.parseInt(id)));
        }

        request.setAttribute("cartCourses", courses);
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }

    private void removeCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login"); // sửa lại url pattern cho đúng theo dự án
            return;
        }

        // Retrieve cookies
        Cookie[] cookies = request.getCookies();

        String cartValue = "";
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("cart".equals(cookie.getName())) {
                    cartValue = cookie.getValue();
                    break;
                }
            }
        }
        String newcookie="";
        String idToRemove = request.getParameter("id");
        if (!cartValue.isEmpty()) {
            String[] items = cartValue.split("_");
            for (int i = 0; i < items.length-1; i++) {
                if (i % 2 == 0 && user.getUsername().equals(items[i])) {
                    if (!items[i + 1].equals(idToRemove)) {
                        newcookie = newcookie + items[i] + "_" + items[i+1] + "_";
                    }
                }
            }
        }
        Cookie cartCookie = new Cookie("cart", "");
        cartCookie.setValue(newcookie);
        cartCookie.setMaxAge(60 * 60 * 24 * 30); // Cookie valid for 30 day
        response.addCookie(cartCookie);
        response.sendRedirect("cart");
    }
}