<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import="service.IItemService" %>
<%@ page import="service.Impl.ItemServiceImpl" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<%
    IItemService i = new ItemServiceImpl();
    int totalCount = i.countTotalCourses();
%>
<%--cái này để hiển thị lỗi khi ngta nhập vào chỗ price không phải số nguyên --%>
<% String error = (String) request.getAttribute("error");
    if (error != null && !error.isEmpty()) { %>
<div class="alert alert-danger" role="alert">
    <%= error %>
</div>
<% } %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Course</title>

    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/dist/css/edit.css">

    <!-- Thêm thư viện jQuery và jQuery UI -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>

    <!-- jQuery first, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


    <script type="text/javascript">
        function change(){
            document.getElementById(editpage).submit();
        }
    </script>
</head>
<body>
<div class="cover">
    <div class="header_info">
        <div class="phone_header">
            <div class="phone_header-logo">
                <img src="${pageContext.request.contextPath}/admin/dist/icon/phone.svg" alt="">
            </div>
            <div class="phone_header-info">
                <p>03333333333</p>
            </div>
            <div class="mail_header">
                <div class="mail_header-logo">
                    <img src="${pageContext.request.contextPath}/admin/dist/icon/mail.png" alt="">
                </div>
                <div class="mail_header-info">
                    <a href="mamgh789@gmail.com">mamgh789@gmail.com</a>
                </div>
            </div>
        </div>
        <div class="language_header">
            <select name="" id="language_option">
                <option value="VIE">Vietnamese</option>
                <option value="ENG">English</option>
            </select>
        </div>
    </div>


    <div class="header_bar">
        <div class="header_barlogosearch">
            <div class="header_bar-logo">
                <img src="${pageContext.request.contextPath}/admin/dist/icon/Logo.png" alt="">
            </div>
            <div class="header_bar-danhMuc" id="danhMuc">
                <div class="header_bar-danhMuc-icon">
                    <img src="${pageContext.request.contextPath}/admin/dist/icon/list-solid.svg" alt="">
                </div>
                <i class="header_bar-danhMuc-info">
                    Danh Mục
                </i>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownCourses">
                    <a href="mycourses.html" class="dropdown-item" href="#">
                        <i class="fas fa-book mr-2"></i> Khóa học
                    </a>
                    <a href="cart.html" class="dropdown-item" href="#">
                        <i class="fas fa-store mr-2"></i> Cửa hàng
                    </a>
                </div>
            </div>

            <div class="header_bar-search">
                <div class="header_bar-search-info">
                    <input type="text" placeholder="Tìm kiếm">
                    <div class="header_bar-search-icon">
                        <img src="${pageContext.request.contextPath}/admin/dist/icon/search.svg" alt="">
                    </div>
                </div>

            </div>
        </div>


        <div class="header_bar-cart">
            <!-- Giảng viên Link -->
            <a href="lecturer.html" class="header-icon">
                <div class="header_bar-cart-icon ">
                    <p class="icon-text">Mentor</p>
                </div>
            </a>

            <!-- Khóa học của tôi Link -->
            <a href="mycourses.html">
                <div class="header_bar-cart-icon no-icon">
                    <p class="icon-text">Khóa học của tôi</p>
                </div>
            </a>

            <!-- Giỏ hàng Link -->
            <a href="cart.html">
                <div class="header_bar-cart-icon">
                    <img src="${pageContext.request.contextPath}/admin/dist/icon/cart.svg" alt="Giỏ hàng">
                </div>
            </a>

            <!-- Hồ sơ Link -->
            <div class="header_bar-cart header_bar-cart-user">
                <a class="profile-link">
                    <div class="header_bar-cart-icon">
                        <img src="${pageContext.request.contextPath}/admin/dist/icon/user.png" alt="Hồ sơ" style="border-radius: 50%; height: 65%;">
                    </div>
                </a>
                <div class="profile-dropdown">
                    <!-- Nội dung menu dropdown -->
                    <a href="#" class="list-group-item list-group-item-action">
                        <i class="fas fa-user mr-2"></i> Tên người dùng: ${sessionScope.user.username}
                    </a>
                    <a href="#" class="list-group-item list-group-item-action">
                        <i class="fas fa-envelope mr-2"></i> Email: ${sessionScope.user.email}
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="#" class="list-group-item list-group-item-action">
                        <i class="fas fa-book mr-2"></i> Khóa học của tôi
                    </a>
                    <a href="#" class="list-group-item list-group-item-action">
                        <i class="fas fa-id-card mr-2"></i> Hồ sơ người dùng
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="logout" class="list-group-item list-group-item-action">
                        <i class="fas fa-sign-out-alt mr-2"></i> Đăng xuất
                    </a>
                </div>
            </div>


        </div>
    </div>
