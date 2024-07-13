<%--
  Created by IntelliJ IDEA.
  User: Khoa Bug
  Date: 10/07/2024
  Time: 13:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Header</title>
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
                    <a href="cart.html" class="dropdown-item" href="#">
                        <i class="fas fa-store mr-2"></i> Cửa hàng
                    </a>
                </div>
            </div>
            <div class="header_bar-search">
                <div class="header_bar-search-info">
                    <input  type="text" placeholder="Tìm kiếm">
                </div>
                <div class="header_bar-search-icon">
                    <img src="icon/search.svg" alt="">
                </div>
            </div>
        </div>
        <div class="header_bar-cartsign">
            <div class="header_bar-cart">
                <a href="cart.html">
                    <div class="header_bar-cart-icon">
                        <img src="icon/cart.svg" alt="">
                    </div>
                </a>
            </div>
            <div class="header_bar-sign">
                <div class="header_bar-signUp ">
                    <a href="login">
                        <p>Log in</p>
                    </a>
                </div>
                <div class="header_bar-signIn">
                    <a href="register">
                        <p>Register</p>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>