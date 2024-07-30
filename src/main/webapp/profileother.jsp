
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
    </style>
</head>


<body class="white-bg">
<jsp:include page="./components/header.jsp"/>
<section class="user-dashboard-area pt-3">
    <div class="container">
        <div class="row">
            <div class="col-md-4 profile-image">
                <img src="${profileUser.avatar}" alt="Ảnh đại diện" id="profile-img" style="width: 200px; height: 200px;">
            </div>
            <div class="col-md-7 profile-info">
                <form id="profile-form" action="update-profile" method="POST">
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" class="form-control" id="username" name="username" value="${profileUser.username}" readonly/>
                    </div>
                    <div class="form-group">
                        <label for="role">Role</label>
                        <input type="text" class="form-control" id="role" name="role" value="${profileUser.role == 1 ? 'Admin' : 'User'}" readonly/>
                    </div>
                    <div class="form-group">
                        <label for="fullname">Full Name</label>
                        <input type="text" class="form-control" id="fullname" name="fullname" value="${profileUser.fullName}" readonly/>
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="text" class="form-control" id="email" name="email" value="${profileUser.email}" readonly/>
                    </div>
                    <div class="form-group">
                        <label for="phone">Phone</label>
                        <input type="text" class="form-control" id="phone" name="phone" value="${profileUser.phone}" readonly/>
                    </div>
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
                        <c:forEach var="post" items="${sessionScope.posts}">
                            <tr onclick="viewComments(${post.id}, '${post.title}', '${post.content}')" style="cursor: pointer;">
                                <td>${post.id}</td>
                                <td>
                                    <form action="listcomment" method="get">
                                        <button type="submit" name="id" value="${post.id}">${post.title}</button>
                                    </form>
                                </td>
                                <td>${post.content}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>
    </section>
</c:if>

<jsp:include page="./components/footer.jsp"/>
<script src="js/script.js"></script>

<script>
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
</script>
</body>

</html>
