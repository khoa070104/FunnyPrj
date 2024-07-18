<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>

<%--<head>--%>
<%--    <title>${course.name}</title>--%>
<%--    <meta charset="utf-8">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=5.0, minimum-scale=0.86">--%>
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">--%>
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">--%>
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/custom.css">--%>
<%--    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/coursedetail.css">--%>
<%--    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">--%>
<%--</head>--%>

<%--<body class="white-bg">--%>
<%--<jsp:include page="./components/header_loged.jsp"/>--%>
<%--<!-- Banner -->--%>
<%--<section class="course-header-area" style="background-image: url('https://4user.net/uploads/system/course_page_banner.png'); background-size: cover; background-position: right;">--%>
<%--    <div class="container">--%>
<%--        <div class="row align-items-end">--%>
<%--            <div class="col-lg-8">--%>
<%--                <div class="course-header-wrap">--%>
<%--                    <h1 class="title">${course.name}</h1>--%>
<%--                    <p class="subtitle">${course.description}</p>--%>
<%--                    <div class="rating-row">--%>
<%--                        <span class="course-badge best-seller">Người mới bắt đầu</span>--%>
<%--                        <div class="stars">--%>
<%--                            <c:forEach var="star" begin="1" end="5">--%>
<%--                                <i class="fas fa-star"></i>--%>
<%--                            </c:forEach>--%>
<%--                        </div>--%>
<%--                        <span class="d-inline-block average-rating">5</span><span>(1 Xếp hạng)</span>--%>
<%--                        <span class="comment"><i class="fas fa-comment"></i>VietNamese</span>--%>
<%--                    </div>--%>
<%--                    <div class="created-row">--%>
<%--                            <span class="created-by">--%>
<%--                                Tạo bởi--%>
<%--                                <a class="text-14px fw-600 text-decoration-none" href="#">FunnyCode</a>--%>
<%--                            </span>--%>
<%--                        <br>--%>
<%--                        <span class="last-updated-date d-inline-block mt-2">Cập nhật lần cuối: ???</span>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</section>--%>

