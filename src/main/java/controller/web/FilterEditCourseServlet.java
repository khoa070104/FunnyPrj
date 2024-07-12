
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

@WebServlet("/FilterEdit")

public class FilterEditCourseServlet extends HttpServlet {

    private IItemService itemService = new ItemServiceImpl();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ItemDAOImpl itemDAO = new ItemDAOImpl();

        // Lấy danh sách các category để hiển thị trên giao diện
        List<Category> list = itemDAO.getAll();
        HttpSession session = request.getSession();
        session.setAttribute("categories", list);
        response.sendRedirect("editcourse.jsp");

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

        // Lọc các khóa học dựa trên categoryId và typeCourse (nếu có)
        List<Course> courses = itemDAO.filterCoursesByCriteria(cid);

        // Lưu danh sách khóa học đã lọc vào request attribute để truyền đến JSP
        request.setAttribute("courses", courses);

        // Lưu lại các giá trị lọc để hiển thị lại trên giao diện
        request.setAttribute("cid", cid);

        // Điều hướng đến trang filter.jsp để hiển thị kết quả lọc
        request.getRequestDispatcher("editcourse.jsp").forward(request, response);
    }
}