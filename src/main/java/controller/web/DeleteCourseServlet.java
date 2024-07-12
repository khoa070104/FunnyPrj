package controller.web;

import DAO.impl.ItemDAOImpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/DeleteCourse")
public class DeleteCourseServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward the request to doPost method
        ItemDAOImpl itemDAO = new ItemDAOImpl();

        // Lấy giá trị courseId từ request parameter để xóa khóa học
        String deleteCourseId = request.getParameter("id");
        //if (deleteCourseId != null) {
        try {
            int courseId = Integer.parseInt(deleteCourseId);
            itemDAO.deleteCourse(courseId);
        } catch (NumberFormatException e) {
            // Xử lý ngoại lệ khi không thể chuyển đổi thành số nguyên
            e.printStackTrace();
        }
        //}

        // Điều hướng lại về trang editcourse.jsp sau khi xóa thành công
        response.sendRedirect("editcourse.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