<%--<section class="course-content-area">--%>
<%--    <div class="container">--%>
<%--        <div class="row">--%>
<%--            <!-- Danh mục -->--%>
<%--            <div class="col-lg-8 order-last order-lg-first radius-10 mt-4 bg-white p-30-40 box-shadow-5">--%>
<%--                <div class="row bg-white d-flex justify-content-center">--%>
<%--                    <ul class="nav nav-tabs sNav-tabs" id="myTab" role="tablist">--%>
<%--                        <li class="nav-item" role="presentation">--%>
<%--                            <button class="nav-link active" id="detail-tab" data-bs-toggle="tab" data-bs-target="#course-curriculum-box" type="button" role="tab" aria-controls="course-curriculum-box" aria-selected="false">Chương trình giảng dạy</button>--%>
<%--                        </li>--%>
<%--                    </ul>--%>
<%--                    <div class="tab-content mt-4" id="myTabContent">--%>
<%--                        <div class="tab-pane fade" id="description-box" role="tabpanel" aria-labelledby="author-tab">--%>
<%--                            <div class="description-box view-more-parent">--%>
<%--                                <div class="description-content-wrap">--%>
<%--                                    <div class="description-content">--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                                                <!-- Chương trình giảng dạy -->--%>
<%--                        <div class="tab-pane fade active show" id="course-curriculum-box" role="tabpanel" aria-labelledby="course-curriculum-box">--%>
<%--                            <div class="course-curriculum-box">--%>
<%--                                <div class="course-curriculum-title clearfix mb-3">--%>
<%--                                    <div class="title float-start">Chương trình giảng dạy của khóa học này</div>--%>
<%--                                    <div class="float-end mt-2">--%>
<%--                                            <span class="total-lectures course-badge best-seller">--%>
<%--                                                ${course.totalLesson}--%>
<%--                                            </span>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="course-curriculum-accordion">--%>
<%--                                    <div class="lecture-group-wrapper">--%>
<%--                                        <div id="collapse96" class="lecture-list collapse show">--%>
<%--                                            <ul>--%>
<%--&lt;%&ndash;                                                xem truoc &ndash;%&gt;--%>
<%--                                                <li class="lecture has-preview text-14px ">--%>
<%--                                                    <i class="far fa-clock"></i>--%>
<%--                                                    <span class="lecture-title text-primary" onclick="go_course_playing_page('35', '309')">Overview Course</span>--%>
<%--                                                    <div class="lecture-info float-lg-end">--%>
<%--                                                            <span class="lecture-preview" onclick="lesson_preview('https://4user.net/home/preview_free_lesson/309', 'Bài học: Overview Course')">--%>
<%--                                                                <i class="fas fa-eye"></i>--%>
<%--                                                                Xem trước--%>
<%--                                                            </span>--%>
<%--                                                        <span class="lecture-time ps-2"> 00:06:23 </span>--%>
<%--                                                    </div>--%>
<%--                                                </li>--%>
<%--                                                <li class="lecture has-preview text-14px ">--%>
<%--                                                    <i class="far fa-file-alt"></i>--%>
<%--                                                    <span class="lecture-title " onclick="go_course_playing_page('35', '361')">Chi Tiết Bài Học</span>--%>
<%--                                                    <div class="lecture-info float-lg-end">--%>
<%--                                                            <span class="lecture-time ps-2">--%>
<%--                                                                <span class="opacity-0">.</span>--%>
<%--                                                            </span>--%>
<%--                                                    </div>--%>
<%--                                                </li>--%>
<%--                                            </ul>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                    <div class="lecture-group-wrapper">--%>
<%--                                        <c:forEach var="lesson" items="${lessons}">--%>
<%--                                            <div class="lecture-group-title clearfix" style="" data-bs-toggle="collapse" data-bs-target="#collapse24" aria-expanded="false">--%>
<%--                                                <div class="title float-start">${lesson.nameLesson}: </div>--%>
<%--                                                <div class="float-middle">${lesson.content}</div>--%>
<%--                                                <div class="float-end">--%>
<%--                                                    <span class="total-lectures">${lesson.timeLesson}</span>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </c:forEach>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <!-- Chỗ tính tiền, thêm giỏ hàng, yêu thích, so sánh -->--%>
<%--            <div class="col-lg-4 order-first order-lg-last">--%>
<%--                <div class="course-sidebar box-shadow-5 natural">--%>
<%--                    <div class="course-sidebar-text-box">--%>
<%--                        <div class="price text-center">--%>
<%--                            <span class="current-price"><span class="current-price">${course.price}</span></span>--%>
<%--&lt;%&ndash;                            <input type="hidden" id="total_price_of_checking_out" value="500000">&ndash;%&gt;--%>
<%--                        </div>--%>

<%--                        <!-- WISHLIST BUTTON -->--%>
<%--                        <div class="buy-btns">--%>
<%--                            <button class="btn btn-add-wishlist " type="button" id="35" onclick="handleAddToWishlist(this)">--%>
<%--                                Thêm vào danh sách yêu thích                </button>--%>
<%--                        </div>--%>

<%--                        <div class="buy-btns">--%>
<%--                            <button class="btn btn-buy-now" type="button" id="35a" onclick="handleCartItems(this)">Thêm vào giỏ hàng</button>--%>

<%--                            <button class="btn btn-buy" type="button" id="course_35" onclick="handleBuyNow(this)">Mua ngay</button>--%>
<%--                        </div>--%>


