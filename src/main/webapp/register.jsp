<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>


<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up - Đăng kí</title>
    <link rel="stylesheet" href="css/register.css">
    <link rel="stylesheet" href="css/homepage.css">
    <script>
        function validatePassword() {
            var password = document.getElementById("pa").value;
            var confirmPassword = document.getElementById("cpass").value;
            if (password !== confirmPassword) {
                document.getElementById("passwordError").innerText = "Mật khẩu không khớp!";
                return false;
            }
            document.getElementById("passwordError").innerText = "";
            return true;
        }

    </script>
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
        </div>
        <div class="mail_header">
            <div class="mail_header-logo">
                <img src="icon/mail.png" alt="">
            </div>
            <div class="mail_header-info">
                <a href="mailto:mamgh789@gmail.com">mamgh789@gmail.com</a>
            </div>
        </div>
        <div class="language_header">
            <select name="" id="">
                <option value="VIE">Vietnamese</option>
                <option value="ENG">English</option>
            </select>
        </div>
    </div>

    <div class="header_bar">
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
            </div>
            <div class="header_bar-search-icon">
                <img src="icon/search.svg" alt="">
            </div>
        </div>
        <div class="header_bar-cart">
            <a href="cart.html">
                <div class="header_bar-cart-icon">
                    <img src="icon/cart.svg" alt="">
                </div>
            </a>
        </div>
        <div class="header_bar-signUp">
            <a href="login">
                <p>Log in</p>
            </a>
        </div>
        <div class="header_bar-signIn">
            <a href="#">
                <p>Register</p>
            </a>
        </div>
    </div>

</div>

<div class="container">
    <div class="row">
        <div class="col-md-12 body_signup">
            <h1> Đăng Kí</h1>
            <p>Đăng kí và học tập</p>
        </div>
    </div>

    <div class="row body_form">
        <div class="col-md-6 body_form-img">
            <img src="icon/signup_banner.png" alt="">
        </div>
        <div class="col-md-6 body_form-input">
            <c:if test="${requestScope.msg != null}">
                <div class="alert alert-danger">
                    <strong>${requestScope.msg}</strong>
                </div>
            </c:if>
            <form id="signupForm" action="register" method="post" onsubmit="return validatePassword()">
                <div class="body_form-input-firstname">
                    <label for="name">Username:</label>
                    <div class="input_form">
                          <span class="iconstyle">
                            <img src="icon/user.png" class="input_icon" alt="">
                          </span>
                        <input type="text" placeholder="Tên" id="name" name="username">
                    </div>
                </div>
                <div class="body_form-input-email">
                    <label for="em">Email</label>
                    <div class="input_form">
                          <span class="iconstyle">
                             <img src="icon/logo_email.svg" class="input_icon" alt="">
                          </span>
                        <input type="email" placeholder="Email" id="em" name="email">
                    </div>
                </div>
                <div class="body_form-input-password">
                    <label for="pa">Mật Khẩu</label>
                    <div class="input_form">
                          <span class="iconstyle">
                               <img src="icon/logo_password.svg" class="input_icon" alt="">
                          </span>
                        <input type="password" placeholder="Mật Khẩu" id="pa" name="password">
                    </div>
                </div>
                <div class="body_form-input-lastname">
                    <label for="cpass">Nhập lại mật khẩu</label>
                    <div class="input_form">
                          <span class="iconstyle">
                            <img src="icon/user.png" class="input_icon" alt="">
                          </span>
                        <input type="password" placeholder="Nhập lại password" id="cpass" name="confirm_password">
                    </div>
                </div>
                <div id="passwordError" style="color:red;"></div>
                <div class="body_form-input-submit">
                    <input type="submit" value="Đăng Ký">
                </div>
                <div class="body_form-input-signin">
                    <p>Bạn đã có tài khoản ? <a href="signin.html">Đăng Nhập</a></p>
                </div>
            </form>
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
            <ul>
                <li><a href="list.html?id=1">Kì 1</a></li>
                <li><a href="list.html?id=1">Kì 1</a></li>
                <li><a href="list.html?id=1">Kì 1</a></li>
                <li><a href="list.html?id=1">Kì 1</a></li>
                <li><a href="list.html?id=1">Bài tập</a></li>
            </ul>
        </div>
    </div>
    <div class="footer-favorite">
        <div class="footer-favorite-title">
            <h3>Liên kết hữu ích</h3>
        </div>
        <div class="footer-favorite-info">
            <ul>
                <li><a href="">Blog</a></li>
                <li><a href="">Login</a></li>
                <li><a href="">SignUp</a></li>
            </ul>
        </div>
    </div>
</div>
<footer>
    <div class="footer-logo">
        <img src="icon/Logo.png" alt="">
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
<script>

</script>

</body>
</html>
