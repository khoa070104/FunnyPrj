package controller.admin;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

import java.io.IOException;

public class AdminFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Khởi tạo nếu cần
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);

        // Kiểm tra nếu người dùng đã đăng nhập và có vai trò admin
        if (session != null && session.getAttribute("user") != null) {
            User user = (User) session.getAttribute("user");
            if (user.getRole() == 1) { // 1 là mã vai trò admin
                // Cho phép người dùng tiếp tục vào trang admin
                chain.doFilter(request, response);
            } else {
                // Nếu không phải admin, chuyển hướng đến trang không được phép
                httpResponse.sendRedirect(httpRequest.getContextPath() + "/home");
            }
        } else {
            // Nếu người dùng chưa đăng nhập, chuyển hướng đến trang đăng nhập
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/login");
        }
    }

    @Override
    public void destroy() {
        // Hủy bỏ filter nếu cần
    }
}
