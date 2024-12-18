
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Footer</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
</head>
<body>
<div class="footer_content">
    <div class="footer-lienket">
        <div class="footer-lienket-title">
            <h3>Study and topic, any thing with </h3>
        </div>
        <div class="footer-lienket-info">
            <ul >
                <li><a href="facebook.com"><img src="${pageContext.request.contextPath}/admin/dist/icon/facebook.svg" alt=""></a></li>
                <li><a href="instagram.com"><img src="${pageContext.request.contextPath}/admin/dist/icon/instagram.svg" alt=""></a></li>
                <li><a href="twitter.com"><img src="${pageContext.request.contextPath}/admin/dist/icon/twitter.svg" alt=""></a></li>
                <li><a href="youtube.com"><img src="${pageContext.request.contextPath}/admin/dist/icon/youtube.svg" alt=""></a></li>
            </ul>
        </div>
    </div>
    <div class="footer-list">
        <div class="footer-list-title">
            <h3>Danh mục hàng đầu</h3>
        </div>
        <div class="footer-list-info">
            <ul class="footer-list-info-ul">
                <li ><a href="list.html?id=1">Kì 1</a></li>
                <li ><a href="list.html?id=1">Kì 2</a></li>
                <li ><a href="list.html?id=1">Kì 3</a></li>
                <li ><a href="list.html?id=1">Bài tập</a></li>
            </ul>
        </div>
    </div>
    <div class="footer-favorite">
        <div class="footer-list-title">
            <h3>Liên kết hữu ích</h3>
        </div>
        <div class="footer-favorite-info">
            <ul class="footer-list-info-ul">
                <li><a href="login">Login</a></li>
                <li><a href="register">SignUp</a></li>
            </ul>
        </div>
    </div>
</div>
<footer>
    <div href="home" class="footer-logo">
        <img src="${pageContext.request.contextPath}/admin/dist/icon/Logo.png" alt="">
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
</body>
</html>
