
package controller.web;


import DAO.impl.ItemDAOImpl;
import model.Category;
import model.Course;
import service.IItemService;
import service.Impl.ItemServiceImpl;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/Filter")

public class FilterServlet extends HttpServlet {

    private IItemService itemService = new ItemServiceImpl();

//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        // Nhận các tham số từ URL
//        String categoryIdParam = request.getParameter("id_category");
//        String typeCourseParam = request.getParameter("type_course");
//
//        // Chuyển đổi các tham số thành các giá trị cần thiết
//        int categoryId = categoryIdParam != null ? Integer.parseInt(categoryIdParam) : 0;
//        Boolean typeCourse = typeCourseParam != null ? Boolean.parseBoolean(typeCourseParam) : null;
//
//        // Gọi phương thức từ service để lấy dữ liệu đã lọc
//        List<Course> filteredItems = itemService.filterCoursesByCriteria(typeCourse, categoryId);
//
//        // Lưu các giá trị đã lọc vào request attribute để truyền đến JSP
//        request.setAttribute("filteredItems", filteredItems);
//
//        // Đặt lại các giá trị lọc vào request để hiển thị lại các nút radio đã chọn
//        request.setAttribute("selectedCategoryId", categoryId);
//        request.setAttribute("selectedTypeCourse", typeCourse);
//
//        // Chuyển hướng đến trang JSP để hiển thị kết quả
//        request.getRequestDispatcher("allcourse.jsp").forward(request, response);
//    }

//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        ItemDAOImpl itemDAO = new ItemDAOImpl();
//        List<Category> list = itemDAO.getAll();
//        request.setAttribute("categories", list);
//        String cid_raw = request.getParameter("cid");
//        int cid;
//        try {
//            cid = (cid_raw==null) ? 0 : Integer.parseInt(cid_raw);
//            List<Course> courses = itemDAO.getCoursesByCategory(cid);
//            request.setAttribute("courses", courses);
//        }catch (NumberFormatException e){
//
//        }
////        cid: category id
//        request.getRequestDispatcher("filter.jsp").forward(request, response);
//    }
//
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        doGet(request, response);
//    }
//}

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ItemDAOImpl itemDAO = new ItemDAOImpl();

        // Lấy danh sách các category để hiển thị trên giao diện
        List<Category> list = itemDAO.getAll();
        HttpSession session = request.getSession();
        session.setAttribute("categories", list);
        response.sendRedirect("allcourse.jsp");
        // Lấy giá trị categoryId từ request parameter



    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
        Boolean typeCourse = null;
        String typeCourseParam = request.getParameter("typeCourse");
        if (typeCourseParam != null && !typeCourseParam.isEmpty()) {
            typeCourse = Boolean.parseBoolean(typeCourseParam);
        }

        // Lọc các khóa học dựa trên categoryId và typeCourse (nếu có)
        List<Course> courses = itemDAO.filterCoursesByCriteria(typeCourse, cid);

        // Lưu danh sách khóa học đã lọc vào request attribute để truyền đến JSP
        request.setAttribute("courses", courses);

        // Lưu lại các giá trị lọc để hiển thị lại trên giao diện
        request.setAttribute("cid", cid);
        request.setAttribute("selectedTypeCourse", typeCourse);

        // Điều hướng đến trang filter.jsp để hiển thị kết quả lọc
        request.getRequestDispatcher("allcourse.jsp").forward(request, response);
    }
}