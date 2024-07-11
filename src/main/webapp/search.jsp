<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Course" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Results</title>
    <link rel="stylesheet" href="css/homepage_after.css">
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
                    <a href="mailto:mamgh789@gmail.com">mamgh789@gmail.com</a>
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
                    <a href="mycourses.html" class="dropdown-item">
                        <i class="fas fa-book mr-2"></i> Khóa học
                    </a>
                    <a href="cart.html" class="dropdown-item">
                        <i class="fas fa-store mr-2"></i> Cửa hàng
                    </a>
                </div>
            </div>
            <div class="header_bar-search">
                <form action="search" method="post">
                    <div class="header_bar-search-info">
                        <input type="text" name="search" placeholder="Tìm kiếm" value="${param.search}">
                        <button type="submit" class="header_bar-search-icon">
                            <img src="icon/search.svg" alt="">
                        </button>
                    </div>
                </form>
            </div>
        </div>
        <div class="header_bar-cart">
            <a href="lecturer.html" class="header-icon">
                <div class="header_bar-cart-icon">
                    <p class="icon-text">Mentor</p>
                </div>
            </a>
            <a href="mycourses.html">
                <div class="header_bar-cart-icon no-icon">
                    <p class="icon-text">Khóa học của tôi</p>
                </div>
            </a>
            <a href="cart.html">
                <div class="header_bar-cart-icon">
                    <img src="icon/cart.svg" alt="Giỏ hàng">
                </div>
            </a>
            <div class="header_bar-cart header_bar-cart-user">
                <a class="profile-link">
                    <div class="header_bar-cart-icon">
                        <img src="icon/user.png" alt="Hồ sơ" style="border-radius: 50%; height: 65%;">
                    </div>
                </a>
                <div class="profile-dropdown">
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

<div class="container my-4">
    <!-- Display search results -->
    <h1 class="mb-4">Search Results</h1>

    <!-- Display message if any -->
    <c:if test="${not empty message}">
        <div class="alert alert-info">${message}</div>
    </c:if>

    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>

    <c:choose>
        <c:when test="${not empty courses}">
            <div class="course-list row">
                <!-- Iterate over courses -->
                <c:forEach var="course" items="${courses}">
                    <div class="course-box-wrap col-md-4" id="course-${course.id}">
                        <div class="course-box">
                            <div class="course-image">
                                <p>₫ ${course.price}</p>
                                <img src="${course.img}" alt="Course Image">
                            </div>
                            <div class="course-details">
                                <div>
                                    <span>Người mới bắt đầu</span>
                                </div>
                                <div class="row">
                                    <h2>${course.name}</h2>
                                    <h5>${course.description}</h5>
                                </div>
                                <div class="rating">
                                    <div class="stars">
                                        <!-- Adjust rating stars based on course.rate -->
                                        <c:forEach var="i" begin="0" end="${course.rate - 1}">
                                            <i class="fas fa-star"></i>
                                        </c:forEach>
                                    </div>
                                    <div class="d-inline-block">
                                        <span class="text-dark ms-1 text-12px">(5)</span>
                                        <span class="text-dark text-12px text-muted ms-2">(5 Đánh giá)</span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="course-meta">
                                        <span>${course.timeCourse} Giờ</span>
                                        <span>${course.totalLesson} Lectures</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:when>
        <c:otherwise>
            <div class="alert alert-info">No courses found.</div>
        </c:otherwise>
    </c:choose>
</div>

<div class="footer_content">
    <div class="footer-lienket">
        <div class="footer-lienket-title">
            <h3>Study and topic, any thing with</h3>
        </div>
        <div class="footer-lienket-info">
            <ul>
                <li><a href="https://facebook.com" target="_blank"><img src="icon/facebook.svg" alt=""></a></li>
                <li><a href="https://instagram.com" target="_blank"><img src="icon/instagram.svg" alt=""></a></li>
                <li><a href="https://twitter.com" target="_blank"><img src="icon/twitter.svg" alt=""></a></li>
                <li><a href="https://youtube.com" target="_blank"><img src="icon/youtube.svg" alt=""></a></li>
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
                <li><a href="list.html?id=2">Kì 2</a></li>
                <li><a href="list.html?id=3">Kì 3</a></li>
                <li><a href="list.html?id=4">Kì 4</a></li>
                <li><a href="list.html?id=5">Kì 5</a></li>
                <li><a href="list.html?id=6">Kì 6</a></li>
                <li><a href="list.html?id=7">Kì 7</a></li>
                <li><a href="list.html?id=8">Kì 8</a></li>
                <li><a href="list.html?id=9">Kì 9</a></li>
                <li><a href="list.html?id=10">Bài tập</a></li>
            </ul>
        </div>
    </div>
    <div class="footer-favorite">
        <div class="footer-list-title">
            <h3>Liên kết hữu ích</h3>
        </div>
        <div class="footer-favorite-info">
            <ul class="footer-list-info-ul">
                <li><a href="blog.html">Blog</a></li>
                <li><a href="login.html">Login</a></li>
                <li><a href="signup.html">SignUp</a></li>
            </ul>
        </div>
    </div>
</div>
<footer class="footer">
    <div class="footer-logo">
        <img src="icon/Logo.png" alt="">
    </div>
    <div class="footer-info">
        <p>© 2024 Study and topic, any thing with. All Rights Reserved.</p>
    </div>
    <div class="language_footer">
        <select name="" id="language_footer_option">
            <option value="VIE">Vietnamese</option>
            <option value="ENG">English</option>
        </select>
    </div>
</footer>

<script src="js/hompage.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
