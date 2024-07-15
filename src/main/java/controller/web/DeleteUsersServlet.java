//package controller.web;
//
//import DAO.impl.EditUserDAOImpl;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import java.io.IOException;
//
//@WebServlet(urlPatterns = {"/DeleteUser"})
//public class DeleteUsersServlet extends HttpServlet {
//
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        EditUserDAOImpl userDao = new EditUserDAOImpl();
//        // Lấy userId từ request
//        int userId = Integer.parseInt(request.getParameter("id"));
//
//        // Gọi phương thức xóa người dùng từ DAO
//        boolean deleted = userDao.deleteUser(userId);
//
//        if (deleted) {
//            // Nếu xóa thành công, có thể thực hiện các hành động khác (ví dụ: redirect đến trang danh sách người dùng)
//            response.sendRedirect(request.getContextPath() + "/ListUsers"); // Thay đổi đường dẫn tuỳ theo cấu hình của bạn
//        } else {
//            // Nếu không thành công, có thể xử lý và hiển thị thông báo lỗi
//            response.getWriter().println("Failed to delete user with ID: " + userId);
//        }
//    }
//}
