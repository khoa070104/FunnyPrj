//package controller.web;
//
//import DAO.impl.SearchDAOImpl;
//import jakarta.servlet.http.HttpSession;
//import model.Course;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//import java.io.IOException;
//import java.util.List;
//
//@WebServlet("/searchCourses")
//public class SearchServlet extends HttpServlet {
//
//    private SearchDAOImpl searchDAO = new SearchDAOImpl(); // Tạo đối tượng SearchDAO để gọi các phương thức tìm kiếm
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.getRequestDispatcher("search.jsp").forward(request,response);
//    }
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        // Reset lại dữ liệu tìm kiếm
//        request.removeAttribute("courses");
//        request.removeAttribute("message");
//        request.removeAttribute("error");
//
//        // Lấy tham số tìm kiếm từ request
//        String searchQuery = request.getParameter("search");
//
//        if (searchQuery == null || searchQuery.trim().isEmpty()) {
//            // Nếu tham số tìm kiếm rỗng, hiển thị thông báo lỗi
//            request.setAttribute("message", "Search query cannot be empty.");
//            request.getRequestDispatcher("/search.jsp").forward(request, response);
//            return;
//        }
//
//        try {
//            // Gọi DAO để tìm kiếm khóa học
//            List<Course> courses = searchDAO.searchCourses(searchQuery);
//            HttpSession s = request.getSession();
//            if(s.getAttribute("courses") != null)
//                s.removeAttribute("courses");
//            // Nếu danh sách khóa học rỗng, hiển thị thông báo không tìm thấy
//            if (courses.isEmpty()) {
//                s.setAttribute("message", "No courses found.");
//            } else {
//                // Đặt danh sách khóa học vào request
//                s.setAttribute("courses", courses);
//            }
//
//            // Chuyển tiếp đến search.jsp
//            response.sendRedirect(request.getContextPath() +"/searchCourses");
//        } catch (Exception e) {
//            e.printStackTrace();
//            // Xử lý lỗi cơ sở dữ liệu và chuyển tiếp đến JSP với thông báo lỗi
//            request.setAttribute("error", "Database error: " + e.getMessage());
//            request.getRequestDispatcher("/search.jsp").forward(request, response);
//        }
//    }
//}
