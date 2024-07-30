<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Results</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
</head>

<body>
<jsp:include page="./components/header.jsp"/>

<div class="container my-4">
    <!-- Display search results -->
    <h1 class="mb-4">Search Results</h1>

    <!-- Display message if any -->
    <c:if test="${not empty message}">
        <div class="alert alert-info">${message}</div>
    </c:if>

    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>

    <c:choose>
        <c:when test="${not empty courses}">
            <div class="course-list row">
                <!-- Iterate over courses -->
                <c:forEach var="course" items="${courses}">
                    <div class="course-box-wrap col-md-4" id="course-${course.id}">
                        <div class="course-box">
                            <div class="course-image">
                                <p>₫ ${course.price}</p>
                                <img src="${course.img}" alt="Course Image">
                            </div>
                            <div class="course-details">
                                <div>
                                    <span>Người mới bắt đầu</span>
                                </div>
                                <div class="row">
                                    <h2>${course.name}</h2>
                                    <h5>${course.description}</h5>
                                </div>
                                <div class="rating">
                                    <div class="stars">
                                        <!-- Adjust rating stars based on course.rate -->
                                        <c:forEach var="i" begin="0" end="${course.rate - 1}">
                                            <i class="fas fa-star"></i>
                                        </c:forEach>
                                    </div>
                                    <div class="d-inline-block">
                                        <span class="text-dark ms-1 text-12px">(5)</span>
                                        <span class="text-dark text-12px text-muted ms-2">(5 Đánh giá)</span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="course-meta">
                                        <span>${course.timeCourse} Giờ</span>
                                        <span>${course.totalLesson} Lectures</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:when>
        <c:otherwise>
            <div class="alert alert-info">No courses found.</div>
        </c:otherwise>
    </c:choose>
</div>

<jsp:include page="./components/footer.jsp"/>

<script src="js/script.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>