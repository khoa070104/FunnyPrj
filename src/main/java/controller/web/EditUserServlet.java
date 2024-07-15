package controller.web;

import java.io.IOException;
import DAO.impl.EditUserDAOImpl;
import DAO.impl.UserDaoImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

@WebServlet("/EditUser")
public class EditUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy ID của người dùng cần chỉnh sửa từ request parameter
        String idStr = request.getParameter("id");
        if (idStr == null || idStr.isEmpty()) {
            // Xử lý nếu không có ID
            response.sendRedirect("error.jsp");
            return;
        }

        // Chuyển ID sang kiểu int
        int id = Integer.parseInt(idStr);

        // Gọi DAO để lấy thông tin người dùng từ ID
        UserDaoImpl userDao = new UserDaoImpl();
        User user = userDao.findOne(id);

        if (user == null) {
            // Xử lý nếu không tìm thấy người dùng
            response.sendRedirect("error.jsp");
            return;
        }

        // Đặt thuộc tính user vào request scope để hiển thị trên form
        request.setAttribute("user", user);
        request.getRequestDispatcher("editUser.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy các thông tin từ form chỉnh sửa
        String id = request.getParameter("id");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String fullName = request.getParameter("fullName");
        String password = request.getParameter("password");
        String avatar = request.getParameter("avatar");
        String phone = request.getParameter("phone");
        int role = Integer.parseInt(request.getParameter("role"));
        int status = Integer.parseInt(request.getParameter("status"));
        String code = request.getParameter("code");

        // Khởi tạo đối tượng User và thiết lập các thuộc tính
        User user = new User();
        user.setId(Integer.parseInt(id));
        user.setUsername(username);
        user.setEmail(email);
        user.setFullName(fullName);
        user.setPassword(password);  // Hash mật khẩu trước khi lưu vào DB
        user.setAvatar(avatar);
        user.setPhone(phone);
        user.setRole(role);
        user.setStatus(status);
        user.setCode(code);

        // Gọi DAO để cập nhật thông tin người dùng
        EditUserDAOImpl userDao = new EditUserDAOImpl();
        boolean success = userDao.updateUser(user);

        if (success) {
            // Chuyển hướng đến trang danh sách người dùng
            response.sendRedirect("ListUsers");
        } else {
            // Xử lý lỗi (có thể chuyển hướng đến trang lỗi hoặc thông báo lỗi)
            response.sendRedirect("error.jsp");
        }
    }
}