<%--                        <div class="includes mt-3">--%>
<%--                            <div class="title"><b>Bao gồm:</b></div>--%>
<%--                            <ul>--%>
<%--                                <li><i class="far fa-file-video"></i> ${course.timeCourse} </li>--%>
<%--                                <li><i class="far fa-file"></i>${course.totalLesson}</li>--%>
<%--                            </ul>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <!-- List course gợi ý -->--%>
<%--    <div class="course-carousel-area">--%>
<%--        <div class="container">--%>
<%--            <div>--%>
<%--                <div>--%>
<%--                    <h3 class="course-carousel-title">--%>
<%--                        <div class="header-underline-2">Top 10 Khóa học mới</div>--%>
<%--                    </h3>--%>
<%--                </div>--%>
<%--                <div class="scroll">--%>
<%--                    <button class="carousel-button left" onclick="scrollLeft1()">‹</button>--%>
<%--                    <div class="course-list draggble">--%>
<%--                        <div class="course-list row">--%>
<%--                            <!-- Course 1 -->--%>
<%--                            <div class="course-box-wrap course-box-wrap-1" id="course-1">--%>
<%--                                <a href=""></a>--%>
<%--                                <div class="course-box">--%>
<%--                                    <div class="course-image">--%>
<%--                                        <p>₫500,000</p>--%>
<%--                                        <img src="icon/Logo.png" alt="">--%>
<%--                                    </div>--%>
<%--                                    <div class="course-details">--%>
<%--                                        <div>--%>
<%--                                            <span>Người mới bắt đầu</span>--%>
<%--                                        </div>--%>
<%--                                        <div class="row">--%>
<%--                                            <h2>PRJ301</h2>--%>
<%--                                            <h5>Lập trình Java Web (PRJ301)</h5>--%>
<%--                                        </div>--%>
<%--                                        <div class="rating">--%>
<%--                                            <div class="stars">--%>
<%--                                                <i class="fas fa-star"></i>--%>
<%--                                                <i class="fas fa-star"></i>--%>
<%--                                                <i class="fas fa-star"></i>--%>
<%--                                                <i class="fas fa-star"></i>--%>
<%--                                                <i class="fas fa-star"></i>--%>
<%--                                            </div>--%>
<%--                                            <div class="d-inline-block">--%>
<%--                                                <span class="text-dark ms-1 text-12px">(5)</span>--%>
<%--                                                <span class="text-dark text-12px text-muted ms-2">(5 Đánh giá)</span>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                        <div class="row">--%>
<%--                                            <div>--%>
<%--                                                <img src="icon/Logo.png" alt="" width="70">--%>
<%--                                            </div>--%>
<%--                                            <div>--%>
<%--                                                <button class="btn-compare-sm">Compare</button>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                        <div class="row">--%>
<%--                                            <div class="course-meta">--%>
<%--                                                <span>29:58:59 Giờ</span>--%>
<%--                                                <span>62 Lectures</span>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <button class="carousel-button right" onclick="scrollRight1()">›</button>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</section>--%>

<%--<jsp:include page="./components/footer.jsp"/>--%>
<%--<script src="js/hompage.js"></script>--%>
<%--</body>--%>

<%--</html>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.stream.Collectors" %>
<%@ page import="jakarta.servlet.http.Cookie" %>
<%@ page import="model.Course" %>
<%@ page import="model.User" %>
<%@ page import="DAO.impl.ItemDAOImpl" %>
<%@ page import="java.util.ArrayList" %>
<%
    ItemDAOImpl itemDAO = new ItemDAOImpl();
    List<Course> courses = itemDAO.getTop10CoursesByDate();
    request.setAttribute("courses", courses);

    // Kiểm tra trạng thái đăng nhập
    HttpSession session1 = request.getSession();
    User user = (User) session1.getAttribute("user");
    boolean isLoggedIn = (user != null);

    List<String> cartIds = new ArrayList<>();
    if (isLoggedIn) {
        String username = user.getUsername();
        Cookie[] cookies = request.getCookies();
        String cartValue = "";
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("cart")) {
                    cartValue = cookie.getValue();
                    break;
                }
            }
        }

        if (!cartValue.isEmpty()) {
            String[] items = cartValue.split("_");
            for (int i = 0; i < items.length; i++) {
                if (i % 2 == 0 && username.equals(items[i])) {
                    cartIds.add(items[i + 1]);
                }
            }
        }
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>LAB211 - OOP with Java Lab</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=5.0, minimum-scale=0.86">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/custom.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/coursedetail.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
</head>

