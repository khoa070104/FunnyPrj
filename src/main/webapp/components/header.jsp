<%--&lt;%&ndash;--%>
<%--  Created by IntelliJ IDEA.--%>
<%--  User: Khoa Bug--%>
<%--  Date: 10/07/2024--%>
<%--  Time: 13:35--%>
<%--  To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>

<%--<html>--%>
<%--<head>--%>
<%--    <title>Header</title>--%>
<%--    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">--%>
<%--    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">--%>
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">--%>
<%--</head>--%>
<%--<body>--%>
<%--<div class="cover" style="width: 90%;--%>
<%--    max-width: 1200px;--%>
<%--    margin: 0 auto;">--%>
<%--    <div class="header_info">--%>
<%--        <div class="phone_header">--%>
<%--            <div class="phone_header-logo">--%>
<%--                <img src="icon/phone.svg" alt="">--%>
<%--            </div>--%>
<%--            <div class="phone_header-info">--%>
<%--                0333333333--%>
<%--            </div>--%>
<%--            <div class="mail_header">--%>
<%--                <div class="mail_header-logo">--%>
<%--                    <img src="icon/mail.png" alt="">--%>
<%--                </div>--%>
<%--                <div class="mail_header-info">--%>
<%--                    <a href="mamgh789@gmail.com">mamgh789@gmail.com</a>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="language_header">--%>
<%--            <select name="" id="language_option">--%>
<%--                <option value="VIE">Vietnamese</option>--%>
<%--                <option value="ENG">English</option>--%>
<%--            </select>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <div class="header_bar">--%>
<%--        <div class="header_barlogosearch">--%>
<%--            <div class="header_bar-logo">--%>
<%--                <img src="icon/Logo.png" alt="">--%>
<%--            </div>--%>
<%--            <div class="header_bar-danhMuc" id="danhMuc">--%>
<%--                <div class="header_bar-danhMuc-icon">--%>
<%--                    <img src="icon/list-solid.svg" alt="">--%>
<%--                </div>--%>
<%--                <i class="header_bar-danhMuc-info">--%>
<%--                    Danh Mục--%>
<%--                </i>--%>
<%--                <div class="dropdown-menu" aria-labelledby="navbarDropdownCourses">--%>
<%--                    <a href="allcourse.jsp" class="dropdown-item" href="#">--%>
<%--                        <i class="fas fa-book mr-2"></i> Khóa học--%>
<%--                    </a>--%>
<%--                    <a href="cart.jsp" class="dropdown-item" href="#">--%>
<%--                        <i class="fas fa-store mr-2"></i> Cửa hàng--%>
<%--                    </a>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="header_bar-search">--%>
<%--                <div class="header_bar-search-info">--%>
<%--                    <input  type="text" placeholder="Tìm kiếm">--%>
<%--                </div>--%>
<%--                <div class="header_bar-search-icon">--%>
<%--                    <img src="icon/search.svg" alt="">--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="header_bar-cartsign">--%>
<%--            <div class="header_bar-cart">--%>
<%--                <a href="cart.jsp">--%>
<%--                    <div class="header_bar-cart-icon">--%>
<%--                        <img src="icon/cart.svg" alt="">--%>
<%--                    </div>--%>
<%--                </a>--%>
<%--            </div>--%>
<%--            <div class="header_bar-sign">--%>
<%--                <div class="header_bar-signUp ">--%>
<%--                    <a href="login">--%>
<%--                        <p>Log in</p>--%>
<%--                    </a>--%>
<%--                </div>--%>
<%--                <div class="header_bar-signIn">--%>
<%--                    <a href="register">--%>
<%--                        <p>Register</p>--%>
<%--                    </a>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Header</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/homepage_after.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/homepage.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header_loged.css">
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
            <a  href="home">
                <div class="header_bar-logo">
                    <img src="icon/Logo.png" alt="">
                </div>
            </a>
            <div class="header_bar-danhMuc" id="danhMuc">
                <div class="header_bar-danhMuc-icon">
                    <img src="icon/list-solid.svg" alt="">
                </div>
                <i class="header_bar-danhMuc-info">
                    Danh Mục
                </i>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownCourses">
                    <a href=list class="dropdown-item">
                        <i class="fas fa-book mr-2"></i> Khóa học
                    </a>
                    <a href="cart" class="dropdown-item">
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
            <%
                if (session.getAttribute("user") != null) {
            %>
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
            <a href="cart">
                <div class="header_bar-cart-icon">
                    <img src="icon/cart.svg" alt="Giỏ hàng">
                    <p>${sessionScope.countcart}</p>
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
            <%
            } else {
            %>
            <div class="header_bar-cartsign">
                <div class="header_bar-cart">
                    <a href="login">
                        <div class="header_bar-cart-icon">
                            <img src="icon/cart.svg" alt="Giỏ hàng">
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
            <%
                }
            %>
        </div>
    </div>
</div>
</body>
</html>