package controller.admin;

import DAO.impl.ItemDAOImpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import model.Category;
import model.Course;
import model.LessonTime;
import service.IItemService;
import service.Impl.ItemServiceImpl;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
@MultipartConfig(maxFileSize = 1024 * 1024 * 10)
@WebServlet(urlPatterns = {"/create-course","/edit-course","/delete-course","/manage-course"})
public class HomeController extends HttpServlet {
    IItemService i = new ItemServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getRequestURI().toString();

         if(url.contains("edit-course")){
            getEdit(request,response);
        } else if(url.contains("delete-course")){
            getDelete(request,response);
        } else if (url.contains("manage-course")) {
            getEditPage(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getRequestURI().toString();

        if(url.contains("create-course")){
            postCreate(request,response);
        } else if(url.contains("edit-course")){
            postEdit(request,response);
        } else if(url.contains("manage-course")) {
            postEditPage(request, response);
        }
    }
    protected void getEditPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<Category> list = i.getAll();
        HttpSession session = request.getSession();
        session.setAttribute("categories", list);
        request.getRequestDispatcher("admin/editcourse.jsp").forward(request, response);

    }
    protected void postEditPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String cid_raw = request.getParameter("id_category");
        int cid = 0;
        try {
            cid = (cid_raw == null) ? 0 : Integer.parseInt(cid_raw);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
        List<Course> courses = i.filterCoursesByCriteria(cid);
        request.setAttribute("courses", courses);
        request.setAttribute("cid", cid);
        request.getRequestDispatcher("admin/editcourse.jsp").forward(request, response);
    }
    protected void getDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String deleteCourseId = request.getParameter("id");
        try {
            int courseId = Integer.parseInt(deleteCourseId);
            i.deleteCourse(courseId);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
        response.sendRedirect("admin/editcourse.jsp");
    }


    protected void postCreate(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String priceStr = request.getParameter("price");
        String description = request.getParameter("description");
        String typeCourseStr = request.getParameter("typeCourse");
        String idLessonTime = request.getParameter("idLessonTime"); // Nhận giá trị trực tiếp từ input text
        int idCategory = Integer.parseInt(request.getParameter("idCategory"));
        System.out.println(priceStr);
        System.out.printf(typeCourseStr);
        System.out.println("-----");
        try {
            double price = Double.parseDouble(priceStr);
            int typeCourse = Integer.parseInt(typeCourseStr);
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
            String imgPath = "upload/" + fileName;
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
    protected void getEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy ID của khóa học cần chỉnh sửa từ request
        int courseId = Integer.parseInt(request.getParameter("id"));
        Course course = i.getCourseById(courseId);
        HttpSession session = request.getSession();
        session.setAttribute("course", course);
        List<Category> list = i.getAll();
        session.setAttribute("categories", list);
        List<LessonTime> listLessonTimes = i.getAllLessonTimes();
        session.setAttribute("lessonTimes", listLessonTimes);
        response.sendRedirect("admin/editcourse.jsp");
    }
    protected void postEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Lấy thông tin khóa học cần cập nhật từ request
            int courseId = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            double price = Double.parseDouble(request.getParameter("price"));
            String description = request.getParameter("description");
            boolean typeCourse = Boolean.parseBoolean(request.getParameter("typeCourse"));
            int idCategory = Integer.parseInt(request.getParameter("idCategory"));

            // idLessonTime không cần parse vì nó sẽ được nhập vào trực tiếp từ input text
            String idLessonTime = request.getParameter("idLessonTime");

            // Lấy part của hình ảnh nếu có
            Part imgPart = request.getPart("img");

            // Đường dẫn thư mục lưu trữ ảnh upload
            String uploadPath = request.getServletContext().getRealPath("/upload");
            String fileName = Paths.get(imgPart.getSubmittedFileName()).getFileName().toString();

            // Kiểm tra xem người dùng có upload ảnh mới hay không
            String imgPath = null;
            if (!fileName.isEmpty()) {
                // Tạo thư mục upload nếu chưa tồn tại
                if (!Files.exists(Paths.get(uploadPath))) {
                    Files.createDirectories(Paths.get(uploadPath));
                }
                // Lưu file ảnh vào thư mục upload
                imgPart.write(uploadPath + "/" + fileName);

                // Tạo đường dẫn ảnh mới
                imgPath = "upload/" + fileName;
            }

            Course courseToUpdate = new Course();
            courseToUpdate.setId(courseId);
            courseToUpdate.setName(name);
            courseToUpdate.setPrice(price);
            courseToUpdate.setDescription(description);
            courseToUpdate.setTypeCourse(typeCourse);
            courseToUpdate.setIdLessonTime(idLessonTime);
            courseToUpdate.setIdCategory(idCategory);

            if (imgPath != null) {
                courseToUpdate.setImg(imgPath);
                i.updateCourse(courseToUpdate);
            } else {
                i.updateCourseWithoutImg(courseToUpdate);
            }

            // Redirect về trang danh sách khóa học sau khi cập nhật thành công
            request.getRequestDispatcher("admin/editcourse.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }

}
