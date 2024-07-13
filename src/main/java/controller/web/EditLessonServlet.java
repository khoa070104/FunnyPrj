package controller.web;

import DAO.impl.LessonDAOImpl;
import model.detail.Lesson;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/EditLesson")
public class EditLessonServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        try {
//            // Lấy lessonId từ tham số yêu cầu
//            int lessonId = Integer.parseInt(request.getParameter("lessonId"));
//
//            LessonDAOImpl lessonDAO = new LessonDAOImpl();
//            Lesson lesson = lessonDAO.getLessonById(lessonId);
//
//                request.setAttribute("lesson", lesson);
//
//                request.getRequestDispatcher("FilterCourseDetail").forward(request, response);
//        } catch (Exception e) {
//            e.printStackTrace();
//            response.getWriter().println("Error: " + e.getMessage());
//        }
        try {
            // Lấy các tham số từ request
            int lessonId = Integer.parseInt(request.getParameter("lessonId"));
            //int courseId = 3;
            String lessonName = request.getParameter("lessonName");
            String content = request.getParameter("content");
            String lessonTime = request.getParameter("lessonTime");

            Lesson lesson = new Lesson(lessonId,lessonName,content,lessonTime);

            LessonDAOImpl lessonDAO = new LessonDAOImpl();
            lessonDAO.editLesson(lesson);
//            HttpSession session = request.getSession();
//            if (session.getAttribute("lessons") != null) {
//                session.removeAttribute("lessons");
//            }
            request.setAttribute("lessons", lesson);HttpSession session = request.getSession();
            int id = (int) session.getAttribute("id_convert");

            request.getRequestDispatcher("FilterCourseDetail?id="+id).forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Lấy các tham số từ request
            int lessonId = Integer.parseInt(request.getParameter("lessonId"));
            //int courseId = 3;
            String lessonName = request.getParameter("lessonName");
            String content = request.getParameter("content");
            String lessonTime = request.getParameter("lessonTime");

            Lesson lesson = new Lesson(lessonId,lessonName,content,lessonTime);

            LessonDAOImpl lessonDAO = new LessonDAOImpl();
            lessonDAO.editLesson(lesson);
//            HttpSession session = request.getSession();
//            if (session.getAttribute("lessons") != null) {
//                session.removeAttribute("lessons");
//            }
            request.setAttribute("lessons", lesson);HttpSession session = request.getSession();
            int id = (int) session.getAttribute("id_convert");

            request.getRequestDispatcher("FilterCourseDetail?id="+id).forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
