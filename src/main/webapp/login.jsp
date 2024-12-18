<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Đăng nhập</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
</head>
<body>
    <jsp:include page="./components/header.jsp"/>
    <div class="container">
        <div class="row">
            <div class="col-md-12 body_signin">
                <h1>Đăng Nhập</h1>
                <p>Cung cấp thông tin đăng nhập hợp lệ của bạn!</p>
            </div>
        </div>
        <div class="row body_form">
            <div class="col-md-6 body_form-img">
                <img src="${pageContext.request.contextPath}/icon/login_banner.png"  alt="">
            </div>
            <div class="col-md-6 body_form-input">
                <c:if test="${requestScope.error != null}">
                    <div class="alert alert-danger">
                        <p>${requestScope.error}</p>
                    </div></c:if>
                <c:if test="${requestScope.msg != null}">
                    <div class="alert alert-danger">
                        <p>${requestScope.msg}</p>
                    </div></c:if>
                <form action="login" method="post">
                    <div class="body_form-input-username">
                        <label for="em">Username</label>
                        <div class="input_form">
                                <span class="iconstyle">
                                    <img src="${pageContext.request.contextPath}/icon/logo_username.svg" class="input_icon" alt="" >
                                </span>
                            <input type="text" placeholder="Username" id="em" value="${sessionScope.username}" name="username" >
                        </div>

                    </div>
                    <div class="body_form-input-password">
                        <label for="pa">Password</label>
                        <div class="input_form">
                                <span class="iconstyle">
                                    <img src="${pageContext.request.contextPath}/icon/logo_password.svg" class="input_icon" alt="" >
                                </span>
                            <input type="password" placeholder="Password" id="pa" name="password">
                        </div>
                    </div>
                    <label class="checkbox-label">
                        <input type="checkbox" class="checkbox-input" name="remember" value="on"> Remember Password
                    </label>
                    <div class="body_form-input-forget">
                        <a href="forget.html">Quên mật khẩu?</a>
                    </div>
                    <div class="body_form-input-submit">
                        <input class="hoverbutton" type="submit" value="Đăng nhập">
                    </div>
                    <div class="body_form-input-signin">
                        <p>Chưa có tài khoản, <a href="register.jsp">Đăng kí.</a></p>
                    </div>
                </form>
                <div class="body_form-input-google">
                    <a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/FunnyCodeWeb/LoginGoogle&response_type=code&client_id=957561951017-38543te6feepe3geb5sh6ae2jpgsksi4.apps.googleusercontent.com&approval_prompt=force">
                        <img src="${pageContext.request.contextPath}/icon/google_logo.png" alt="Google Logo" style="width:20px; height:20px; margin-right:5px;">
                        <label>Login With Google</label>
                    </a>
                </div>
            </div>
        </div>
    </div>
<jsp:include page="./components/footer.jsp"/>
<script src="js/script.js"></script>
</body>

</html>
