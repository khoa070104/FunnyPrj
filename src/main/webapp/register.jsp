<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>


<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up - Đăng kí</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css">
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
<jsp:include page="./components/header.jsp"/>
<div class="container">
    <div class="row">
        <div class="col-md-12 body_signup">
            <h1> Đăng Kí</h1>
            <p>Đăng kí và học tập</p>
        </div>
    </div>

    <div class="row body_form">
        <div class="col-md-6 body_form-img">
            <img src="${pageContext.request.contextPath}/icon/signup_banner.png" alt="">
        </div>
        <div class="col-md-6 body_form-input">
            <c:if test="${requestScope.msg != null}">
                <div class="alert alert-danger">
                    <strong>${requestScope.msg}</strong>
                </div>
            </c:if>
            <form action="register" method="post" onsubmit="return validatePassword()">
                <div class="body_form-input-firstname">
                    <label for="name">Username:</label>
                    <div class="input_form">
                          <span class="iconstyle">
                            <img src="${pageContext.request.contextPath}/icon/user.png" class="input_icon" alt="">
                          </span>
                        <input type="text" placeholder="Tên" id="name" name="username">
                    </div>
                </div>
                <div class="body_form-input-email">
                    <label for="em">Email</label>
                    <div class="input_form">
                          <span class="iconstyle">
                             <img src="${pageContext.request.contextPath}/icon/logo_email.svg" class="input_icon" alt="">
                          </span>
                        <input type="email" placeholder="Email" id="em" name="email">
                    </div>
                </div>
                <div class="body_form-input-password">
                    <label for="pa">Mật Khẩu</label>
                    <div class="input_form">
                          <span class="iconstyle">
                               <img src="${pageContext.request.contextPath}/icon/logo_password.svg" class="input_icon" alt="">
                          </span>
                        <input type="password" placeholder="Mật Khẩu" id="pa" name="password">
                    </div>
                </div>
                <div class="body_form-input-lastname">
                    <label for="cpass">Nhập lại mật khẩu</label>
                    <div class="input_form">
                          <span class="iconstyle">
                            <img src="${pageContext.request.contextPath}/icon/user.png" class="input_icon" alt="">
                          </span>
                        <input type="password" placeholder="Nhập lại password" id="cpass" name="confirm_password">
                    </div>
                </div>
                <div id="passwordError" style="color:red;"></div>
                <div class="body_form-input-submit">
                    <input type="submit" value="Đăng Ký">
                </div>
                <div class="body_form-input-signin">
                    <p>Bạn đã có tài khoản ? <a href="login.jsp">Đăng Nhập</a></p>
                </div>
            </form>
        </div>
    </div>
</div>

<jsp:include page="./components/footer.jsp"/>
<script src="js/hompage.js"></script>
</body>
</html>
