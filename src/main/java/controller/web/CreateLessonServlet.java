package controller.web;

import DAO.impl.LessonDAOImpl;
import jakarta.servlet.http.HttpSession;
import model.detail.Lesson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/CreateLesson")
public class CreateLessonServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Chuyển tiếp đến trang create_lesson.jsp để hiển thị form
        request.getRequestDispatcher("FilterCourseDetail.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String courseID_raw = request.getParameter("courseId");
        String lessonName = request.getParameter("lessonName");
        String content = request.getParameter("content");
        String lessonTime = request.getParameter("lessonTime");
        try {
            int courseId = Integer.parseInt(courseID_raw);
            // Lấy các tham số từ request

            //System.out.println(courseID);
            // Tạo đối tượng Lesson mới và gán giá trị từ request
            // int id, String nameLesson, int idCourse, String content, String timeLesson
            Lesson lesson = new Lesson();
            lesson.setNameLesson(lessonName);
            lesson.setContent(content);
            lesson.setTimeLesson(lessonTime);
            lesson.setIdCourse(courseId);
            // Sử dụng DAO để lưu lesson vào cơ sở dữ liệu
            LessonDAOImpl lessonDAO = new LessonDAOImpl();
            lessonDAO.createLesson(lesson);
            // Chuyển hướng đến trang xác nhận hoặc trang khác sau khi tạo bài học thành công
            HttpSession session = request.getSession();
            int id = (int) session.getAttribute("id_convert");
            response.sendRedirect("FilterCourseDetail?id="+id); // Thay đổi URL thành trang bạn muốn chuyển hướng sau khi tạo thành công
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
