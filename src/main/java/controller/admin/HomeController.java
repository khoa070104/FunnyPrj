package controller.admin;

import DAO.impl.ItemDAOImpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import model.Category;
import model.Course;
import model.LessonTime;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

@WebServlet(urlPatterns = {"/CreateCourse","/EditCourse","/DeleteCourse","/ListCourse","/editpage"})
public class HomeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getRequestURI().toString();

        if(url.contains("CreateCourse")){
            getCreate(request,response);
        } else if(url.contains("EditCourse")){
            getEdit(request,response);
        } else if(url.contains("DeleteCourse")){
            getDelete(request,response);
        } else if (url.contains("editpage")) {
            getEditPage(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = request.getRequestURI().toString();

        if(url.contains("CreateCourse")){
            postCreate(request,response);
        } else if(url.contains("EditCourse")){
            postEdit(request,response);
        } else if(url.contains("editpage")) {
            postEditPage(request, response);
        }
    }
    protected void getEditPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ItemDAOImpl itemDAO = new ItemDAOImpl();

        // Lấy danh sách các category để hiển thị trên giao diện
        List<Category> list = itemDAO.getAll();
        HttpSession session = request.getSession();
        session.setAttribute("categories", list);
        request.getRequestDispatcher("admin/editcourse.jsp").forward(request, response);

    }
    protected void postEditPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ItemDAOImpl itemDAO = new ItemDAOImpl();

        // Lấy giá trị typeCourse từ request parameter
        String cid_raw = request.getParameter("id_category");
        int cid = 0;
        try {
            cid = (cid_raw == null) ? 0 : Integer.parseInt(cid_raw);
        } catch (NumberFormatException e) {
            // Xử lý ngoại lệ khi không thể chuyển đổi thành số nguyên
            e.printStackTrace();
        }

        // Lọc các khóa học dựa trên categoryId và typeCourse (nếu có)
        List<Course> courses = itemDAO.filterCoursesByCriteria(cid);

        // Lưu danh sách khóa học đã lọc vào request attribute để truyền đến JSP
        request.setAttribute("courses", courses);

        // Lưu lại các giá trị lọc để hiển thị lại trên giao diện
        request.setAttribute("cid", cid);

        // Điều hướng đến trang filter.jsp để hiển thị kết quả lọc
        request.getRequestDispatcher("admin/editcourse.jsp").forward(request, response);
    }
    protected void getDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
    protected void getCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
    protected void postCreate(HttpServletRequest request, HttpServletResponse response)
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
    protected void getEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy ID của khóa học cần chỉnh sửa từ request
        int courseId = Integer.parseInt(request.getParameter("id"));

        // Tạo đối tượng DAO và lấy thông tin chi tiết của khóa học từ cơ sở dữ liệu
        ItemDAOImpl itemDAO = new ItemDAOImpl();
        Course course = itemDAO.getCourseById(courseId);

        // Lưu thông tin chi tiết của khóa học vào session để sử dụng trong form chỉnh sửa
        HttpSession session = request.getSession();
        session.setAttribute("course", course);

        // Lấy danh sách các category để hiển thị trên giao diện
        List<Category> list = itemDAO.getAll();
        session.setAttribute("categories", list);

        // Lấy danh sách các lesson time để hiển thị trên giao diện
        List<LessonTime> listLessonTimes = itemDAO.getAllLessonTimes();
        session.setAttribute("lessonTimes", listLessonTimes);

        // Forward to editcourse.jsp for displaying the form
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

            // Cập nhật thông tin khóa học trong cơ sở dữ liệu
            ItemDAOImpl courseDAO = new ItemDAOImpl();
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
                courseDAO.updateCourse(courseToUpdate);
            } else {
                courseDAO.updateCourseWithoutImg(courseToUpdate);
            }

            // Redirect về trang danh sách khóa học sau khi cập nhật thành công
            request.getRequestDispatcher("admin/editcourse.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }

}
