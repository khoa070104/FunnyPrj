
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
            <h3> Học Funny Pass Code </h3>
        </div>
        <div class="footer-lienket-info">
            <ul >
                <li><a href="facebook.com/groups/213350501681569"><img src="icon/facebook.svg" alt=""></a></li>
                <li><a href="instagram.com"><img src="icon/instagram.svg" alt=""></a></li>
                <li><a href="twitter.com"><img src="icon/twitter.svg" alt=""></a></li>
                <li><a href="youtube.com/@FUNNYCODE"><img src="icon/youtube.svg" alt=""></a></li>
            </ul>
        </div>
    </div>
    <div class="footer-list">
        <div class="footer-list-title">
            <h3>Danh mục</h3>
        </div>
        <div class="footer-list-info">
            <ul class="footer-list-info-ul">
                <li ><a href="list">Tất cả các khoá học</a></li>
                <li ><a href="searchUser">Tìm kiêm bạn bè</a></li>
                <li ><a href="listpost">Tìm sự trợ giúp </a></li>
                <li ><a href="cart">Giỏ Hàng</a></li>
                <li ><a href="profile">Profile</a></li>
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
                <li><a href="register">Register</a></li>
            </ul>
        </div>
    </div>
</div>
<footer>
    <div href="home" class="footer-logo">
        <img src="${pageContext.request.contextPath}/icon/Logo.png" alt="">
    </div>
    <div class="footer-info">
        <p>© 2024 FunnyCode, Pass Code To Funny - All Rights Reserved.</p>
    </div>
</footer>
</body>
</html>
