package controller.web;

import DAO.impl.ItemDAOImpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import model.Category;
import model.Course;
import model.User;
import service.IItemService;
import service.IUserService;
import service.Impl.ItemServiceImpl;
import service.Impl.UserServiceImpl;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
@MultipartConfig(maxFileSize = 1024 * 1024 * 10)
@WebServlet(urlPatterns = {"/list","/search","/update-avatar"})
public class FeatureController extends HttpServlet {
    //private AvatarDAOImpl avatarDAO = new AvatarDAOImpl();
    IItemService itemDAO = new ItemServiceImpl();
    IUserService userService = new UserServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getRequestURI().toString();

        if(url.contains("list")){
            getList(request,response);
        } else if(url.contains("search")){
            request.getRequestDispatcher("search.jsp").forward(request,response);
        } else if (url.contains("update-avatar")) {
            request.getRequestDispatcher("profile.jsp").forward(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getRequestURI().toString();

        if(url.contains("list")){
            postList(request,response);
        } else if(url.contains("search")){
            postSearch(request,response);
        } else if(url.contains("update-avatar")){
            postAvatar(request,response);
        }
    }

    protected void getList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Category> list = itemDAO.getAll();
        HttpSession session = request.getSession();
        session.setAttribute("categories", list);
        response.sendRedirect("allcourse.jsp");
    }

    protected void postList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ItemDAOImpl itemDAO = new ItemDAOImpl();

        // Lấy giá trị typeCourse từ request parameter
        String cid_raw = request.getParameter("id_category");
        int cid = 0;
        try {
            cid = (cid_raw == null) ? 0 : Integer.parseInt(cid_raw);
        } catch (NumberFormatException e) {
            // Xử lý ngoại lệ khi không thể chuyển đổi thành số nguyên
            e.printStackTrace();
        }

        // Lọc các khóa học dựa trên categoryId và typeCourse (nếu có)
        List<Course> courses = itemDAO.filterCoursesByCriteria(cid);

        // Lưu danh sách khóa học đã lọc vào request attribute để truyền đến JSP
        request.setAttribute("courses", courses);

        // Lưu lại các giá trị lọc để hiển thị lại trên giao diện
        request.setAttribute("cid", cid);

        // Điều hướng đến trang filter.jsp để hiển thị kết quả lọc
        request.getRequestDispatcher("allcourse.jsp").forward(request, response);
    }

    protected void postSearch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Reset lại dữ liệu tìm kiếm
        request.removeAttribute("courses");
        request.removeAttribute("message");
        request.removeAttribute("error");

        // Lấy tham số tìm kiếm từ request
        String searchQuery = request.getParameter("search");

        if (searchQuery == null || searchQuery.trim().isEmpty()) {
            // Nếu tham số tìm kiếm rỗng, hiển thị thông báo lỗi
            request.setAttribute("message", "Search query cannot be empty.");
            request.getRequestDispatcher("/search.jsp").forward(request, response);
            return;
        }

        try {
            // Gọi DAO để tìm kiếm khóa học
            List<Course> courses = itemDAO.searchCourses(searchQuery);
            HttpSession s = request.getSession();
            if(s.getAttribute("courses") != null)
                s.removeAttribute("courses");
            // Nếu danh sách khóa học rỗng, hiển thị thông báo không tìm thấy
            if (courses.isEmpty()) {
                s.setAttribute("message", "No courses found.");
            } else {
                // Đặt danh sách khóa học vào request
                s.setAttribute("courses", courses);
            }

            // Chuyển tiếp đến search.jsp
            response.sendRedirect(request.getContextPath() +"/search");
        } catch (Exception e) {
            e.printStackTrace();
            // Xử lý lỗi cơ sở dữ liệu và chuyển tiếp đến JSP với thông báo lỗi
            request.setAttribute("error", "Database error: " + e.getMessage());
            request.getRequestDispatcher("/search.jsp").forward(request, response);
        }
    }
    protected void postAvatar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String username = request.getParameter("username");
            Part part = request.getPart("photo");

            // Thư mục lưu trữ ảnh upload trong ứng dụng
            String uploadPath = request.getServletContext().getRealPath("/upload");
            String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();

            // Tạo thư mục upload nếu chưa tồn tại
            if (!Files.exists(Paths.get(uploadPath))) {
                Files.createDirectories(Paths.get(uploadPath));
            }
            // Lưu file ảnh vào thư mục upload
            part.write(uploadPath + "/" + fileName);

            // Cập nhật đường dẫn ảnh mới vào đối tượng User trong session
            HttpSession session = request.getSession();
            User sessionUser = (User) session.getAttribute("user");
            if (sessionUser != null) {
                sessionUser.setAvatar("upload/" + fileName);
                session.setAttribute("user", sessionUser); // Lưu lại thông tin User vào session
                userService.updateAvatar(sessionUser); // Cập nhật đường dẫn ảnh mới vào cơ sở dữ liệu
            }

            response.sendRedirect("profile.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Lỗi khi upload file: " + e.getMessage());
        }
    }


}
