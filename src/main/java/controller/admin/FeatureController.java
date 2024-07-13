package controller.admin;

import DAO.impl.DetailDAOImpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.detail.CourseDetail;
import model.detail.Lesson;
import service.*;
import service.Impl.DetailServiceImpl;

import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/CourseDetail", "/CreateLesson", "/DeleteLesson","/EditLesson","/FilterCourseDetail"})
public class FeatureController extends HttpServlet {
    IDetailService i = new DetailServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getRequestURI().toString();

        if(url.contains("CourseDetail")){
            getDetail(request,response);
        } else if(url.contains("CreateLesson")){
            request.getRequestDispatcher("FilterCourseDetail.jsp").forward(request, response);
        }else if(url.contains("EditLesson")){
            getEdit(request,response);
        } else if(url.contains("FilterCourseDetail")){
            getCourseDetail(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getRequestURI().toString();

        if(url.contains("CreateLesson")){
            postCreateLesson(request,response);
        } else if(url.contains("DeleteLesson")){
            postDelete(request,response);
        } else if(url.contains("EditLesson")){
            postEdit(request,response);
        }
    }
    protected void getDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve course ID from request parameter
        int courseId = Integer.parseInt(request.getParameter("id"));
        // Use DAO to fetch course details from the database/ Adjust to your actual DAO implementation
        CourseDetail course = i.getCourseById(courseId);

        // Set course object as attribute in request scope
        request.setAttribute("course", course);

        List<Lesson> lessons = i.getLessonsByCourseId(courseId);

        request.setAttribute("lessons", lessons);

        // Forward to JSP to render course details
        request.getRequestDispatcher("course_detail.jsp").forward(request,response);
    }
    protected void postCreateLesson(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String courseID_raw = request.getParameter("courseId");
        String lessonName = request.getParameter("lessonName");
        String content = request.getParameter("content");
        String lessonTime = request.getParameter("lessonTime");
        try {
            int courseId = Integer.parseInt(courseID_raw);
            Lesson lesson = new Lesson();
            lesson.setNameLesson(lessonName);
            lesson.setContent(content);
            lesson.setTimeLesson(lessonTime);
            lesson.setIdCourse(courseId);
            i.createLesson(lesson);
            // Chuyển hướng đến trang xác nhận hoặc trang khác sau khi tạo bài học thành công
            HttpSession session = request.getSession();
            int id = (int) session.getAttribute("id_convert");
            response.sendRedirect("FilterCourseDetail?id="+id); // Thay đổi URL thành trang bạn muốn chuyển hướng sau khi tạo thành công
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
    protected void postDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy lessonId từ request parameter
        int lessonId = Integer.parseInt(request.getParameter("lessonId"));
        boolean deleted = i.deleteLesson(lessonId);

        if (deleted) {
            HttpSession session = request.getSession();
            int id = (int) session.getAttribute("id_convert");
            response.sendRedirect("FilterCourseDetail?id="+id);
        } else {
            response.getWriter().println("Failed to delete lesson with ID " + lessonId);
        }
    }
    protected void getEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Lấy các tham số từ request
            int lessonId = Integer.parseInt(request.getParameter("lessonId"));
            //int courseId = 3;
            String lessonName = request.getParameter("lessonName");
            String content = request.getParameter("content");
            String lessonTime = request.getParameter("lessonTime");

            Lesson lesson = new Lesson(lessonId,lessonName,content,lessonTime);
            i.editLesson(lesson);
            request.setAttribute("lessons", lesson);HttpSession session = request.getSession();
            int id = (int) session.getAttribute("id_convert");

            request.getRequestDispatcher("FilterCourseDetail?id="+id).forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
    protected void postEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Lấy các tham số từ request
            int lessonId = Integer.parseInt(request.getParameter("lessonId"));
            //int courseId = 3;
            String lessonName = request.getParameter("lessonName");
            String content = request.getParameter("content");
            String lessonTime = request.getParameter("lessonTime");

            Lesson lesson = new Lesson(lessonId,lessonName,content,lessonTime);
            i.editLesson(lesson);
            request.setAttribute("lessons", lesson);HttpSession session = request.getSession();
            int id = (int) session.getAttribute("id_convert");

            request.getRequestDispatcher("FilterCourseDetail?id="+id).forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
    protected void getCourseDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve course ID from request parameter
        int courseId = Integer.parseInt(request.getParameter("id"));
        HttpSession session = request.getSession();
        if(session.getAttribute("id_convert") != null) {
            session.removeAttribute("id_convert");
        }
        session.setAttribute("id_convert", courseId);
        CourseDetail course = i.getCourseById(courseId);

        request.setAttribute("course", course);
        List<Lesson> lessons = i.getLessonsByCourseId(courseId);
        request.setAttribute("lessons", lessons);
        request.getRequestDispatcher("edit_course_detail.jsp").forward(request,response);
    }

}
