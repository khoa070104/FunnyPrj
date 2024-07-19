<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/homepage.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
</head>

<body>
<jsp:include page="./components/header.jsp"/>
<div class="home-banner-area py-5" id="home-banner-area">
    <div class="container-lg">
        <div class="d-flex ">
            <div class="col row align-items-center position-relative baner-home">
                <div class="col-md-6 p-0 p-md-5 order-sm-1 order-2">
                    <div class="home-banner-wrap">
                        <h4 class="fw-bold">Học tập với chi phí thấp hơn</h4>
                        <p>Học bất kỳ chủ đề nào, bất cứ lúc nào. Khám phá hàng nghìn khóa học với mức giá thấp
                            nhất từ trước đến nay!</p>
                    </div>

                </div>
                <div class="col-lg-6 col-md-6 col-sm-12 col-12 order-md-2 order-sm-2 order-1 pt-0 pt-md-5 ">
                    <div id="tilt">
                        <img src="${pageContext.request.contextPath}/icon/homebanner.png" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="course-carousel-area">
    <div class="container">
        <div>
            <div>
                <h3 class="course-carousel-title">
                    <div class="header-underline-2">Top 10 khóa học mới nhất</div>
                </h3>
            </div>
            <jsp:include page="components/course-carousel.jsp"/>

        </div>
    </div>
</div>

<div class="home-fact-area">
    <div class="container-lg">
        <div class="row">
            <div class="col-md-4 d-flex">
                <div class="home-fact-box d-flex align-items-center justify-content-center mr-md-auto mr-auto">
                    <img src="${pageContext.request.contextPath}/icon/play-button.png" alt="">
                    <div class="text-box">
                        <h4>12 Khóa học trực tuyến</h4>
                        <p>Khám phá nhiều chủ đề mới</p>
                    </div>
                </div>
            </div>

            <div class="col-md-4 d-flex">
                <div class="home-fact-box d-flex align-items-center justify-content-center mr-md-auto mr-auto">
                    <img src="${pageContext.request.contextPath}/icon/leaderboard-4.svg" alt="">
                    <div class="text-box">
                        <h4>Chuyên gia đầu ngành</h4>
                    </div>
                </div>
            </div>

            <div class="col-md-4 d-flex">
                <div class="home-fact-box mr-md-auto d-flex justify-content-center align-items-center mr-auto">
                    <img src="${pageContext.request.contextPath}/icon/repeat.png" alt="">
                    <div class="text-box">
                        <h4>Truy cập trọn đời</h4>
                        <p>Học theo lịch trình của bạn</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="./components/footer.jsp"/>
<script src="js/hompage.js"></script>
</body>

</html>
