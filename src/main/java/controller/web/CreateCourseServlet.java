//package controller.web;
//
//import DAO.impl.ItemDAOImpl;
//import model.Category;
//import model.LessonTime;
//import java.io.IOException;
//import java.nio.file.Files;
//import java.nio.file.Paths;
//import java.util.List;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.MultipartConfig;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//import jakarta.servlet.http.Part;
//
//@MultipartConfig(maxFileSize = 10 * 1024 * 1024) // Giới hạn kích thước file tối đa là 10MB
//
//
//@WebServlet("/CreateCourse")
//public class CreateCourseServlet extends HttpServlet {
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        ItemDAOImpl itemDAO = new ItemDAOImpl();
//
//        // Lấy danh sách các category để hiển thị trên giao diện
//        List<Category> list = itemDAO.getAll();
//        HttpSession session = request.getSession();
//        session.setAttribute("categories", list);
//
//
//        // Lấy danh sách các lesson time để hiển thị trên giao diện
//        List<LessonTime> listLessonTimes = itemDAO.getAllLessonTimes();
//        session.setAttribute("lessonTimes", listLessonTimes);
//
//        // Forward to editcourse.jsp for displaying the form
//        request.getRequestDispatcher("editcourse.jsp").forward(request, response);
//
//
//    }
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        try {
//        // Retrieve form parameters from the request
//        String name = request.getParameter("name");
//        Double price = Double.parseDouble(request.getParameter("price"));
//        String description = request.getParameter("description");
//        int typeCourse = Integer.parseInt(request.getParameter("typeCourse"));
//        String idLessonTime = request.getParameter("idLessonTime");
//        int idCategory = Integer.parseInt(request.getParameter("idCategory"));
//        Part imgPart = request.getPart("img");
//
//        // Đường dẫn thư mục lưu trữ ảnh upload
//        String uploadPath = request.getServletContext().getRealPath("/upload");
//        String fileName = Paths.get(imgPart.getSubmittedFileName()).getFileName().toString();
//
//        // Tạo thư mục upload nếu chưa tồn tại
//        if (!Files.exists(Paths.get(uploadPath))) {
//            Files.createDirectories(Paths.get(uploadPath));
//        }
//        // Lưu file ảnh vào thư mục upload
//        imgPart.write(uploadPath + "/" + fileName);
//
//        // Tạo đường dẫn ảnh
//        String imgPath = "upload/" + fileName;
//        // Tạo đối tượng Course và lưu vào cơ sở dữ liệu
//        ItemDAOImpl courseDAO = new ItemDAOImpl();
//        boolean test = courseDAO.createCourse(name, price, description, typeCourse, idLessonTime, idCategory, imgPath);
//
//        if(test){
//            response.sendRedirect("editcourse.jsp");
//        }
//        } catch (Exception e) {
//            e.printStackTrace();
//            response.getWriter().println("Error: " + e.getMessage());
//        }
//    }
//
//}
//

package controller.web;

import DAO.impl.ItemDAOImpl;
import model.Category;
import model.LessonTime;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@MultipartConfig(maxFileSize = 10 * 1024 * 1024) // Giới hạn kích thước file tối đa là 10MB
@WebServlet("/CreateCourse")
public class CreateCourseServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ItemDAOImpl itemDAO = new ItemDAOImpl();

        // Lấy danh sách các category để hiển thị trên giao diện
        List<Category> list = itemDAO.getAll();
        HttpSession session = request.getSession();
        session.setAttribute("categories", list);

        // Lấy danh sách các lesson time để hiển thị trên giao diện
        List<LessonTime> listLessonTimes = itemDAO.getAllLessonTimes();
        session.setAttribute("lessonTimes", listLessonTimes);

        // Forward to editcourse.jsp for displaying the form
        request.getRequestDispatcher("editcourse.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Retrieve form parameters from the request
            String name = request.getParameter("name");
            double price = Double.parseDouble(request.getParameter("price"));
            String description = request.getParameter("description");
            int typeCourse = Integer.parseInt(request.getParameter("typeCourse"));
            String idLessonTime = request.getParameter("idLessonTime"); // Nhận giá trị trực tiếp từ input text
            int idCategory = Integer.parseInt(request.getParameter("idCategory"));
            Part imgPart = request.getPart("img");

            // Đường dẫn thư mục lưu trữ ảnh upload
            String uploadPath = request.getServletContext().getRealPath("/upload");
            String fileName = Paths.get(imgPart.getSubmittedFileName()).getFileName().toString();

            // Tạo thư mục upload nếu chưa tồn tại
            if (!Files.exists(Paths.get(uploadPath))) {
                Files.createDirectories(Paths.get(uploadPath));
            }

            // Lưu file ảnh vào thư mục upload
            imgPart.write(uploadPath + "/" + fileName);

            // Tạo đường dẫn ảnh
            String imgPath = "upload/" + fileName;

            // Tạo đối tượng Course và lưu vào cơ sở dữ liệu
            ItemDAOImpl courseDAO = new ItemDAOImpl();
            boolean test = courseDAO.createCourse(name, price, description, typeCourse, idLessonTime, idCategory, imgPath);

            if (test) {
                response.sendRedirect("editcourse.jsp");


            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
