<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import="service.IItemService" %>
<%@ page import="service.Impl.ItemServiceImpl" %>

<%
    IItemService i = new ItemServiceImpl();
    int totalCount = i.countTotalCourses();
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Course</title>

    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/custom.css">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>

    <script type="text/javascript">
        function change(){
            document.getElementById(Filter).submit();
        }
    </script>
</head>
<body onload="checkCategoryAll()">
<jsp:include page="./components/header.jsp"/>
<section class="category-header-area"
         style="background-image: url('${pageContext.request.contextPath}/icon/course_page_banner.png'); background-size: cover; background-position: right;">
    <div class="image-placeholder-3"></div>
    <div class="container-lg breadcrumb-container row align-items-center banner">
        <nav class="col-auto" aria-label="breadcrumb">
            <ol class="breadcrumb" style="background-color: transparent ">
                <li class="breadcrumb-item display-6 fw-bold">
                    <a href="allcourse.jsp" style="font-size: 40px; font-weight: 500; color:white">
                        Tất cả các khóa học </a>
                </li>
                <li class="breadcrumb-item active text-light display-6 fw-bold"
                    style="font-size: 40px; font-weight: 500; color:white">
                    Tất cả danh mục
                </li>
            </ol>
        </nav>
        <div class="col-3 ms-auto d-none d-sm-inline-block">
            <div class="book-img">
                <img src="${pageContext.request.contextPath}/icon/brd-book.png"
                     style="width: 200px; height: 200px; position: relative; left: 70%;">
            </div>
        </div>
    </div>
</section>

<section class="category-course-list-area">
    <ul class="container-lg">
        <ul class="row">
            <div class="col-lg-3 filter-area">
                <div class="card border-0 radius-10 box-shadow-5">
                    <div id="collapseFilter" class="collapse show" aria-labelledby="headingOne"
                         data-parent="#accordion">
                        <div class="card-body p-0">
                            <c:set var="cid" value="${requestScope.cid}"/>
                            <form action="list" method="post">
                                <div class="filter_type px-4 pt-4">
                                    <h5 class="fw-700 mb-4">Danh mục</h5>

                                    <ul class="ul" style="list-style: none;">
                                        <li class="mt-3">
                                            <div class="text-15px fw-700 d-flex">
                                                <input type="radio" id="category_all" name="id_category"
                                                       class="categories custom-radio" value="0" onclick="filter(this)"
                                                >
                                                <label for="category_all">Tất cả danh mục</label>
                                                <div class="ms-auto">(<%= totalCount %>)</div>
                                            </div>
                                        </li>
                                        <%int index = 1;%>
                                        <c:forEach items="${sessionScope.categories}" var="c">
                                            <li class="ms-3">
                                                <div class="d-flex">
                                                    <input type="radio" name="id_category" id="sub_category-${c.id}" class="categories custom-radio" value="${c.id}" ${cid==c.id ? 'checked' : ''} onclick="filter(this)">
                                                    <label for="sub_category-${c.id}">Kì ${c.id}</label>
                                                    <div  class="ms-auto">(<%= i.countCoursesByCategory(index++)%>)</div>
                                                </div>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-9">
                <div class="row category-filter-box mx-0 box-shadow-4">
                    <div class="col-md-6">
                        <span class="text-12px fw-700 text-muted">Đang hiển thị 6 Of 12 Kết quả</span>
                    </div>
                </div>
                <!-- CHANGED: Added id to course list container -->
                <div class="category-course-list">
                    <ul id="course-list" style="list-style: none;">
                        <c:forEach items="${courses}" var="course">
                            <li>
                                <div class="course-box-2">
                                    <div class="course-image">
                                        <a href="course-detail?id=${course.id}">
                                            <img src="${course.img}" alt="" class="img-fluid">
                                        </a>
                                    </div>
                                    <div class="course-details">
                                        <a href="course-detail?id=${course.id}" class="course-title">${course.name}</a>

                                        <div class="course-subtitle d-none d-md-block">
                                            <!-- Course subtitle content -->
                                        </div>

                                        <div class="course-meta">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <span><i class="fas fa-play-circle"></i> ${course.totalLesson}</span>
                                                    <span><i class="far fa-clock"></i> ${course.timeCourse} Giờ</span>
                                                    <span><i class="fas fa-closed-captioning"></i> Tiếng Anh</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="course-price-rating">
                                        <div class="course-price">
                                            <span class="current-price">${course.price}</span>
                                        </div>

                                        <span style="cursor: pointer; padding: 10px"
                                              class="badge badge-primary gio-hang">
                                          Thêm vào giỏ hàng
                                        </span>
                                    </div>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                <!-- CHANGED: Added pagination container -->
                <div id="pagination-container" class="text-center mt-4"></div>
            </div>
        </ul>
    </ul>
</section>

<jsp:include page="./components/footer.jsp"/>
<script src="js/script.js"></script>

<script>
    function filter(radio) {
        radio.form.submit();
    }

    function checkCategoryAll() {
        <c:if test="${empty cid}">
        document.getElementById('category_all').checked = true;
        </c:if>
    }

    window.onload = checkCategoryAll;
</script>
<script>
    function filterCategory(categoryId) {
        document.getElementById('footer-category-id').value = categoryId;
        document.getElementById('footer-filter-form').submit();
    }
</script>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const courseList = document.getElementById('course-list');
        const paginationContainer = document.getElementById('pagination-container');
        const coursesPerPage = 5;
        let currentPage = 1;

        // Lấy tất cả các khóa học
        const courses = Array.from(courseList.getElementsByTagName('li'));
        const totalCourses = courses.length;
        const totalPages = Math.ceil(totalCourses / coursesPerPage);

        function showPage(page) {
            const startIndex = (page - 1) * coursesPerPage;
            const endIndex = startIndex + coursesPerPage;

            courses.forEach((course, index) => {
                if (index >= startIndex && index < endIndex) {
                    course.style.display = '';
                } else {
                    course.style.display = 'none';
                }
            });
        }

        function setupPagination() {
            paginationContainer.innerHTML = '';
            for (let i = 1; i <= totalPages; i++) {
                const button = document.createElement('button');
                button.innerText = i;
                button.classList.add('btn', 'btn-outline-primary', 'mx-1');
                if (i === currentPage) {
                    button.classList.add('active');
                }
                button.addEventListener('click', function() {
                    currentPage = i;
                    showPage(currentPage);
                    const currentButton = paginationContainer.querySelector('.active');
                    if (currentButton) {
                        currentButton.classList.remove('active');
                    }
                    this.classList.add('active');
                });
                paginationContainer.appendChild(button);
            }
        }

        showPage(currentPage);
        setupPagination();
    });
</script>

</body>

</html>