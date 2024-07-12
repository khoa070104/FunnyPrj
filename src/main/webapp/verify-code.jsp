<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Xác thực email</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mail.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/homepage.css">
</head>
<body>
<jsp:include page="components/header.jsp"/>

<div class="container">
    <div class="row">
        <div class="col-md-12 body_form">
            <h1> Xác nhận đăng nhập </h1>
            <p>Hãy cho chúng tôi biết rằng địa chỉ email này thuộc về bạn</p>
            <p>Nhập mã email được gửi tới</p>
            <form action="" method="post">
                <div class="body_form-input-verification-code">
                    <label for="maxn">Mã xác nhận</label>
                    <div class="input_form">
                            <span class="iconstyle">
                                <img src="${pageContext.request.contextPath}/icon/user.png" class="input_icon" alt="">
                            </span>
                        <input type="text" placeholder="Mã xác nhận" id="maxn" name="code">
                    </div>
                    <div class="resend-code">
                        <a href="#" id="resend-code-link">Gửi lại mã xác nhận</a>
                    </div>
                </div>
                <button type="submit" class="continue-button">Tiếp tục</button>
                <div class="body_form-input-signin">
                    <p>Bạn muốn quay lại? <a href="signin.html">Đăng Nhập</a></p>
                </div>
            </form>
        </div>
    </div>
</div>


<jsp:include page="components/footer.jsp"/>
<script src="js/hompage.js"></script>
</body>
</html>