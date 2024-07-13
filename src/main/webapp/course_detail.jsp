<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>LAB211 - OOP with Java Lab</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=5.0, minimum-scale=0.86">
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/main.css">
    <link rel="stylesheet" href="./css/custom.css">
    <link rel="stylesheet" href="./css/course_detail.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
</head>

<body class="white-bg">
<div class="cover">
    <div class="header_info">
        <div class="phone_header">
            <div class="phone_header-logo">
                <img src="icon/phone.svg" alt="">
            </div>
            <div class="phone_header-info">
                <p>0333333333</p>
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
                    <a href="homework.html" class="dropdown-item" href="#">
                        <i class="fas fa-pencil-alt mr-2"></i> Bài tập
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
                    <p class="icon-text">Giảng viên</p>
                </div>
            </a>

            <!-- Khóa học của tôi Link -->
            <a href="mycourses.html">
                <div class="header_bar-cart-icon no-icon">
                    <p class="icon-text">Khóa học của tôi</p>
                </div>
            </a>

            <!-- Yêu thích Link -->
            <a href="lovecourse.html">
                <div class="header_bar-cart-icon">
                    <img src="icon/heart-regular.svg" alt="Yêu thích">
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
                        <i class="fas fa-user mr-2"></i> Tên người dùng: John Doe
                    </a>
                    <a href="#" class="list-group-item list-group-item-action">
                        <i class="fas fa-envelope mr-2"></i> Email: john.doe@example.com
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="#" class="list-group-item list-group-item-action">
                        <i class="fas fa-book mr-2"></i> Khóa học của tôi
                    </a>
                    <a href="#" class="list-group-item list-group-item-action">
                        <i class="fas fa-heart mr-2"></i> Khóa học yêu thích
                    </a>
                    <a href="#" class="list-group-item list-group-item-action">
                        <i class="fas fa-history mr-2"></i> Lịch sử mua hàng
                    </a>
                    <a href="#" class="list-group-item list-group-item-action">
                        <i class="fas fa-id-card mr-2"></i> Hồ sơ người dùng
                    </a>
                    <a href="#" class="list-group-item list-group-item-action">
                        <i class="fas fa-users mr-2"></i> Trở thành affiliate
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="#" class="list-group-item list-group-item-action">
                        <i class="fas fa-sign-out-alt mr-2"></i> Đăng xuất
                    </a>
                </div>
            </div>


        </div>
    </div>
</div>
<!-- Banner -->
<section class="course-header-area" style="background-image: url('https://4user.net/uploads/system/course_page_banner.png'); background-size: cover; background-position: right;">
    <div class="container">
        <div class="row align-items-end">
            <div class="col-lg-8">
                <div class="course-header-wrap">
                    <h1 class="title">${course.name}</h1>
                    <p class="subtitle">${course.description}</p>
                    <div class="rating-row">
                        <span class="course-badge best-seller">Người mới bắt đầu</span>
                        <div class="stars">
                            <c:forEach var="star" begin="1" end="5">
                                <i class="fas fa-star"></i>
                            </c:forEach>
                        </div>
                        <span class="d-inline-block average-rating">5</span><span>(1 Xếp hạng)</span>
                        <span class="comment"><i class="fas fa-comment"></i>VietNamese</span>
                    </div>
                    <div class="created-row">
                            <span class="created-by">
                                Tạo bởi
                                <a class="text-14px fw-600 text-decoration-none" href="#">FunnyCode</a>
                            </span>
                        <br>
                        <span class="last-updated-date d-inline-block mt-2">Cập nhật lần cuối: ???</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="course-content-area">
    <div class="container">
        <div class="row">
            <!-- Danh mục -->
            <div class="col-lg-8 order-last order-lg-first radius-10 mt-4 bg-white p-30-40 box-shadow-5">
                <div class="row bg-white d-flex justify-content-center">
                    <ul class="nav nav-tabs sNav-tabs" id="myTab" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active" id="detail-tab" data-bs-toggle="tab" data-bs-target="#course-curriculum-box" type="button" role="tab" aria-controls="course-curriculum-box" aria-selected="false">Chương trình giảng dạy</button>
                        </li>
                    </ul>
                    <div class="tab-content mt-4" id="myTabContent">
                        <div class="tab-pane fade" id="description-box" role="tabpanel" aria-labelledby="author-tab">
                            <div class="description-box view-more-parent">
                                <div class="description-content-wrap">
                                    <div class="description-content">
                                    </div>
                                </div>
                            </div>
                        </div>
                                                <!-- Chương trình giảng dạy -->
                        <div class="tab-pane fade active show" id="course-curriculum-box" role="tabpanel" aria-labelledby="course-curriculum-box">
                            <div class="course-curriculum-box">
                                <div class="course-curriculum-title clearfix mb-3">
                                    <div class="title float-start">Chương trình giảng dạy của khóa học này</div>
                                    <div class="float-end mt-2">
                                            <span class="total-lectures course-badge best-seller">
                                                ${course.totalLesson}
                                            </span>
                                    </div>
                                </div>
                                <div class="course-curriculum-accordion">
                                    <div class="lecture-group-wrapper">
                                        <div id="collapse96" class="lecture-list collapse show">
                                            <ul>
