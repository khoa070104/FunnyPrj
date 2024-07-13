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

@WebServlet("/FilterCourseDetail")
public class FilterCourseDetailServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve course ID from request parameter
        int courseId = Integer.parseInt(request.getParameter("id"));
        HttpSession session = request.getSession();
        if(session.getAttribute("id_convert") != null) {
            session.removeAttribute("id_convert");
        }
        session.setAttribute("id_convert", courseId);

        // Use DAO to fetch course details from the database
        LessonDAOImpl courseDAO = new LessonDAOImpl(); // Adjust to your actual DAO implementation
        CourseDetail course = courseDAO.getCourseById(courseId);

        // Set course object as attribute in request scope
        request.setAttribute("course", course);

        List<Lesson> lessons = courseDAO.getLessonsByCourseId(courseId);

        request.setAttribute("lessons", lessons);

        // Forward to JSP to render course details
        request.getRequestDispatcher("edit_course_detail.jsp").forward(request,response);
    }
}

