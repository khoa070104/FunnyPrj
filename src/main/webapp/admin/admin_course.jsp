<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page import="service.IItemService" %>
<%@ page import="service.Impl.ItemServiceImpl" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<%
  IItemService i = new ItemServiceImpl();
  int totalCount = i.countTotalCourses();
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>User and Course Management</title>
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <!-- Font Awesome for icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  <!-- Custom CSS -->

  <link rel="stylesheet" href="../css/admin.css">
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/dist/css/main.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/coursedetail.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/dist/css/custom.css">

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
<div class="container-fluid">
  <div class="row">
    <!-- Include the sidebar -->
    <jsp:include page="dist/components/admin_slider.jsp"/>
    <!-- Main Content -->
    <main class="content">
      <!-- Include the header -->
      <jsp:include page="dist/components/admin_header.jsp" />

      <section class="category-course-list-area">
        <ul class="container-lg">
          <ul class="row">

            <div class="col-lg-9">

              <form id="searchForm" action="search-course" method="post" class="mb-4">
                <h2>Search Course by Name</h2>
                <div class="form-group">
                  <input type="text" id="courseName" name="courseName" class="form-control" required>
                </div>
                <button type="submit" class="btn btn-primary">Search</button>
              </form>


              <div class="category-course-list">
                <button type="button" class="createbutton" onclick="showCreateCourseModal()">
                  <div>Create</div>
                  <i class="fa fa-plus-circle" aria-hidden="true"></i>
                </button>
                <ul style="list-style: none;">

                  <c:forEach items="${courses}" var="course">
                    <li>
                      <div class="course-box-2">
                        <div class="course-image">
                          <a href="edit-detail-course?id=${course.id}">
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

                              </div>
                            </div>


                          </div>
                        </div>
                        <div class="course-price-rating">
                          <div class="course-price">
                            <span class="current-price">${course.price}</span>
                            <div>
                              <button type="button" class="btn btn-primary" onclick="editCourseModal(${course.id}, '${course.name}', ${course.price}, '${course.description}', ${course.typeCourse}, '${course.idLessonTime}', '${course.idCategory}');">
                                Edit
                              </button>
                              <button class="delete" onclick="remove(${course.id});">Delete</button>
                            </div>
                          </div>

                        </div>
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
    </main>
  </div>
</div>

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
        <form action="create-course" method="post" enctype="multipart/form-data">
          <div class="form-group">
            <label for="name">Name</label>
            <input class="form-control" id="name" name="name" required>
          </div>

          <div class="form-group">
            <label for="price">Price</label>
            <input type="text" class="form-control" id="price" name="price" required>
          </div>

          <div class="form-group">
            <label for="description">Description</label>
            <input class="form-control" id="description" name="description" required>
          </div>

          <div class="form-group">
            <label for="typeCourse">Type Course</label>
            <select class="form-control" id="typeCourse" name="typeCourse" required>
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

          <button type="submit" class="btn btn-primary" style="background-color: #00a7c1">Create Course</button>
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
        <form action="edit-course" method="post" enctype="multipart/form-data">
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


<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- Custom JS -->
<script src="../js/admin.js"></script>

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
      window.location = "delete-course?id=" + id;

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
<script>
  // Xử lý khi submit form
  document.getElementById('searchForm').onsubmit = function() {
    var emailInput = document.getElementById('courseName');
    emailInput.value = encodeURIComponent(emailInput.value.trim());
  };
</script>
</body>
</html>
