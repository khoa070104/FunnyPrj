<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="User profile page with contact information, profile details, and footer links.">
    <title>Hồ Sơ Người Dùng</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/profile.css">
    <style>
        .default_input {
            background-color: white !important;
        }
        .hidden {
            display: none;
        }
    </style>
</head>


<body class="white-bg">
<jsp:include page="./components/header.jsp"/>
<section class="user-dashboard-area pt-3">
    <div class="container">
        <div class="row">
            <div class="col-md-4 profile-image">
                <form id="photo-form" enctype="multipart/form-data" action="update-avatar" method="post">
                    <img src="${sessionScope.user.avatar}" alt="Ảnh đại diện" id="profile-img" style="width: 200px; height: 200px;">
                    <input type="file" id="photo-input" class="hidden" name="photo" onchange="previewPhoto()">
                    <button type="button" id="edit-photo-btn" class="btn btn-secondary" onclick="enablePhotoInput()">Edit</button>
                    <button type="submit" id="save-photo-btn" class="btn btn-primary hidden" >Save</button>
                </form>
            </div>
            <div class="col-md-7 profile-info">
                <form id="profile-form" action="update-profile" method="POST">
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" class="form-control" id="username" name="username" value="${sessionScope.user.username}" readonly/>
                    </div>
                    <div class="form-group">
                        <label for="role">Role</label>
                        <input type="text" class="form-control" id="role" name="role" value="${sessionScope.user.role==1?'Admin':'User'}" readonly/>
                    </div>
                    <div class="form-group">
                        <label for="fullname">Full Name</label>
                        <input type="text" class="form-control" id="fullname" name="fullname" value="${sessionScope.user.fullName}" readonly/>
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="text" class="form-control" id="email" name="email" value="${sessionScope.user.email}" readonly/>
                    </div>
                    <div class="form-group">
                        <label for="phone">Phone</label>
                        <input type="text" class="form-control" id="phone" name="phone" value="${sessionScope.user.phone}" readonly/>
                    </div>
                    <!-- Hidden input to store userid -->
                    <input type="hidden" class="form-control" id="userid" name="userid" value="${param.userid}" />
                    <button type="button" id="edit-info-btn"
                            class="btn btn-primary"

                            onclick="enableEdit(this)">Edit</button>
                    <a href="profile" id="cancel-btn" class="btn btn-secondary" hidden>Cancel</a>
                </form>
            </div>
        </div>
    </div>
</section>

<c:if test="${not empty posts}">
<section class="user-posts-area pt-3">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h3>Your Posts</h3>
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Title</th>
                        <th>Content</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="post" items="${posts}">
                        <c:if test="${sessionScope.user.id == post.idUser}">
                            <tr onclick="viewComments(${post.id}, '${post.title}', '${post.content}')" style="cursor: pointer;">
                                <td>${post.id}</td>
                                <td>
                                    <form action="listcomment" method="get">
                                        <button type="submit" name="id" value="${post.id}">${post.title}</button>
                                    </form>
                                </td>
                                <td>${post.content}</td>
                            </tr>
                        </c:if>
                    </c:forEach>
                    </tbody>
                </table>

            </div>
        </div>
    </div>
</section>
</c:if>


</body>
<jsp:include page="./components/footer.jsp"/>
<script src="./js/script.js"></script>
<script>
    function enablePhotoInput() {
        const photoInput = document.getElementById('photo-input');
        const savePhotoBtn = document.getElementById('save-photo-btn');
        const editPhotoBtn = document.getElementById('edit-photo-btn');

        photoInput.disabled = false;
        photoInput.click();
        savePhotoBtn.classList.remove('hidden');
        editPhotoBtn.classList.add('hidden');
    }

    function previewPhoto() {
        const fileInput = document.getElementById('photo-input');
        const file = fileInput.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function (e) {
                const profileImg = document.getElementById('profile-img');
                profileImg.src = e.target.result;
            };
            reader.readAsDataURL(file);
        }
    }

    function enableEdit(button) {
        const inputs = document.querySelectorAll("#profile-form .form-control");
        const cancelButton = document.getElementById('cancel-btn');

        if (button.id === "edit-info-btn") {
            button.id = "save-info-btn";
            button.textContent = "Save";
            inputs.forEach(input => {
                if (input.id !== "username" && input.id !== "role" && input.id !== "email") {
                    input.readOnly = false;
                    input.classList.add("default_input");
                }
            });
            cancelButton.hidden = false;
        } else {
            document.getElementById("profile-form").submit();
            button.id = "edit-info-btn";
            button.textContent = "Edit";
            inputs.forEach(input => {
                if (input.id !== "username" && input.id !== "role" && input.id !== "email") {
                    input.readOnly = true;
                    input.classList.remove("default_input");
                }
            });
            cancelButton.hidden = true;
        }
    }

    document.addEventListener("DOMContentLoaded", function() {
        const savePhotoBtn = document.getElementById('save-photo-btn');
        savePhotoBtn.classList.add('hidden');
    });

</script>
</html>
