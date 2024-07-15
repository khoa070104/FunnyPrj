<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Course" %>
<%@ page import="DAO.impl.ItemDAOImpl" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Giỏ hàng</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/custom.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/cart.css">
</head>

<body class="white-bg">
<jsp:include page="./components/header_loged.jsp"/>
<section class="category-header-area" style="background-image: url('https://4user.net/uploads/system/shopping_cart.png');
    background-size: cover;
    background-repeat: no-repeat;">
    <div class="image-placeholder-1"></div>
    <div class="container-lg breadcrumb-container row align-items-center">
        <nav class="col-auto" aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item display-6 fw-bold">
                    <a href="home">
                        Trang chủ
                    </a>
                </li>
                <li class="breadcrumb-item active text-light display-6 fw-bold">
                    Giỏ hàng
                </li>
            </ol>
        </nav>
        <div class="col-3 ms-auto d-none d-sm-inline-block">
            <div class="book-img">
                <img src="./icon/brd-book.png">
            </div>
        </div>
    </div>
</section>

<section class="cart-list-area">
    <div class="container">
        <div class="row" id="cart_items_details">
            <div class="col-lg-9">
                <div class="in-cart-box">
                    <div class="cart-heading-text">
                        <h3>Giỏ hàng của bạn</h3>
                        <div class="course-detail">
                            <ul class="cart-course-list">
                                <!-- Hiển thị các khóa học trong giỏ hàng -->
                                <c:forEach var="course" items="${cartCourses}">
                                    <li>
                                        <div class="cart-course-wrapper box-shadow-5 align-items-center">
                                            <div class="image d-none d-md-block">
                                                <a href="course_detail.jsp?id=${course.id}">
                                                    <img src="${course.img}" alt="${course.name}" class="img-fluid">
                                                </a>
                                            </div>
                                            <div class="details">
                                                <a href="course_detail.jsp?id=${course.id}">
                                                    <div class="name">${course.name}</div>
                                                </a>
                                                <div class="course-subtitle text-13px mt-2">
                                                        ${course.description}
                                                </div>
                                            </div>
                                            <div class="move-remove text-center">
                                                <div id="${course.id}" onclick="removeFromCartList(this)">
                                                    <i class="fas fa-times-circle"></i> Xóa
                                                </div>
                                            </div>
                                            <div class="price">
                                                <div class="current-price">₫${course.price}</div>
                                            </div>
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 pt-1">
                <h5 class="fw-700">Tổng cộng:</h5>
                <div class="cart-sidebar bg-white py-4 px-3 box-shadow-5">
                    <!-- Tính tổng tiền -->
                    <c:set var="totalPrice" value="0"/>
                    <c:forEach var="course" items="${cartCourses}">
                        <c:set var="totalPrice" value="${totalPrice + course.price}"/>
                    </c:forEach>
                    <span id="total_price_of_checking_out" hidden>${totalPrice}</span>
                    <div class="total-price">₫${totalPrice}</div>
                    <div class="input-group marge-input-box mb-3">
                        <input type="text" class="form-control" placeholder="Áp dụng mã giảm giá" id="coupon-code">
                        <div class="input-group-append">
                            <button class="btn" type="button" onclick="applyCoupon()">
                                <i class="fas fa-spinner fa-pulse hidden" id="spinner"></i>
                                Áp dụng
                            </button>
                        </div>
                    </div>
                    <!-- Form thanh toán -->
                    <form action="processVNPAYPayment" method="post">
                        <input type="hidden" name="amount" value="${totalPrice}">
                        <!-- Bạn có thể thêm các trường ẩn khác nếu cần -->
                        <button type="submit" class="btn red w-100 mb-3">Thanh toán</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="./components/footer.jsp"/>

<script>
    function removeFromCartList(element) {
        const courseId = element.id;
        window.location.href = "removecart?id=" + courseId;
    }

    function applyCoupon() {
        // Logic to apply coupon code
    }

    function handleCheckOut() {
        // Logic to handle checkout process
    }
</script>
<script src="js/hompage.js"></script>
</body>
</html>