<%--                                                xem truoc --%>
                                                <li class="lecture has-preview text-14px ">
                                                    <i class="far fa-clock"></i>
                                                    <span class="lecture-title text-primary" onclick="go_course_playing_page('35', '309')">Overview Course</span>
                                                    <div class="lecture-info float-lg-end">
                                                            <span class="lecture-preview" onclick="lesson_preview('https://4user.net/home/preview_free_lesson/309', 'Bài học: Overview Course')">
                                                                <i class="fas fa-eye"></i>
                                                                Xem trước
                                                            </span>
                                                        <span class="lecture-time ps-2"> 00:06:23 </span>
                                                    </div>
                                                </li>
                                                <li class="lecture has-preview text-14px ">
                                                    <i class="far fa-file-alt"></i>
                                                    <span class="lecture-title " onclick="go_course_playing_page('35', '361')">Chi Tiết Bài Học</span>
                                                    <div class="lecture-info float-lg-end">
                                                            <span class="lecture-time ps-2">
                                                                <span class="opacity-0">.</span>
                                                            </span>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="lecture-group-wrapper">
                                        <c:forEach var="lesson" items="${lessons}">
                                            <div class="lecture-group-title clearfix" style="" data-bs-toggle="collapse" data-bs-target="#collapse24" aria-expanded="false">
                                                <div class="title float-start">${lesson.nameLesson}: </div>
                                                <div class="float-middle">${lesson.content}</div>
                                                <div class="float-end">
                                                    <span class="total-lectures">${lesson.timeLesson}</span>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Chỗ tính tiền, thêm giỏ hàng, yêu thích, so sánh -->
            <div class="col-lg-4 order-first order-lg-last">
                <div class="course-sidebar box-shadow-5 natural">
                    <div class="course-sidebar-text-box">
                        <div class="price text-center">
                            <span class="current-price"><span class="current-price">${course.price}</span></span>
<%--                            <input type="hidden" id="total_price_of_checking_out" value="500000">--%>
                        </div>

                        <!-- WISHLIST BUTTON -->
                        <div class="buy-btns">
                            <button class="btn btn-add-wishlist " type="button" id="35" onclick="handleAddToWishlist(this)">
                                Thêm vào danh sách yêu thích                </button>
                        </div>

                        <div class="buy-btns">
                            <button class="btn btn-buy-now" type="button" id="35a" onclick="handleCartItems(this)">Thêm vào giỏ hàng</button>

                            <button class="btn btn-buy" type="button" id="course_35" onclick="handleBuyNow(this)">Mua ngay</button>
                        </div>


                        <div class="includes mt-3">
                            <div class="title"><b>Bao gồm:</b></div>
                            <ul>
                                <li><i class="far fa-file-video"></i> ${course.timeCourse} </li>
                                <li><i class="far fa-file"></i>${course.totalLesson}</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- List course gợi ý -->
    <div class="course-carousel-area">
        <div class="container">
            <div>
                <div>
                    <h3 class="course-carousel-title">
                        <div class="header-underline-2">Top 10 Khóa học mới</div>
                    </h3>
                </div>
                <div class="scroll">
                    <button class="carousel-button left" onclick="scrollLeft1()">‹</button>
                    <div class="course-list draggble">
                        <div class="course-list row">
                            <!-- Course 1 -->
                            <div class="course-box-wrap course-box-wrap-1" id="course-1">
                                <a href=""></a>
                                <div class="course-box">
                                    <div class="course-image">
                                        <p>₫500,000</p>
                                        <img src="icon/Logo.png" alt="">
                                    </div>
                                    <div class="course-details">
                                        <div>
                                            <span>Người mới bắt đầu</span>
                                        </div>
                                        <div class="row">
                                            <h2>PRJ301</h2>
                                            <h5>Lập trình Java Web (PRJ301)</h5>
                                        </div>
                                        <div class="rating">
                                            <div class="stars">
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                            </div>
                                            <div class="d-inline-block">
                                                <span class="text-dark ms-1 text-12px">(5)</span>
                                                <span class="text-dark text-12px text-muted ms-2">(5 Đánh giá)</span>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div>
                                                <img src="icon/Logo.png" alt="" width="70">
                                            </div>
                                            <div>
                                                <button class="btn-compare-sm">Compare</button>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="course-meta">
                                                <span>29:58:59 Giờ</span>
                                                <span>62 Lectures</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <button class="carousel-button right" onclick="scrollRight1()">›</button>
                </div>
            </div>
        </div>
    </div>
</section>

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
            <ul class="footer-list-info-ul">
                <li><a href="list.html?id=1">Kì 1</a></li>
                <li><a href="list.html?id=1">Kì 1</a></li>
                <li><a href="list.html?id=1">Kì 1</a></li>
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
<footer>
    <div class="footer-logo">
        <img src="icon/logo.png" alt="">
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