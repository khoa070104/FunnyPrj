//
//
//package controller.admin;
//
//import DAO.impl.ItemDAOImpl;
//import model.Category;
//import model.Course;
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
//@WebServlet("/EditCourseInfo")
//public class EditCourseServlet extends HttpServlet {
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        // Lấy ID của khóa học cần chỉnh sửa từ request
//        int courseId = Integer.parseInt(request.getParameter("id"));
//
//        // Tạo đối tượng DAO và lấy thông tin chi tiết của khóa học từ cơ sở dữ liệu
//        ItemDAOImpl itemDAO = new ItemDAOImpl();
//        Course course = itemDAO.getCourseById(courseId);
//
//        // Lưu thông tin chi tiết của khóa học vào session để sử dụng trong form chỉnh sửa
//        HttpSession session = request.getSession();
//        session.setAttribute("course", course);
//
//        // Lấy danh sách các category để hiển thị trên giao diện
//        List<Category> list = itemDAO.getAll();
//        session.setAttribute("categories", list);
//
//        // Lấy danh sách các lesson time để hiển thị trên giao diện
//        List<LessonTime> listLessonTimes = itemDAO.getAllLessonTimes();
//        session.setAttribute("lessonTimes", listLessonTimes);
//
//        // Forward to editcourse.jsp for displaying the form
//        response.sendRedirect("admin/editcourse.jsp");
//    }
//
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        try {
//            // Lấy thông tin khóa học cần cập nhật từ request
//            int courseId = Integer.parseInt(request.getParameter("id"));
//            String name = request.getParameter("name");
//            double price = Double.parseDouble(request.getParameter("price"));
//            String description = request.getParameter("description");
//            boolean typeCourse = Boolean.parseBoolean(request.getParameter("typeCourse"));
//            int idCategory = Integer.parseInt(request.getParameter("idCategory"));
//
//            // idLessonTime không cần parse vì nó sẽ được nhập vào trực tiếp từ input text
//            String idLessonTime = request.getParameter("idLessonTime");
//
//            // Lấy part của hình ảnh nếu có
//            Part imgPart = request.getPart("img");
//
//            // Đường dẫn thư mục lưu trữ ảnh upload
//            String uploadPath = request.getServletContext().getRealPath("/upload");
//            String fileName = Paths.get(imgPart.getSubmittedFileName()).getFileName().toString();
//
//            // Kiểm tra xem người dùng có upload ảnh mới hay không
//            String imgPath = null;
//            if (!fileName.isEmpty()) {
//                // Tạo thư mục upload nếu chưa tồn tại
//                if (!Files.exists(Paths.get(uploadPath))) {
//                    Files.createDirectories(Paths.get(uploadPath));
//                }
//                // Lưu file ảnh vào thư mục upload
//                imgPart.write(uploadPath + "/" + fileName);
//
//                // Tạo đường dẫn ảnh mới
//                imgPath = "upload/" + fileName;
//            }
//
//            // Cập nhật thông tin khóa học trong cơ sở dữ liệu
//            ItemDAOImpl courseDAO = new ItemDAOImpl();
//            Course courseToUpdate = new Course();
//            courseToUpdate.setId(courseId);
//            courseToUpdate.setName(name);
//            courseToUpdate.setPrice(price);
//            courseToUpdate.setDescription(description);
//            courseToUpdate.setTypeCourse(typeCourse);
//            courseToUpdate.setIdLessonTime(idLessonTime);
//            courseToUpdate.setIdCategory(idCategory);
//
//            if (imgPath != null) {
//                courseToUpdate.setImg(imgPath);
//                courseDAO.updateCourse(courseToUpdate);
//            } else {
//                courseDAO.updateCourseWithoutImg(courseToUpdate);
//            }
//
//            // Redirect về trang danh sách khóa học sau khi cập nhật thành công
//            request.getRequestDispatcher("admin/editcourse.jsp").forward(request, response);
//        } catch (Exception e) {
//            e.printStackTrace();
//            response.getWriter().println("Error: " + e.getMessage());
//        }
//    }
//}
//
