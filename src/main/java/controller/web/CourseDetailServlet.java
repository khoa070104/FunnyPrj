package controller.web;

import DAO.impl.LessonDAOImpl;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import model.Course;
import model.detail.CourseDetail;
import model.detail.Lesson;

import java.io.IOException;
import java.util.List;

@WebServlet("/CourseDetail")
public class CourseDetailServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve course ID from request parameter
       int courseId = Integer.parseInt(request.getParameter("id"));
        // Use DAO to fetch course details from the database
        LessonDAOImpl courseDAO = new LessonDAOImpl(); // Adjust to your actual DAO implementation
        CourseDetail course = courseDAO.getCourseById(courseId);

        // Set course object as attribute in request scope
        request.setAttribute("course", course);

        LessonDAOImpl lessonDAO = new LessonDAOImpl();
        List<Lesson> lessons = lessonDAO.getLessonsByCourseId(courseId);

        request.setAttribute("lessons", lessons);

        // Forward to JSP to render course details
        request.getRequestDispatcher("course_detail.jsp").forward(request,response);
    }
}