</div>

<section class="category-header-area"
         style="background-image: url('${pageContext.request.contextPath}/admin/dist/icon/course_page_banner.png'); background-size: cover; background-position: right;">
    <div class="image-placeholder-3"></div>
    <div class="container-lg breadcrumb-container row align-items-center">
        <nav class="col-auto" aria-label="breadcrumb">
            <ol class="breadcrumb" style="background-color: #6245E1 ">
                <li class="breadcrumb-item display-6 fw-bold">
                    <a href="../allcourse.html" style="font-size: 40px; font-weight: 500; color:white">
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
                <img src="${pageContext.request.contextPath}/admin/dist/icon/brd-book.png" style="width: 200px; height: 200px;">
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
                            <form action="editpage" method="post">
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
                                                    <input type="radio" name="id_category" class="categories custom-radio" value="${c.id}" ${cid==c.id ? 'checked' : ''} onclick="filter(this)">
                                                    <label for="sub_category-${c.id}">Kì ${c.id}</label>
                                                    <div  class="ms-auto">(<%= i.countCoursesByCategory(index++)%>)</div>
                                                </div>
                                            </li>
                                        </c:forEach>

                                        <!-- Other categories here -->
                                    </ul>

                                    <a href="javascript:;" class="text-13px fw-500" id="city-toggle-btn"
                                       onclick="showToggle(this, 'hidden-categories')">Cho xem nhiều hơn</a>
                                </div>


                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-9">
                <div class="row category-filter-box mx-0 box-shadow-4">
                    <div class="col-md-6">
                        <!--<button class="btn py-1 px-2 mx-2 btn-light" onclick="toggleLayout('grid')"><i class="fas fa-th-large"></i></button>-->
                        <!--<button class="btn py-1 px-2 mx-2 btn-light" onclick="toggleLayout('list')"><i class="fas fa-list"></i></button>-->
                        <span class="text-12px fw-700 text-muted">Đang hiển thị 6 Of 12 Kết quả</span>
                    </div>
                    <div class="col-md-6 text-end filter-sort-by">
                        <span>Sắp xếp theo : </span>
                        <div class="dropdown d-inline-block">

                            <!-- hidden field of sorting value -->
                            <input id="sortByValue" type="hidden" name="sort_by" value="newest">

                            <button class="btn bg-background dropdown-toggle fw-bold text-capitalize" type="button"
                                    id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                                Mới nhất
                            </button>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuButton1"
                                style="list-style: none;">
                                <li><a onclick="courseSorting('newest')"
                                       class="dropdown-item text-12px fw-600 text-capitalize"
                                       href="javascript:;">Mới nhất</a></li>
                                <li><a onclick="courseSorting('highest-rating')"
                                       class="dropdown-item text-12px fw-600 text-capitalize"
                                       href="javascript:;">Đánh giá cao nhất</a></li>
                                <li><a onclick="courseSorting('discounted')"
                                       class="dropdown-item text-12px fw-600 text-capitalize"
                                       href="javascript:;">Discounted</a></li>
                                <li><a onclick="courseSorting('lowest-price')"
                                       class="dropdown-item text-12px fw-600 text-capitalize"
                                       href="javascript:;">Giá thấp nhất</a></li>
                                <li><a onclick="courseSorting('highest-price')"
                                       class="dropdown-item text-12px fw-600 text-capitalize"
                                       href="javascript:;">Giá cao nhất</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="category-course-list">
                    <div>
                        <button type="button" class="btn btn-primary" onclick="showCreateCourseModal()">
                            Create
                        </button>

                    </div>

                    <ul style="list-style: none;">

                        <c:forEach items="${courses}" var="course">
                            <li>
                                <div class="course-box-2">
                                    <div class="course-image">
                                        <a href="FilterCourseDetail?id=${course.id}">
                                            <img src="${course.img}" alt="" class="img-fluid">
                                        </a>
                                    </div>
                                    <div class="course-details">
                                        <a href="#" class="course-title">${course.name}</a>

                                        <div class="course-subtitle d-none d-md-block">
                                            <!-- Course subtitle content -->
                                        </div>

                                        <div class="course-meta">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <span><i class="fas fa-play-circle"></i> ${course.totalLesson}</span>
                                                    <span><i class="far fa-clock"></i> ${course.timeCourse} Giờ</span>
                                                    <span><i class="fas fa-closed-captioning"></i> Tiếng Anh</span>
                                                    <hr class="bg-white my-1">
                                                    <span class="badge badge-primary"><i class="fa fa-level-up"></i> Người mới bắt đầu</span>
                                                    <button class="btn-compare-sm" onclick="event.stopPropagation(); $(location).attr('href', '#');">
                                                        <i class="fas fa-retweet"></i> Compare
                                                    </button>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="floating-user d-inline-block">
                                                        <img src="https://4user.net/uploads/user_image/optimized/6981af2b9220e61af0f42817a2574122.jpg"
                                                             width="30px" data-bs-toggle="tooltip"
                                                             data-bs-placement="top" title=""
                                                             onclick="event.stopPropagation(); $(location).attr('href', '#');"
                                                             data-bs-original-title="4 User" aria-label="4 User">
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="course-price-rating">
                                        <div class="course-price">
                                            <span class="current-price">${course.price}</span>
                                        </div>
                                        <div class="rating">
                                            <i class="fas fa-star filled"></i>
                                            <i class="fas fa-star filled"></i>
                                            <i class="fas fa-star filled"></i>
                                            <i class="fas fa-star filled"></i>
                                            <i class="fas fa-star filled"></i>
                                            <span class="d-inline-block average-rating">5</span>
                                        </div>
                                        <div class="rating-number">
                                            1 Xếp hạng
                                        </div>
                                    </div>
                                </div>
                                <div>

                                    <button type="button" class="btn btn-primary" onclick="editCourseModal(${course.id}, '${course.name}', ${course.price}, '${course.description}', ${course.typeCourse}, '${course.idLessonTime}', '${course.idCategory}');">
                                        Edit
                                    </button>


                                    <button onclick="remove(${course.id});">Delete</button>

                                </div>
                            </li>

                        </c:forEach>
                    </ul>

                </div>
                <nav>
                    <ul class="pagination justify-content-center">
                        <li class="page-item active disabled"><span class="page-link">1</span></li>
                        <li class="page-item"><a href="#"
                                                 data-ci-pagination-page="2">2</a></li>
                        <li class="page-item"><a href="#" data-ci-pagination-page="2"
                                                 rel="next"><i class="fas fa-chevron-right"></i></a></li>
                    </ul>
                </nav>
            </div>
        </ul>
    </ul>
