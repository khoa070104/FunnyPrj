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

@WebServlet(urlPatterns = {"/cart", "/removecart","/add-to-cart", "/payment-success"})
public class CartController extends HttpServlet {

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
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getRequestURI();
        if (url.endsWith("/add-to-cart")) {
            postAddToCart(request, response);
        }
    }
    protected void postAddToCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
        int count = 0;

        if (!cartValue.isEmpty()) {
            String[] items = cartValue.split("_");
            for (int i = 0; i < items.length; i++) {
                if (i % 2 == 0 && user.getUsername().equals(items[i])) {
                    count++;
                }
            }
        }

        cartCookie.setValue(cartValue);
        cartCookie.setMaxAge(60 * 60 * 24 * 30); // Cookie valid for 30 day
        response.addCookie(cartCookie);
        session.setAttribute("countcart", count);
        // Redirect to home page or cart page
        response.sendRedirect("home");// này sao k dùng getRequestDispatcher í như này nó reload trang mất

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
            response.sendRedirect("login.jsp"); // Sửa lại URL pattern cho đúng theo dự án
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

        String newCookieValue = "";
        String idToRemove = request.getParameter("id");
        if (!cartValue.isEmpty()) {
            String[] items = cartValue.split("_");
            for (int i = 0; i < items.length - 1; i += 2) {
                if (user.getUsername().equals(items[i])) {
                    if (!items[i + 1].equals(idToRemove)) {
                        newCookieValue += items[i] + "_" + items[i + 1] + "_";
                    }
                } else {
                    newCookieValue += items[i] + "_" + items[i + 1] + "_";
                }
            }

            // Remove trailing underscore if present
            if (newCookieValue.endsWith("_")) {
                newCookieValue = newCookieValue.substring(0, newCookieValue.length() - 1);
            }
        }

        // Update session attribute countcart
        Integer countCart = (Integer) session.getAttribute("countcart");
        if (countCart != null && countCart > 0) {
            session.setAttribute("countcart", countCart - 1);
        }

        // Update the cart cookie
        Cookie cartCookie = new Cookie("cart", newCookieValue);
        cartCookie.setMaxAge(60 * 60 * 24 * 30); // Cookie valid for 30 days
        response.addCookie(cartCookie);

        response.sendRedirect("cart"); // Sửa lại URL pattern cho đúng theo dự án
    }

}