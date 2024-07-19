//package controller.admin;
//
//import jakarta.servlet.*;
//import jakarta.servlet.http.*;
//import jakarta.servlet.annotation.*;
//import model.User;
//import service.IManagerService;
//import service.IUserService;
//import service.Impl.ManagerService;
//import service.Impl.UserServiceImpl;
//
//import java.io.IOException;
//import java.util.List;
//
//@WebServlet(urlPatterns = {"/list-user","/edit-user","/delete-user","/create-user"})
//public class ManagerUserController extends HttpServlet {
//    IManagerService i = new ManagerService();
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String url = request.getRequestURI().toString();
//        if(url.contains("list-user")){
//            getUser(request,response);
//        } else if(url.contains("edit-user")){
//            getEditUser(request,response);
//        }
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String url = request.getRequestURI().toString();
//        if(url.contains("edit-user")){
//            postEditUser(request,response);
//        } else if(url.contains("delete-user")){
//            postDeleteUser(request,response);
//        } else if(url.contains("create-user")){
//            postCreateUser(request,response);
//        }
//    }
//    protected void getUser(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        List<User> userList = i.getAllUsers();
//
//        // Set attribute in request scope to be accessed in JSP
//        request.setAttribute("userList", userList);
//
//        // Forward to JSP page to display the user list
//        request.getRequestDispatcher("admin/listusers.jsp").forward(request, response);
//    }
//    protected void getEditUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        // Lấy ID của người dùng cần chỉnh sửa từ request parameter
//        String idStr = request.getParameter("id");
//        if (idStr == null || idStr.isEmpty()) {
//            // Xử lý nếu không có ID
//            response.sendRedirect("error.jsp");
//            return;
//        }
//
//        // Chuyển ID sang kiểu int
//        int id = Integer.parseInt(idStr);
//        IUserService u = new UserServiceImpl();
//        User user = u.findOne(id);
//
//        if (user == null) {
//            // Xử lý nếu không tìm thấy người dùng
//            response.sendRedirect("error.jsp");
//            return;
//        }
//
//        // Đặt thuộc tính user vào request scope để hiển thị trên form
//        request.setAttribute("user", user);
//        request.getRequestDispatcher("admin/editUser.jsp").forward(request, response);
//    }
//
//    protected void postEditUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        // Lấy các thông tin từ form chỉnh sửa
//        String id = request.getParameter("id");
//        String username = request.getParameter("username");
//        String email = request.getParameter("email");
//        String fullName = request.getParameter("fullName");
//        String password = request.getParameter("password");
//        String avatar = request.getParameter("avatar");
//        String phone = request.getParameter("phone");
//        int role = Integer.parseInt(request.getParameter("role"));
//        int status = Integer.parseInt(request.getParameter("status"));
//        String code = request.getParameter("code");
//
//        // Khởi tạo đối tượng User và thiết lập các thuộc tính
//        User user = new User();
//        user.setId(Integer.parseInt(id));
//        user.setUsername(username);
//        user.setEmail(email);
//        user.setFullName(fullName);
//        user.setPassword(password);  // Hash mật khẩu trước khi lưu vào DB
//        user.setAvatar(avatar);
//        user.setPhone(phone);
//        user.setRole(role);
//        user.setStatus(status);
//        user.setCode(code);
//
//        boolean success = i.updateUser(user);
//
//        if (success) {
//            // Chuyển hướng đến trang danh sách người dùng
//            response.sendRedirect("list-user");
//        } else {
//            // Xử lý lỗi (có thể chuyển hướng đến trang lỗi hoặc thông báo lỗi)
//            response.sendRedirect("error.jsp");
//        }
//    }
//    protected void postDeleteUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
//        // Lấy userId từ request
//        int userId = Integer.parseInt(request.getParameter("id"));
//
//        // Gọi phương thức xóa người dùng từ DAO
//        boolean deleted = i.deleteUser(userId);
//
//        if (deleted) {
//            // Nếu xóa thành công, có thể thực hiện các hành động khác (ví dụ: redirect đến trang danh sách người dùng)
//            response.sendRedirect(request.getContextPath() + "/list-user"); // Thay đổi đường dẫn tuỳ theo cấu hình của bạn
//        } else {
//            // Nếu không thành công, có thể xử lý và hiển thị thông báo lỗi
//            response.getWriter().println("Failed to delete user with ID: " + userId);
//        }
//    }
//    protected void postCreateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String username = request.getParameter("username");
//        String email = request.getParameter("email");
//        String fullName = request.getParameter("fullName");
//        String password = request.getParameter("password");
//        String avatar = request.getParameter("avatar");
//        String phone = request.getParameter("phone");
//        int role = Integer.parseInt(request.getParameter("role"));
//        int status = Integer.parseInt(request.getParameter("status"));
//        String code = request.getParameter("code");
//
//        User user = new User(username, email, fullName, password, avatar, phone, role, status, code);
//        i.createUser(user);
//
//        response.sendRedirect("list-user"); // Redirect to the user list page
//    }
//}