</section>

<div class="footer_content">
    <div class="footer-lienket">
        <div class="footer-lienket-title">
            <h3>Study and topic, any thing with </h3>
        </div>
        <div class="footer-lienket-info">
            <ul>
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
            <form id="footer-filter-form" action="Filter" method="post">
                <input type="hidden" id="footer-category-id" name="id_category" value="${cid}" />
                <ul class="footer-list-info-ul two-columns">
                    <c:forEach items="${sessionScope.categories}" var="c">
                        <li>
                            <a href="javascript:;" class="btn-link" onclick="filterCategory(${c.id})">Kì ${c.id}</a>
                        </li>
                    </c:forEach>
                </ul>
            </form>
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
<footer class="footer">
    <div class="footer-logo">
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

<!-- Modal -->
<div class="modal fade" id="createCourseModal" tabindex="-1" role="dialog" aria-labelledby="createCourseModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="createCourseModalLabel">Create New Course</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="CreateCourse" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input class="form-control" id="name" name="name" rows="3" required></input>
                    </div>

                    <div class="form-group">
                        <label for="price">Price</label>
                        <input type="number" class="form-control" id="price" name="price" rows="3" required>
                    </div>


                    <div class="form-group">
                        <label for="description">Description</label>
                        <input class="form-control" id="description" name="description" rows="5" required></input>
                    </div>
                    <div class="form-group">
                        <label for="typeCourse">Type Course</label>
                        <select class="form-control" id="typeCourse" name="typeCourse" required>
<%--                             thể loại kiểu boolean--%>
                            <option value="1">Zoom</option>
                            <option value="0">Record</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="idLessonTime">Lesson Time</label>
                        <input type="text" class="form-control" id="idLessonTime" name="idLessonTime" value="${course.idLessonTime}" required>
                    </div>

                    <div class="form-group">
                        <label for="idCategory">Kỳ Học</label>
                        <select class="form-control" id="idCategory" name="idCategory" required>
                            <c:forEach items="${sessionScope.categories}" var="category">
                                <option value="${category.id}">${category.name}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="img-input">Upload Image</label>
                        <input type="file" id="img-input" name="img" class="form-control-file" accept="image/*" onchange="previewImage()">
                    </div>

                    <img id="img-preview" src="#" alt="Image preview" style="display: none; max-width: 200px; max-height: 200px;" />


                    <button type="submit" class="btn btn-primary">Create Course</button>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Edit Course Modal -->
