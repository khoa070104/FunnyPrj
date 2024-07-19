<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.stream.Collectors" %>
<%@ page import="jakarta.servlet.http.Cookie" %>
<%@ page import="model.Course" %>
<%@ page import="model.User" %>
<%@ page import="DAO.impl.ItemDAOImpl" %>
<%@ page import="java.util.ArrayList" %>
<%
    ItemDAOImpl itemDAO = new ItemDAOImpl();
    List<Course> courses = itemDAO.getTop10CoursesByDate();
    request.setAttribute("courses", courses);

    // Kiểm tra trạng thái đăng nhập
    HttpSession session1 = request.getSession();
    User user = (User) session1.getAttribute("user");
    boolean isLoggedIn = (user != null);

    List<String> cartIds = new ArrayList<>();
    if (isLoggedIn) {
        String username = user.getUsername();
        Cookie[] cookies = request.getCookies();
        String cartValue = "";
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("cart")) {
                    cartValue = cookie.getValue();
                    break;
                }
            }
        }

        if (!cartValue.isEmpty()) {
            String[] items = cartValue.split("_");
            for (int i = 0; i < items.length; i++) {
                if (i % 2 == 0 && username.equals(items[i])) {
                    cartIds.add(items[i + 1]);
                }
            }
        }
    }
%>
<div class="course-list draggble">
    <button class="carousel-button left" onclick="scrollLeft2()">‹</button>
    <div class="course-list row">
        <!-- Iterate over courses -->
        <% for (Course course : courses) { %>
        <div class="course-box-wrap course-box-wrap-2" id="course-<%= course.getId() %>">
            <a href="course_detail.jsp"></a>
            <div class="course-box">
                <div class="course-image">
                    <p>₫ <%= course.getPrice() %></p>
                    <img src="<%= course.getImg() %>" alt="">
                </div>
                <div class="course-details">
                    <div>
                        <span>Người mới bắt đầu</span>
                    </div>
                    <div class="row">
                        <h2><%= course.getName() %></h2>
                        <h6 style="min-height: 40px"><%= course.getDescription() %></h6>
                    </div>

                    <div class="rating">
                        <div class="stars">
                            <!-- Adjust rating stars based on course.getRate() -->
                            <% for (int i = 0; i < course.getRate(); i++) { %>
                            <i class="fas fa-star"></i>
                            <% } %>
                        </div>
                        <div class="d-inline-block">
                            <span class="text-dark ms-1 text-12px">(5)</span>
                            <span class="text-dark text-12px text-muted ms-2">(5 Đánh giá)</span>
                        </div>
                    </div>

                    <div class="row">
                        <div class="course-meta">
                            <span><%= course.getTimeCourse() %> Giờ</span>
                            <span><%= course.getTotalLesson() %> Lectures</span>
                        </div>
                    </div>

                    <!-- Add to Cart Button -->
                    <% if (!isLoggedIn) { %>
<%--                    <button type="button" class="btn btn-warning"--%>
<%--                            style="background-color: #eceb98; font-weight: 500;" onclick="alert('Bạn cần đăng nhập để thêm vào giỏ hàng')">Đăng nhập để thêm vào giỏ hàng</button>--%>
                    <form action="login" method="get">
                        <button type="submit" class="btn btn-primary hover-button"
                                style="background-color: #00a7c1; border-color: transparent"> Thêm vào giỏ hàng</button>
                    </form>
                    <% } else if (cartIds.contains(String.valueOf(course.getId()))) { %>
                    <button type="button" class="btn btn-secondary" disabled>Đã thêm vào giỏ</button>
                    <% } else { %>
                    <form action="add-to-cart" method="post">
                        <input type="hidden" name="courseId" value="<%= course.getId() %>">
                        <button type="submit" class="btn btn-primary hover-button"
                                style="background-color: #00a7c1; border-color: transparent"> Thêm vào giỏ hàng</button>
                    </form>
                    <% } %>

                </div>
            </div>
        </div>
        <% } %>
    </div>
    <button class="carousel-button right" onclick="scrollRight2()">›</button>
</div>
