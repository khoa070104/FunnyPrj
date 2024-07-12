<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quên mật khẩu</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/forgetpass.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
</head>
<body>

    <jsp:include page="components/header.jsp"/>
    <div class="container body_container">
        <div class="row body_singup_all">
            <div class="col-md-12 body_signin">
                <h1> Quên mật khẩu</h1>
                <p>Cung cấp địa chỉ email hợp lệ của bạn!</p>
            </div>
        </div>
        <div class="row body_form">
            <div class="col-md-6 body_form-input">
                <form action="forgotpass" method="post">
                    <div class="body_form-input-username">
                        <label for="em">Email của bạn</label>
                        <div class="input_form">
                                <span class="iconstyle">
                                    <img src="${pageContext.request.contextPath}/icon/logo_username.svg" class="input_icon" alt="">
                                </span>
                            <input type="text" placeholder="Email" id="em" name="email">
                        </div>

                    </div>


                    <div class="body_form-input-submit">
                        <input type="submit" value="Gửi yêu cầu">
                    </div>
                    <div class="body_form-input-signin">
                        <p>Muốn quay lại? <a href="signin.html">Đăng nhập.</a></p>
                    </div>
                </form>
            </div>
        </div>
    </div>
<jsp:include page="components/footer.jsp"/>
<script src="js/hompage.js"></script>
</body>

</html>