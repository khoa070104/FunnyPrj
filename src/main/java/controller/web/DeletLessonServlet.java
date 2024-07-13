
package controller.web;

import DAO.impl.LessonDAOImpl;
import jakarta.servlet.*;
        import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

        import java.io.IOException;

@WebServlet("/DeleteLesson")
public class DeletLessonServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy lessonId từ request parameter
        int lessonId = Integer.parseInt(request.getParameter("lessonId"));

        // Gọi DAO để xóa lesson từ cơ sở dữ liệu
        LessonDAOImpl lessonDAO = new LessonDAOImpl();
        boolean deleted = lessonDAO.deleteLesson(lessonId);

        if (deleted) {
            HttpSession session = request.getSession();
            int id = (int) session.getAttribute("id_convert");
            response.sendRedirect("FilterCourseDetail?id="+id);
        } else {
            // Xử lý trường hợp xóa không thành công (có thể thông báo lỗi cho người dùng)
            response.getWriter().println("Failed to delete lesson with ID " + lessonId);
        }
    }
}
