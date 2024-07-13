<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Course" %>
<%@ page import="DAO.impl.ItemDAOImpl" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Giỏ hàng</title>
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/main.css">
    <link rel="stylesheet" href="./css/custom.css">
    <link rel="stylesheet" href="./css/homepage_after.css">
</head>

<body class="white-bg">
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
                    <a href="cart.jsp" class="dropdown-item">
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
            <a href="cart.jsp">
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
                    <a href="profile" class="list-group-item list-group-item-action">
                        <i class="fas fa-user mr-2"></i> Tên người dùng: ${sessionScope.user.username}
                    </a>
                    <a href="profile" class="list-group-item list-group-item-action">
                        <i class="fas fa-envelope mr-2"></i> Email: ${sessionScope.user.email}
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="#" class="list-group-item list-group-item-action">
                        <i class="fas fa-book mr-2"></i> Khóa học của tôi
                    </a>
                    <a href="profile" class="list-group-item list-group-item-action">
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

<section class="category-header-area" style="background-image: url('https://4user.net/uploads/system/shopping_cart.png');
    background-size: cover;
    background-repeat: no-repeat;">
    <div class="image-placeholder-1"></div>
    <div class="container-lg breadcrumb-container row align-items-center">
        <nav class="col-auto" aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item display-6 fw-bold">
                    <a href="home.jsp">
                        Trang chủ
                    </a>
                </li>
                <li class="breadcrumb-item active text-light display-6 fw-bold">
                    Giỏ hàng
                </li>
            </ol>
        </nav>
        <div class="col-3 ms-auto d-none d-sm-inline-block">
            <div class="book-img">
                <img src="./icon/brd-book.png">
            </div>
        </div>
    </div>
</section>

<section class="cart-list-area">
    <div class="container">
        <div class="row" id="cart_items_details">
            <div class="col-lg-9">
                <div class="in-cart-box">
                    <div class="cart-heading-text">
                        <h3>Giỏ hàng của bạn</h3>
                        <div class="course-detail">
                            <ul class="cart-course-list">
                                <!-- Hiển thị các khóa học trong giỏ hàng -->
                                <c:forEach var="course" items="${cartCourses}">
                                    <li>
                                        <div class="cart-course-wrapper box-shadow-5 align-items-center">
                                            <div class="image d-none d-md-block">
                                                <a href="course_detail.jsp?id=${course.id}">
                                                    <img src="${course.img}" alt="${course.name}" class="img-fluid">
                                                </a>
                                            </div>
                                            <div class="details">
                                                <a href="course_detail.jsp?id=${course.id}">
                                                    <div class="name">${course.name}</div>
                                                </a>
                                                <div class="course-subtitle text-13px mt-2">
                                                        ${course.description}
                                                </div>
                                            </div>
                                            <div class="move-remove text-center">
                                                <div id="${course.id}" onclick="removeFromCartList(this)">
                                                    <i class="fas fa-times-circle"></i> Xóa
                                                </div>
                                            </div>
                                            <div class="price">
                                                <div class="current-price">₫${course.price}</div>
                                            </div>
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 pt-1">
                <h5 class="fw-700">Tổng cộng:</h5>
                <div class="cart-sidebar bg-white py-4 px-3 box-shadow-5">
                    <!-- Tính tổng tiền -->
                    <c:set var="totalPrice" value="0"/>
                    <c:forEach var="course" items="${cartCourses}">
                        <c:set var="totalPrice" value="${totalPrice + course.price}"/>
                    </c:forEach>
                    <span id="total_price_of_checking_out" hidden>${totalPrice}</span>
                    <div class="total-price">₫${totalPrice}</div>
                    <div class="input-group marge-input-box mb-3">
                        <input type="text" class="form-control" placeholder="Áp dụng mã giảm giá" id="coupon-code">
                        <div class="input-group-append">
                            <button class="btn" type="button" onclick="applyCoupon()">
                                <i class="fas fa-spinner fa-pulse hidden" id="spinner"></i>
                                Áp dụng
                            </button>
                        </div>
                    </div>
                    <button type="button" class="btn red w-100 mb-3" onclick="handleCheckOut()">Thanh toán</button>
                </div>
            </div>
        </div>
    </div>
</section>

<div class="footer_content">
    <div class="footer-lienket">
        <div class="footer-lienket-title">
            <h3>Study and topic, any thing with</h3>
        </div>
        <div class="footer-lienket-info">
            <ul>
                <li><a href="https://facebook.com"><img src="icon/facebook.svg" alt=""></a></li>
                <li><a href="https://instagram.com"><img src="icon/instagram.svg" alt=""></a></li>
                <li><a href="https://twitter.com"><img src="icon/twitter.svg" alt=""></a></li>
                <li><a href="https://youtube.com"><img src="icon/youtube.svg" alt=""></a></li>
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

<script>
    function removeFromCartList(element) {
        const courseId = element.id;
        window.location.href = "removecart?id=" + courseId;
    }

    function applyCoupon() {
        // Logic to apply coupon code
    }

    function handleCheckOut() {
        // Logic to handle checkout process
    }
</script>

</body>
</html>