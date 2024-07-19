<html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<div class="cover" style="width: 90%;
    max-width: 1200px;
    margin: 0 auto;">
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
            <div id = "google_translate_element">
            <div id = "google_translate_element">
            <script src="https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit">
            </script>
            <script>
                function googleTranslateElementInit(){
                    new google.translate.TranslateElement(
                        {pageLanguage: 'vi'},
                        'google_translate_element'
                    );
                }
            </script>
            </div>
        </div>
    </div>
    </div>
    <div class="header_bar">
            <div class="header_barlogosearch">
                <a  href="home">
                    <div class="header_bar-logo">
                        <img src="${pageContext.request.contextPath}/admin/dist/icon/Logo.png" alt="">
                    </div>
                </a>
                <div class="header_bar-danhMuc" id="danhMuc">
                    <div class="header_bar-danhMuc-icon">
                        <i class="fa fa-list-ul" aria-hidden="true"></i>
                    </div>
                    <i class="header_bar-danhMuc-info">
                        Danh Mục
                    </i>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownCourses">
                        <a href=list class="dropdown-item">
                            <i class="fas fa-book mr-2"></i> Tạo bài viết
                        </a>
                        <a href="cart" class="dropdown-item">
                            <i class="fa fa-users mr-2" aria-hidden="true"></i> Tìm kiếm bạn bè
                        </a>
                    </div>
                </div>
                <div class="header_bar-search">
                    <div class="header_bar-search-info">
                        <input type="text" placeholder="Tìm kiếm">
                        <div class="header_bar-search-icon">
                            <img src="${pageContext.request.contextPath}/admin/dist/icon/search.svg" alt="">
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
                    <div class="header_bar-cart-icon no-icon">
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
                    <div class="header_bar-cart-icon have-icon">
                        <img src="${pageContext.request.contextPath}/admin/dist/icon/cart.svg" alt="Giỏ hàng">
                        <p>${sessionScope.countcart}</p>
                    </div>
                </a>

                <!-- Hồ sơ Link -->
                <div class="header_bar-cart header_bar-cart-user">
                    <a class="profile-link">
                        <div class="header_bar-cart-icon have-icon">
                            <img src="${pageContext.request.contextPath}/admin/dist/icon/user.png" alt="Hồ sơ" style="border-radius: 50%; height: 65%;">
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
                        <a href="cart">
                            <div class="header_bar-cart-ic">
                                <img src="${pageContext.request.contextPath}/admin/dist/icon/cart.svg" alt="Giỏ hàng">
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