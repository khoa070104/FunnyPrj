<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Edit Lesson</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=5.0, minimum-scale=0.86">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/custom.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/coursedetail.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">



    <style>
        /* Style cho lớp bảng đè */
        .modal-overlay {
            position: fixed; /* Đảm bảo bảng đè lên toàn bộ màn hình */
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5); /* Màu nền và độ trong suốt */
            display: none; /* Mặc định ẩn khi không sử dụng */
            justify-content: center; /* Căn giữa dọc */
            align-items: center; /* Căn giữa ngang */
            z-index: 1000; /* Đảm bảo nằm trên các phần tử khác */
        }

        /* Style cho nội dung modal */
        .modal-content {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            max-width: 600px; /* Độ rộng tối đa của modal */
            width: 100%;
            max-height: 80%; /* Chiều cao tối đa của modal, có thể thay đổi theo nội dung */
            overflow: auto; /* Cho phép scroll nếu nội dung quá dài */
        }
    </style>

</head>

<body class="white-bg">
<jsp:include page="./dist/components/header.jsp"/>
<!-- Banner -->
<section class="course-header-area" style="background-image: url('https://4user.net/uploads/system/course_page_banner.png'); background-size: cover; background-position: right;">
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
            <div class="col-lg-8 order-last order-lg-first radius-10 mt-4 bg-white p-30-40 box-shadow-5">
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
                                    <div>
                                        <button type="button" class="btn btn-primary" style="background-color: #00a7c1; margin-left: 10px " onclick="showCreateLessonModal()">
                                            Create
                                        </button>
                                    </div>
                                </div>
                                <div class="course-curriculum-accordion">
                                    <div class="lecture-group-wrapper">
                                        <div id="collapse${lesson.id}" class="lecture-list collapse show">

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
                                            <div class="lecture-group-title clearfix">
                                                <div class="title float-start">${lesson.nameLesson}: </div>
                                                <div class="float-middle">${lesson.content}</div>
                                                <div class="float-end">
                                                    <span class="total-lectures">${lesson.timeLesson}</span>
                                                </div>


                                                <!-- Button to trigger edit modal -->
                                                <button type="button" class="btn btn-sm btn-outline-primary" onclick="editLessonModal('${lesson.id}', '${lesson.nameLesson}', '${lesson.content}', '${lesson.timeLesson}', '${lesson.idCourse}')">Edit</button>

                                                <!-- Form for deleting lesson -->

                                                <form action="delete-lesson" method="post" style="display: inline-block;">

                                                    <input type="hidden" name="lessonId" value="${lesson.id}">
                                                    <button type="submit" class="btn btn-sm btn-outline-danger">Delete</button>
                                                </form>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- List course gợi ý -->
    <div class="course-carousel-area">
        <div class="container">
            <div>
                <div>
                    <h3 class="course-carousel-title">
                        <div class="header-underline-2">Top 10 Khóa học mới</div>
                    </h3>
                </div>
                <div class="scroll">
                    <button class="carousel-button left" onclick="scrollLeft1()">‹</button>
                    <div class="course-list draggble">
                        <div class="course-list row">
                            <!-- Course 1 -->
                            <div class="course-box-wrap course-box-wrap-1" id="course-1">
                                <a href=""></a>
                                <div class="course-box">
                                    <div class="course-image">
                                        <p>₫500,000</p>
                                        <img src="../icon/Logo.png" alt="">
                                    </div>
                                    <div class="course-details">
                                        <div>
                                            <span>Người mới bắt đầu</span>
                                        </div>
                                        <div class="row">
                                            <h2>PRJ301</h2>
                                            <h5>Lập trình Java Web (PRJ301)</h5>
                                        </div>
                                        <div class="rating">
                                            <div class="stars">
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                                <i class="fas fa-star"></i>
                                            </div>
                                            <div class="d-inline-block">
                                                <span class="text-dark ms-1 text-12px">(5)</span>
                                                <span class="text-dark text-12px text-muted ms-2">(5 Đánh giá)</span>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div>
                                                <img src="../icon/Logo.png" alt="" width="70">
                                            </div>
                                            <div>
                                                <button class="btn-compare-sm">Compare</button>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="course-meta">
                                                <span>29:58:59 Giờ</span>
                                                <span>62 Lectures</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <button class="carousel-button right" onclick="scrollRight1()">›</button>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="./dist/components/footer.jsp"/>

<%--create--%>
<div class="modal-overlay" id="createLessonModal">
    <div class="modal-content">
        <span class="close" onclick="hideCreateLessonModal()">&times;</span>
        <h2>Create New Lesson</h2>
        <form id="createLessonForm" action="create-lesson" method="post">
            <label for="courseid">Course ID:</label><br>
            <input type="text" id="courseid" name="courseId" value="${course.id}"><br><br>
            <label for="lessonName">Lesson Name:</label><br>
            <input type="text" id="lessonName" name="lessonName" required><br><br>
            <label for="content">Content:</label><br>
            <input type="text" id="content" name="content" required><br><br>

            <label for="lessonTime">Lesson Time:</label><br>
            <input type="text" id="lessonTime" name="lessonTime" required><br><br>

            <button type="submit">Create Lesson</button>
        </form>

    </div>
</div>
<%--edit--%>
<div class="modal-overlay" id="editLessonModal">
    <div class="modal-content">
        <span class="close" onclick="hideEditLessonModal()">&times;</span>
        <h2>Edit Lesson</h2>

        <form id="editLessonForm" action="edit-lesson" method="get">

            <input type="text" id="editlessonId" name="lessonId" value="${lesson.id}" hidden >
            <label for="lessonName">Lesson Name:</label><br>
            <input type="text" id="editlessonName" name="lessonName" value="${lesson.nameLesson}" required><br><br>

            <label for="content">Content:</label><br>
            <input type="text" id="editcontent" name="content" value="${lesson.content}" required><br><br>

            <label for="lessonTime">Lesson Time:</label><br>
            <input type="text" id="editlessonTime" name="lessonTime" value="${lesson.timeLesson}" required><br><br>

            <button type="submit">Update Lesson</button>
        </form>
    </div>
</div>

<script src="../js/hompage.js"></script>


<script>
    function showCreateLessonModal() {
        document.getElementById('createLessonModal').style.display = 'flex'; // Hiển thị lớp bảng đè
    }

    function hideCreateLessonModal() {
        document.getElementById('createLessonModal').style.display = 'none'; // Ẩn lớp bảng đè
    }
</script>
<script>
    // Function to show the edit lesson modal
    function editLessonModal(lessonId, lessonName, content, lessonTime) {
        document.getElementById('editlessonId').value = lessonId;
        document.getElementById('editlessonName').value = lessonName;
        document.getElementById('editcontent').value = content;
        document.getElementById('editlessonTime').value = lessonTime;
        document.getElementById('editLessonModal').style.display = 'flex';
    }

    // Function to hide the edit lesson modal
    function hideEditLessonModal() {
        document.getElementById('editLessonModal').style.display = 'none';
    }
</script>
</body>

</html>
