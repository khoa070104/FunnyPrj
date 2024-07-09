<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%@ page import="service.IItemService" %>
<%@ page import="service.Impl.ItemServiceImpl" %>
<%@ page import="DAO.impl.ItemDAOImpl" %>

<%
    IItemService i = new ItemServiceImpl();
    int totalCount = i.countTotal();
    int ki1 = i.countNumCourse(1);
    int ki2 = i.countNumCourse(2);
    int ki3 = i.countNumCourse(3);
    int ki4 = i.countNumCourse(4);

%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Course</title>

    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/homepage_after.css">

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

<section class="category-header-area"
         style="background-image: url('icon/course_page_banner.png'); background-size: cover; background-position: right;">
    <div class="image-placeholder-3"></div>
    <div class="container-lg breadcrumb-container row align-items-center">
        <nav class="col-auto" aria-label="breadcrumb">
            <ol class="breadcrumb" style="background-color: #6245E1 ">
                <li class="breadcrumb-item display-6 fw-bold">
                    <a href="allcourse.html" style="font-size: 40px; font-weight: 500; color:white">
                        Tất cả các khóa học </a>
                </li>
                <li class="breadcrumb-item active text-light display-6 fw-bold"
                    style="font-size: 40px; font-weight: 500; color:white">
                    Tất cả danh mục </li>
            </ol>
        </nav>
        <div class="col-3 ms-auto d-none d-sm-inline-block">
            <div class="book-img">
                <img src="icon/brd-book.png" style="width: 200px; height: 200px;">
            </div>
        </div>
    </div>
</section>

<section class="category-course-list-area">
    <div class="container-lg">
        <div class="row">
            <div class="col-lg-3 filter-area">
                <div class="card border-0 radius-10 box-shadow-5">
                    <div id="collapseFilter" class="collapse show" aria-labelledby="headingOne"
                         data-parent="#accordion">
                        <div class="card-body p-0">
                            <div class="filter_type px-4 pt-4">
                                <h5 class="fw-700 mb-4">Danh mục</h5>
                                <ul class="ul" style="list-style: none;">
                                    <li class="mt-3">
                                        <div class="text-15px fw-700 d-flex">
                                            <input type="radio" id="category_all" name="sub_category"
                                                   class="categories custom-radio" value="all" onclick="filter(this)"
                                                   checked="">
                                            <label for="category_all">Tất cả danh mục</label>
                                            <div class="ms-auto">(<%= totalCount %>)</div>
                                        </div>
                                    </li>
                                    <li class="ms-3">
                                        <div class=" d-flex">
                                            <input type="radio" id="sub_category-44" name="sub_category"
                                                   class="categories custom-radio" value="kỳ-1" onclick="filter(this)">
                                            <label for="sub_category-44">Kỳ 1</label>
                                            <div id="count-ky-1" class="ms-auto">(<%=ki1%>)</div>
                                        </div>
                                    </li>
                                    <li class="ms-3">
                                        <div class=" d-flex">
                                            <input type="radio" id="sub_category-49" name="sub_category"
                                                   class="categories custom-radio" value="kỳ-2" onclick="filter(this)">
                                            <label for="sub_category-49">Kỳ 2</label>
                                            <div id="count-ky-2" class="ms-auto">(<%=ki2%>)</div>
                                        </div>
                                    </li>
                                    <li class="ms-3">
                                        <div class=" d-flex">
                                            <input type="radio" id="sub_category-53" name="sub_category"
                                                   class="categories custom-radio" value="kỳ-3" onclick="filter(this)">
                                            <label for="sub_category-53">Kỳ 3</label>
                                            <div id="count-ky-3" class="ms-auto">(<%=ki3%>)</div>
                                        </div>
                                    </li>
                                    <li class="ms-3">
                                        <div class=" d-flex">
                                            <input type="radio" id="sub_category-54" name="sub_category"
                                                   class="categories custom-radio" value="kỳ-4" onclick="filter(this)">
                                            <label for="sub_category-54">Kỳ 4</label>
                                            <div id="count-ky-4" class="ms-auto">(<%=ki4%>)</div>
                                        </div>
                                    </li>
                                    <!-- Other categories here -->
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Other content of the section -->
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
            <ul class="footer-list-info-ul two-columns">
                <li><a href="list.html?id=1">Kì 1</a></li>
                <li><a href="list.html?id=1">Kì 2</a></li>
                <li><a href="list.html?id=1">Kì 3</a></li>
                <li><a href="list.html?id=1">Kì 4</a></li>
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