<body class="white-bg">
<jsp:include page="./components/header.jsp"/>

<!-- Banner -->
<section class="course-header-area"
         style="background-image: url('https://4user.net/uploads/system/course_page_banner.png'); background-size: cover; background-position: right;height: 250px">
    <div class="container">
        <div class="row align-items-end">
            <div class="col-lg-8">
                <div class="course-header-wrap">
                    <h1 class="title">${course.name}</h1>
                    <p class="subtitle">${course.description}</p>
                    <div class="rating-row">
                        <span class="course-badge best-seller">Người mới bắt đầu</span>
                    </div>
                    <div class="created-row">
                            <span class="created-by">
                                Tạo bởi
                                <a class="text-14px fw-600 text-decoration-none" href="#">FunnyCode</a>
                            </span>
                        <br>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="course-content-area">
    <div class="container">
        <div class="row">
            <!-- Danh mục -->
            <div class="col-lg-8 order-last order-lg-first radius-10 mt-4 bg-white box-shadow-5"
                 style="padding: 30px 40px">
                <div class="row bg-white d-flex justify-content-center">
                    <ul class="nav nav-tabs sNav-tabs" id="myTab" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active" id="detail-tab" data-bs-toggle="tab" data-bs-target="#course-curriculum-box" type="button" role="tab" aria-controls="course-curriculum-box" aria-selected="false">Chương trình giảng dạy</button>
                        </li>
                    </ul>
                    <div class="tab-content mt-4" id="myTabContent">
                        <div class="tab-pane fade" id="description-box" role="tabpanel" aria-labelledby="author-tab">
                            <div class="description-box view-more-parent">
                                <div class="description-content-wrap">
                                    <div class="description-content">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Chương trình giảng dạy -->
                        <div class="tab-pane fade active show" id="course-curriculum-box" role="tabpanel" aria-labelledby="course-curriculum-box">
                            <div class="course-curriculum-box">
                                <div class="course-curriculum-title clearfix mb-3">
                                    <div class="title float-start">Chương trình giảng dạy của khóa học này</div>
                                    <div class="float-end mt-2">
                                            <span class="total-lectures course-badge best-seller">
                                                ${course.totalLesson}
                                            </span>
                                    </div>
                                </div>
                                <div class="course-curriculum-accordion">
                                    <div class="lecture-group-wrapper">
                                        <div id="collapse96" class="lecture-list collapse show">
                                            <ul>
                                                <%--                                                xem truoc --%>
                                                <li class="lecture has-preview text-14px ">
                                                    <i class="far fa-file-alt"></i>
                                                    <span class="lecture-title " onclick="go_course_playing_page('35', '361')">Chi Tiết Bài Học</span>
                                                    <div class="lecture-info float-lg-end">
                                                            <span class="lecture-time ps-2">
                                                                <span class="opacity-0">.</span>
                                                            </span>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="lecture-group-wrapper">
                                        <c:forEach var="lesson" items="${lessons}">
                                            <div class="lecture-group-title clearfix" style="" data-bs-toggle="collapse" data-bs-target="#collapse24" aria-expanded="false">
                                                <div class="title float-start">${lesson.nameLesson}: </div>
                                                <div class="float-middle">${lesson.content}</div>
                                                <div class="float-end">
                                                    <span class="total-lectures">${lesson.timeLesson}</span>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Chỗ tính tiền, thêm giỏ hàng, yêu thích, so sánh -->
            <div class="col-lg-4 order-first order-lg-last">
                <div class="course-sidebar box-shadow-5 natural" style="top: 30px">
                    <div class="course-sidebar-text-box">
                        <div class="price text-center">
                            <span class="current-price"><span class="current-price">₫500,000</span></span>
                            <input type="hidden" id="total_price_of_checking_out" value="₫500,000">
                        </div>

                        <!-- WISHLIST BUTTON -->
                        <div class="buy-btns">
                            <button class="btn btn-add-wishlist " type="button" id="35" onclick="handleAddToWishlist(this)">
                                Thêm vào danh sách yêu thích                </button>
                        </div>

                        <div class="buy-btns">
                            <button class="btn btn-buy-now" type="button" id="35" onclick="handleCartItems(this)">Thêm vào giỏ hàng</button>
                            <button class="btn btn-buy" type="button" id="course_35" onclick="handleBuyNow(this)">Mua ngay</button>
                        </div>


                        <div class="includes mt-3">
                            <div class="title"><b>Bao gồm:</b></div>
                            <ul>
                                <li><i class="far fa-file-video"></i> 39:51:31 Giờ Video theo yêu cầu </li>
                                <li><i class="far fa-file"></i>107 Bài học</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
    <!-- List course gợi ý -->
    <div class="course-carousel-area" style=" height: 650px;width: 100%;overflow: hidden">
        <div class="container">
            <div>
                <div>
                    <h3 class="course-carousel-title">
                        <div class="header-underline-2">Top 10 Khóa học mới</div>
                    </h3>
                </div>
                <div class="course-list draggable">
                    <button class="carousel-button left" onclick="scrollLeft2()">‹</button>
                    <div class="course-list row">
                        <!-- Iterate over courses -->
                        <% for (Course course : courses) { %>
                        <div class="course-box-wrap course-box-wrap-2" id="course-<%= course.getId() %>">
                            <a href="course_detail.jsp"></a>
                            <div class="course-box">
                                <div class="course-image">
                                    <p>₫ <%= course.getPrice() %></p>
                                    <img style="height: 130px" src="<%= course.getImg() %>" alt="">
                                </div>
                                <div class="course-details">
                                    <div>
                                        <span>Người mới bắt đầu</span>
                                    </div>
                                    <div class="row">
                                        <h2><%= course.getName() %></h2>
                                        <h6 style="min-height: 40px"><%= course.getDescription() %></h6>
                                    </div>

                                    <div class="rating">
                                        <div class="stars">
                                            <!-- Adjust rating stars based on course.getRate() -->
                                            <% for (int i = 0; i < course.getRate(); i++) { %>
                                            <i class="fas fa-star"></i>
                                            <% } %>
                                        </div>
                                        <div class="d-inline-block">
                                            <span class="text-dark ms-1 text-12px">(5)</span>
                                            <span class="text-dark text-12px text-muted ms-2">(5 Đánh giá)</span>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="course-meta">
                                            <span><%= course.getTimeCourse() %> Giờ</span>
                                            <span><%= course.getTotalLesson() %> Lectures</span>
                                        </div>
                                    </div>

                                    <!-- Add to Cart Button -->
                                    <% if (!isLoggedIn) { %>
                                    <button type="button" class="btn btn-warning"
                                            style="background-color: #eceb98; font-weight: 500;" onclick="alert('Bạn cần đăng nhập để thêm vào giỏ hàng')">Đăng nhập để thêm vào giỏ hàng</button>
                                    <% } else if (cartIds.contains(String.valueOf(course.getId()))) { %>
                                    <button type="button" class="btn btn-secondary" disabled>Đã thêm vào giỏ</button>
                                    <% } else { %>
                                    <form action="add-to-cart" method="post">
                                        <input type="hidden" name="courseId" value="<%= course.getId() %>">
                                        <button type="submit" class="btn btn-primary hover-button"
                                                style="background-color: #00a7c1; border-color: transparent"> Thêm vào giỏ hàng</button>
                                    </form>
                                    <% } %>

                                </div>
                            </div>
                        </div>
                        <% } %>
                    </div>
                    <button class="carousel-button right" onclick="scrollRight2()">›</button>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="./components/footer.jsp"/>
<script src="js/hompage.js"></script>
</body>

</html>