<div class="modal fade" id="editCourseModal" tabindex="-1" role="dialog" aria-labelledby="editCourseModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editCourseModalLabel">Edit Course</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="EditCourseInfo" method="post" enctype="multipart/form-data">
                    <!-- Hidden field for Course ID -->
                    <input type="hidden" id="editCourseId" name="id" value="${course.id}">

                    <div class="form-group">
                        <label for="editName">Name</label>
                        <input type="text" class="form-control" id="editName" name="name" value="${course.name}" required>
                    </div>
                    <div class="form-group">
                        <label for="editPrice">Price</label>
                        <input type="number" class="form-control" id="editPrice" name="price" value="${course.price}" required>
                    </div>

                    <div class="form-group">
                        <label for="editDescription">Description</label>
                        <input type="text" class="form-control" id="editDescription" name="description" value="${course.description}" required>
                    </div>
                    <div class="form-group">
                        <label for="editTypeCourse">Type Course</label>
                        <select class="form-control" id="editTypeCourse" name="typeCourse" required>
                            <option value="true" ${course.typeCourse ? 'selected' : ''}>Zoom</option>
                            <option value="false" ${!course.typeCourse ? 'selected' : ''}>Record</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="editIdLessonTime">Lesson Time</label>
                        <input type="text" class="form-control" id="editIdLessonTime" name="idLessonTime" value="${course.idLessonTime}" required>
                    </div>


                    <div class="form-group">
                        <label for="editIdCategory">Category</label>
                        <select class="form-control" id="editIdCategory" name="idCategory" required>
                            <c:forEach items="${sessionScope.categories}" var="category">
                                <option value="${category.id}" ${category.id == course.idCategory ? 'selected' : ''}>${category.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="editImgInput">Current Image</label>
                        <img src="${course.img}" alt="Current Image" id="course-img" style="width: 200px; height: 200px;">
                    </div>

                    <div class="form-group">
                        <label for="editImgInput">Upload New Image</label>
                        <input type="file" id="editImgInput" name="img" class="form-control-file" accept="image/*" onchange="previewImageEdit()">
                    </div>

                    <img id="editImgPreview" src="#" alt="Image preview" style="display: none; max-width: 200px; max-height: 200px;" />

                    <button type="submit" class="btn btn-primary">Save Changes</button>
                </form>
            </div>
        </div>
    </div>
</div>




<script src="../js/hompage.js"></script>

<script>
    function filter(radio) {
        // Trigger form submission on radio button change
        radio.form.submit();
    }
</script>
<script>
    function filterCategory(categoryId) {
        document.getElementById('footer-category-id').value = categoryId;
        document.getElementById('footer-filter-form').submit();
    }
</script>
<script>
    function remove(id){
        if(confirm("Are you sure delete this Course?")){
            window.location = "DeleteCourse?id=" + id;

        }
    }
</script>
<script>
    // Function to show the create course modal
    function showCreateCourseModal() {
        $('#createCourseModal').modal('show');  // Show the modal using jQuery
    }
</script>
<script>
    function editCourseModal(courseId, courseName, coursePrice, courseDescription, courseType, lessonTimeId, categoryId) {
        // Populate modal fields with course data
        document.getElementById('editCourseId').value = courseId;
        document.getElementById('editName').value = courseName;
        document.getElementById('editPrice').value = coursePrice;
        document.getElementById('editDescription').value = courseDescription;
        document.getElementById('editTypeCourse').value = courseType;
        document.getElementById('editIdLessonTime').value = lessonTimeId;
        document.getElementById('editIdCategory').value = categoryId;

        // Show the modal
        $('#editCourseModal').modal('show');
    }
</script>

<script>
    function previewImage() {
        const fileInput = document.getElementById('img-input');
        const file = fileInput.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function (e) {
                const imgPreview = document.getElementById('img-preview');
                imgPreview.src = e.target.result;
                imgPreview.style.display = 'block';
            };
            reader.readAsDataURL(file);
        }
    }
</script>

<script>
    function previewImageEdit() {
        const fileInput = document.getElementById('editImgInput');
        const file = fileInput.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function (e) {
                const imgPreview = document.getElementById('editImgPreview');
                imgPreview.src = e.target.result;
                imgPreview.style.display = 'block';
            };
            reader.readAsDataURL(file);
        }
    }
</script>

</body>

</html>
