//package controller.web;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.MultipartConfig;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//import jakarta.servlet.http.Part;
//import model.User;
//import service.IUserService;
//import service.Impl.UserServiceImpl;
//
////import java.io.IOException;
////import java.nio.file.Files;
////import java.nio.file.Paths;
////
////@MultipartConfig(maxFileSize = 10 * 1024 * 1024)
////
////@WebServlet(urlPatterns = {"/update-avatar"})
////public class AvatarServlet {
////    IUserService u = new UserServiceImpl();
////    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
////        String url = request.getRequestURI().toString();
////
////        if(url.contains("profile")){
////            getAvatar(request,response);
////        }
////    }
////
////    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
////        String url = request.getRequestURI().toString();
////        if (url.contains("update-avatar")) {
////            postAvatar(request, response);
////        }
////    }
////
////    protected void getAvatar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
////        request.getRequestDispatcher("profile.jsp").forward(request, response);
////    }
////
////    protected void postAvatar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
////        try {
////            String username = request.getParameter("username");
////            Part part = request.getPart("photo");
////
////            String realPath = request.getServletContext().getRealPath("/webapp/upload");
////            String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
////
////            if(!Files.exists(Paths.get(realPath))){
////                Files.createDirectories(Paths.get(realPath));
////            }
////
////            part.write(realPath + "/" + fileName);
////
////            HttpSession session = request.getSession();
////            User sessionUser = (User) session.getAttribute("user");
////            if (sessionUser != null) {
////                sessionUser.setAvatar("upload/" + fileName); // Cập nhật đường dẫn ảnh mới vào đối tượng User
////                session.setAttribute("user", sessionUser); // Lưu lại thông tin User vào session
////            }
////
////            response.sendRedirect("profile.jsp"); // Chuyển hướng về trang profile.jsp sau khi upload thành công
////
////        } catch (Exception e) {
////            e.printStackTrace();
////            response.getWriter().println("Lỗi khi upload file: " + e.getMessage());
////        }
////    }
////}
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.MultipartConfig;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//import jakarta.servlet.http.Part;
//import model.User;
//import service.IUserService;
//import service.Impl.UserServiceImpl;
//import DAO.impl.AvatarDAOImpl; // Import AvatarDAOImpl
//
//import java.io.IOException;
//import java.nio.file.Files;
//import java.nio.file.Paths;
//
//@MultipartConfig(maxFileSize = 10 * 1024 * 1024) // Giới hạn kích thước file tối đa là 10MB
//
//@WebServlet("/update-avatar")
//public class AvatarServlet extends HttpServlet {
//    private static final long serialVersionUID = 1L;
//
//    private IUserService userService = new UserServiceImpl();
//    private AvatarDAOImpl avatarDAO = new AvatarDAOImpl(); // Khởi tạo đối tượng AvatarDAOImpl
//
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.getRequestDispatcher("profile.jsp").forward(request, response);
//    }
//
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        try {
//            String username = request.getParameter("username");
//            Part part = request.getPart("photo");
//
//            // Thư mục lưu trữ ảnh upload trong ứng dụng
//            String uploadPath = request.getServletContext().getRealPath("/upload");
//            String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
//
//            // Tạo thư mục upload nếu chưa tồn tại
//            if (!Files.exists(Paths.get(uploadPath))) {
//                Files.createDirectories(Paths.get(uploadPath));
//            }
//            // Lưu file ảnh vào thư mục upload
//            part.write(uploadPath + "/" + fileName);
//
//            // Cập nhật đường dẫn ảnh mới vào đối tượng User trong session
//            HttpSession session = request.getSession();
//            User sessionUser = (User) session.getAttribute("user");
//            if (sessionUser != null) {
//                sessionUser.setAvatar("upload/" + fileName);
//                session.setAttribute("user", sessionUser); // Lưu lại thông tin User vào session
//                avatarDAO.updateAvatar(sessionUser); // Cập nhật đường dẫn ảnh mới vào cơ sở dữ liệu
//            }
//
//            response.sendRedirect("profile.jsp");
//
//        } catch (Exception e) {
//            e.printStackTrace();
//            response.getWriter().println("Lỗi khi upload file: " + e.getMessage());
//        }
//    }
//}
//
