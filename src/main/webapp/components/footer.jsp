<%--
  Created by IntelliJ IDEA.
  User: ngoch
  Date: 7/12/2024
  Time: 9:52 PM
  To change this template use File | Settings | File Templates.
--%>
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
            <ul class="footer-list-info-ul">
                <li ><a href="list.html?id=1">Kì 1</a></li>
                <li ><a href="list.html?id=1">Kì 1</a></li>
                <li ><a href="list.html?id=1">Kì 1</a></li>
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
</body>
</html>
