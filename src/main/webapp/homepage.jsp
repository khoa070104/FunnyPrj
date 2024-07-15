<%--
  Created by IntelliJ IDEA.
  User: Khoa Bug
  Date: 08/07/2024
  Time: 13:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.stream.Collectors" %>
<%@ page import="jakarta.servlet.http.Cookie" %>
<%@ page import="model.Course" %>
<%@ page import="DAO.impl.ItemDAOImpl" %>
<%
    ItemDAOImpl itemDAO = new ItemDAOImpl();
    List<Course> courses = itemDAO.getTop10CoursesByDate();
    request.setAttribute("courses", courses);
    // Lấy danh sách ID sản phẩm từ cookie
    Cookie[] cookies = request.getCookies();
    List<String> cartIds = Arrays.stream(cookies)
            .filter(cookie -> cookie.getName().equals("cart"))
            .map(cookie -> cookie.getValue())
            .flatMap(value -> Arrays.stream(value.split("_")))
            .collect(Collectors.toList());
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/homepage_after.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
</head>

<body>
<jsp:include page="components/header_loged.jsp"/>
<div class="home-banner-area py-5" id="home-banner-area">
    <div class="container-lg">
        <div class="d-flex ">
            <div class="col row align-items-center position-relative baner-home">
                <div class="col-md-6 p-0 p-md-5 order-sm-1 order-2">
                    <div class="home-banner-wrap">
                        <h4 class="fw-bold">Học tập với chi phí thấp hơn</h4>
                        <p>Học bất kỳ chủ đề nào, bất cứ lúc nào. Khám phá hàng nghìn khóa học với mức giá thấp
                            nhất từ trước đến nay!</p>
                    </div>

                </div>
                <div class="col-lg-6 col-md-6 col-sm-12 col-12 order-md-2 order-sm-2 order-1 pt-0 pt-md-5 ">
                    <div id="tilt">
                        <img src="${pageContext.request.contextPath}/icon/homebanner.png" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="course-carousel-area">
    <div class="container">
        <div>
            <div>
                <h3 class="course-carousel-title">
                    <div class="header-underline-2">Top 10 khóa học mới nhất</div>
                </h3>
            </div>
            <div class="course-list draggble">
                <button class="carousel-button left" onclick="scrollLeft2()">‹</button>
                <div class="course-list row">
                    <!-- Iterate over courses -->
                    <% for (Course course : courses) { %>
                    <div class="course-box-wrap course-box-wrap-2" id="course-<%= course.getId() %>">
                        <a href=""></a>
                        <div class="course-box">
                            <div class="course-image">
                                <p>₫ <%= course.getPrice() %>
                                </p>
                                <img src="<%= course.getImg() %>" alt="">
                            </div>
                            <div class="course-details">
                                <div>
                                    <span>Người mới bắt đầu</span>
                                </div>
                                <div class="row">
                                    <h2><%= course.getName() %>
                                    </h2>
                                    <h5><%= course.getDescription() %>
                                    </h5>
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
                                <% if (cartIds.contains(String.valueOf(course.getId()))) { %>
                                <button type="button" class="btn btn-secondary" disabled>Đã thêm vào giỏ</button>
                                <% } else { %>
                                <form action="add-to-cart" method="post">
                                    <input type="hidden" name="courseId" value="<%= course.getId() %>">
                                    <button type="submit" class="btn btn-primary">Thêm vào giỏ hàng</button>
                                </form>
                                <% } %>

                            </div>
                        </div>
                    </div>
                    <% } %>
                </div>
                <button class="carousel-button right" onclick="scrollRight2()">›</button>
            </div>

        </div>
    </div>
</div>

<div class="home-fact-area">
    <div class="container-lg">
        <div class="row">
            <div class="col-md-4 d-flex">
                <div class="home-fact-box d-flex align-items-center justify-content-center mr-md-auto mr-auto">
                    <img src="${pageContext.request.contextPath}/icon/play-button.png" alt="">
                    <div class="text-box">
                        <h4>12 Khóa học trực tuyến</h4>
                        <p>Khám phá nhiều chủ đề mới</p>
                    </div>
                </div>
            </div>

            <div class="col-md-4 d-flex">
                <div class="home-fact-box d-flex align-items-center justify-content-center mr-md-auto mr-auto">
                    <img src="${pageContext.request.contextPath}/icon/leaderboard-4.svg" alt="">
                    <div class="text-box">
                        <h4>Chuyên gia đầu ngành</h4>
                    </div>
                </div>
            </div>

            <div class="col-md-4 d-flex">
                <div class="home-fact-box mr-md-auto d-flex justify-content-center align-items-center mr-auto">
                    <img src="${pageContext.request.contextPath}/icon/repeat.png" alt="">
                    <div class="text-box">
                        <h4>Truy cập trọn đời</h4>
                        <p>Học theo lịch trình của bạn</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<jsp:include page="components/footer.jsp"/>
<script src="js/hompage.js"></script>
</body>

</html>
