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
<%@ page import="model.Course" %>
<%@ page import="DAO.impl.ItemDAOImpl" %>

<%
    ItemDAOImpl itemDAO = new ItemDAOImpl();
    List<Course> courses = itemDAO.getTop10CoursesByDate();
    request.setAttribute("courses", courses);
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="stylesheet" href="./css/homepage_after.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
</head>

<body>
<div class="cover">
    <div class="header_info">
        <div class="phone_header">
            <div class="phone_header-logo">
                <img src="icon/phone.svg" alt="">
            </div>
            <div class="phone_header-info">
                <p>03333333333</p>
            </div>
            <div class="mail_header">
                <div class="mail_header-logo">
                    <img src="icon/mail.png" alt="">
                </div>
                <div class="mail_header-info">
                    <a href="mamgh789@gmail.com">mamgh789@gmail.com</a>
                </div>
            </div>
        </div>
        <div class="language_header">
            <select name="" id="language_option">
                <option value="VIE">Vietnamese</option>
                <option value="ENG">English</option>
            </select>
        </div>
    </div>


    <div class="header_bar">
        <div class="header_barlogosearch">
            <div class="header_bar-logo">
                <img src="icon/Logo.png" alt="">
            </div>
            <div class="header_bar-danhMuc" id="danhMuc">
                <div class="header_bar-danhMuc-icon">
                    <img src="icon/list-solid.svg" alt="">
                </div>
                <i class="header_bar-danhMuc-info">
                    Danh Mục
                </i>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownCourses">
                    <a href="mycourses.html" class="dropdown-item" href="#">
                        <i class="fas fa-book mr-2"></i> Khóa học
                    </a>
                    <a href="cart.html" class="dropdown-item" href="#">
                        <i class="fas fa-store mr-2"></i> Cửa hàng
                    </a>
                </div>
            </div>

            <div class="header_bar-search">
                <div class="header_bar-search-info">
                    <input type="text" placeholder="Tìm kiếm">
                    <div class="header_bar-search-icon">
                        <img src="icon/search.svg" alt="">
                    </div>
                </div>

            </div>
        </div>


        <div class="header_bar-cart">
            <!-- Giảng viên Link -->
            <a href="lecturer.html" class="header-icon">
                <div class="header_bar-cart-icon ">
                    <p class="icon-text">Mentor</p>
                </div>
            </a>

            <!-- Khóa học của tôi Link -->
            <a href="mycourses.html">
                <div class="header_bar-cart-icon no-icon">
                    <p class="icon-text">Khóa học của tôi</p>
                </div>
            </a>

            <!-- Giỏ hàng Link -->
            <a href="cart.html">
                <div class="header_bar-cart-icon">
                    <img src="icon/cart.svg" alt="Giỏ hàng">
                </div>
            </a>

            <!-- Hồ sơ Link -->
            <div class="header_bar-cart header_bar-cart-user">
                <a class="profile-link">
                    <div class="header_bar-cart-icon">
                        <img src="icon/user.png" alt="Hồ sơ" style="border-radius: 50%; height: 65%;">
                    </div>
                </a>
                <div class="profile-dropdown">
                    <!-- Nội dung menu dropdown -->
                    <a href="#" class="list-group-item list-group-item-action">
                        <i class="fas fa-user mr-2"></i> Tên người dùng: ${sessionScope.user.username}
                    </a>
                    <a href="#" class="list-group-item list-group-item-action">
                        <i class="fas fa-envelope mr-2"></i> Email: ${sessionScope.user.email}
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="#" class="list-group-item list-group-item-action">
                        <i class="fas fa-book mr-2"></i> Khóa học của tôi
                    </a>
                    <a href="#" class="list-group-item list-group-item-action">
                        <i class="fas fa-id-card mr-2"></i> Hồ sơ người dùng
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="logout" class="list-group-item list-group-item-action">
                        <i class="fas fa-sign-out-alt mr-2"></i> Đăng xuất
                    </a>
                </div>
            </div>


        </div>
    </div>
</div>
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
                        <img src="icon/homebanner.png" alt="">
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
                                    <div>
                                        <img src="<%= course.getImg() %>" alt="" width="70">
                                    </div>
                                    <div>
                                        <button class="btn-compare-sm">Compare</button>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="course-meta">
                                        <span><%= course.getTimeCourse() %> Giờ</span>
                                        <span><%= course.getTotalLesson() %> Lectures</span>
                                    </div>
                                </div>
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
                    <img src="icon/play-button.png" alt="">
                    <div class="text-box">
                        <h4>12 Khóa học trực tuyến</h4>
                        <p>Khám phá nhiều chủ đề mới</p>
                    </div>
                </div>
            </div>

            <div class="col-md-4 d-flex">
                <div class="home-fact-box d-flex align-items-center justify-content-center mr-md-auto mr-auto">
                    <img src="icon/leaderboard-4.svg" alt="">
                    <div class="text-box">
                        <h4>Chuyên gia đầu ngành</h4>
                    </div>
                </div>
            </div>

            <div class="col-md-4 d-flex">
                <div class="home-fact-box mr-md-auto d-flex justify-content-center align-items-center mr-auto">
                    <img src="icon/repeat.png" alt="">
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
<div class="footer_content">
    <div class="footer-lienket">
        <div class="footer-lienket-title">
            <h3>Study and topic, any thing with </h3>
        </div>
        <div class="footer-lienket-info">
            <ul>
                <li><a href="facebook.com"><img src="icon/facebook.svg" alt=""></a></li>
                <li><a href="instagram.com"><img src="icon/instagram.svg" alt=""></a></li>
                <li><a href="twitter.com"><img src="icon/twitter.svg" alt=""></a></li>
                <li><a href="youtube.com"><img src="icon/youtube.svg" alt=""></a></li>
            </ul>
        </div>
    </div>
    <div class="footer-list">
        <div class="footer-list-title">
            <h3>Danh mục hàng đầu</h3>
        </div>
        <div class="footer-list-info">
            <ul class="footer-list-info-ul two-columns">
                <li><a href="list.html?id=1">Kì 1</a></li>
                <li><a href="list.html?id=1">Kì 2</a></li>
                <li><a href="list.html?id=1">Kì 3</a></li>
                <li><a href="list.html?id=1">Kì 4</a></li>
                <li><a href="list.html?id=1">Kì 5</a></li>
                <li><a href="list.html?id=1">Kì 6</a></li>
                <li><a href="list.html?id=1">Kì 7</a></li>
                <li><a href="list.html?id=1">Kì 8</a></li>
                <li><a href="list.html?id=1">Kì 9</a></li>
                <li><a href="list.html?id=1">Bài tập</a></li>
            </ul>
        </div>
    </div>
    <div class="footer-favorite">
        <div class="footer-list-title">
            <h3>Liên kết hữu ích</h3>
        </div>
        <div class="footer-favorite-info">
            <ul class="footer-list-info-ul">
                <li><a href="">Blog</a></li>
                <li><a href="">Login</a></li>
                <li><a href="">SignUp</a></li>
            </ul>
        </div>
    </div>
</div>
<footer class="footer">
    <div class="footer-logo">
        <img src="./icon/Logo.png" alt="">
    </div>
    <div class="footer-info">
        <p>© 2024 Study and topic, any thing with. All Rights Reserved.</p>
    </div>
    <div class="language_footer">
        <select name="" id="">
            <option value="VIE">Vietnamese</option>
            <option value="ENG">English</option>
        </select>
    </div>
</footer>
<script src="js/hompage.js"></script>
</body>

</html>
