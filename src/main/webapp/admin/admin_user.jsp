<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
    <link rel="stylesheet" href="../css/adminuser.css">



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
<body>
<div class="container-fluid">
    <div class="row">
        <!-- Include the sidebar -->
        <jsp:include page="dist/components/admin_slider.jsp"/>
        <!-- Main Content -->
        <main class="content">
            <!-- Include the header -->
            <jsp:include page="dist/components/admin_header.jsp" />


            <div id="userManagement">
                <div class="section-title">User Management</div>
                <h2>Search User by Email or Name</h2>
                <form id="searchForm" action="search-user" method="post" class="mb-4">
                    <div class="form-group">
                        <input type="text" id="search" name="email" class="form-control" required>
                    </div>
                    <input type="submit" value="Search" class="btn btn-primary">

                </form>
                <div class="card-body table-responsive p-0" style="text-align: center; line-height: 1.5rem">
                    <table class="table table-head-fixed text-wrap table-sm table-striped">
                        <thead>
                        <tr>
                            <th>Id</th>
                            <th>Username</th>
                            <th>Email</th>
                            <th>Full Name</th>
                            <th>Phone</th>
                            <th>Role</th>
                            <th>Status</th>
                            <th>Avatar</th>
                            <th>Code</th>
                            <th style="width: 95px;">Actions</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach var="user" items="${userList}">
                            <tr class="info_user">
                                <td>${user.id}</td>
                                <td>${user.username}</td>
                                <td>${user.email}</td>
                                <td>${user.fullName}</td>
                                <td>${user.phone}</td>
                                <td>${user.role}</td>
                                <td>${user.status}</td>
                                <td style="max-width: 200px;
                                    word-wrap: break-word;
                                    white-space: normal;}">${user.avatar}</td>
                                <td>${user.code}</td>
                                <td>
                                    <button type="button" class="btn btn-info btn-sm" onclick="editUserModal('${user.id}', '${user.username}', '${user.email}', '${user.fullName}', '', '${user.avatar}', '${user.phone}', '${user.role}', '${user.status}', '${user.code}')"><i class="fas fa-edit"></i> Edit</button>
                                    <form action="delete-user" method="post" style="display: inline;">
                                        <input type="hidden" name="id" value="${user.id}">
                                        <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete?')"><i class="fas fa-trash-alt"></i> Delete</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </main>
    </div>
</div>
<%--create user--%>
<div class="modal-overlay" id="createUserModal">
    <div class="modal-content">
        <div class="section-title">
            <span class="close ml-auto" style="color: white" onclick="hideCreateUserModal()">&times;</span>
            <h3>Create New User</h3>
        </div>
        <form id="createUserForm" action="create-user" method="post" style="padding: 0 1.5rem">
            <label for="username">Username:</label><br>
            <input type="text" id="username" class="form-control" name="username" placeholder="Username" required><br>

            <label for="email">Email:</label><br>
            <input type="email" id="email" class="form-control"  name="email" placeholder="Email" required><br>

            <label for="fullName">Full Name:</label><br>
            <input type="text" id="fullName" class="form-control"  name="fullName" placeholder="Fullname" required><br>

            <label for="password">Password:</label><br>
            <input type="password" id="password" class="form-control"  name="password" placeholder="Password" required><br>

            <label for="avatar">Avatar:</label><br>
            <input type="text" id="avatar" class="form-control"  name="avatar" placeholder="Avatar"><br>

            <label for="phone">Phone:</label><br>
            <input type="number" id="phone" class="form-control"  name="phone" placeholder="Phone"><br>

            <label for="role">Role:</label><br>
            <input type="number" id="role" class="form-control"  name="role" placeholder="Role" required><br>

            <label for="status">Status:</label><br>
            <select id="status" name="status" required>
                <option value="1">Active</option>
                <option value="0">Inactive</option>
            </select><br><br>
            <label for="code">Code:</label><br>
            <input type="text" id="code" class="form-control"  name="code" placeholder="Code"><br>
            <div class="card-footer">
                <button type="submit" style="position: relative;left: 80%;"
                        class="btn btn-primary btn-sm">Create User</button>
            </div>
        </form>

    </div>
</div>
<%--edit user --%>
<div class="modal-overlay" id="editUserModal">
    <div class="modal-content">
        <div class="section-title">
            <span class="close" style="color: white" onclick="hideEditUserModal()">&times;</span>
            <h2>Edit User</h2>
        </div>
        <form id="editUserForm" action="edit-user" method="post">
            <input type="hidden" id="editUserId" class="form-control" name="id" value="${user.id}">

            <label for="editUsername">Username:</label><br>
            <input type="text" id="editUsername" class="form-control" name="username" placeholder=Username" value="${user.username}" required><br>

            <label for="editEmail">Email:</label><br>
            <input type="email" id="editEmail" class="form-control"  name="email" placeholder="Email" value="${user.email}" required><br>

            <label for="editFullName">Full Name:</label><br>
            <input type="text" id="editFullName" class="form-control"  name="fullName" placeholder="Fullname" value="${user.fullName}" required><br>

            <label for="editPassword">Password:</label><br>
            <input type="password" id="editPassword" class="form-control"  name="password" placeholder="Password" value="${user.password}" required><br>

            <label for="editAvatar">Avatar:</label><br>
            <input type="text" id="editAvatar" class="form-control"  name="avatar" placeholder="Avatar" value="${user.avatar}"><br>

            <label for="editPhone">Phone:</label><br>
            <input type="number" id="editPhone" class="form-control"  name="phone" placeholder="Phone" value="${user.phone}"><br>

            <label for="editRole">Role:</label><br>
            <input type="number" id="editRole" class="form-control"  name="role" placeholder="Role" value="${user.role}" required><br>

            <label for="editStatus">Status:</label><br>
            <select id="editStatus" name="status" required>
                <option value="1" ${user.status == 1 ? 'selected' : ''}>Active</option>
                <option value="0" ${user.status == 0 ? 'selected' : ''}>Inactive</option>
            </select><br><br>

            <label for="editCode">Code:</label><br>
            <input type="text" id="editCode" class="form-control"  name="code" placeholder="Code" value="${user.code}"><br>
            <div class="card-footer">
                <button type="submit" style="position: relative;left: 80%;"
                        class="btn btn-primary btn-sm">Edit User</button>
            </div>
        </form>
    </div>
</div>
<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
    function showCreateUserModal() {
        document.getElementById('createUserModal').style.display = 'flex'; // Hiển thị lớp bảng đè
    }

    function hideCreateUserModal() {
        document.getElementById('createUserModal').style.display = 'none'; // Ẩn lớp bảng đè
    }
</script>
<script>
    // Function to show the edit user modal
    function editUserModal(id, username, email, fullName, password, avatar, phone, role, status, code) {
        document.getElementById('editUserId').value = id;
        document.getElementById('editUsername').value = username;
        document.getElementById('editEmail').value = email;
        document.getElementById('editFullName').value = fullName;
        document.getElementById('editPassword').value = password;
        document.getElementById('editAvatar').value = avatar;
        document.getElementById('editPhone').value = phone;
        document.getElementById('editRole').value = role;
        document.getElementById('editStatus').value = status;
        document.getElementById('editCode').value = code;
        document.getElementById('editUserModal').style.display = 'flex';
    }

    // Function to hide the edit user modal
    function hideEditUserModal() {
        document.getElementById('editUserModal').style.display = 'none';
    }
</script>
<!-- Custom JS -->
<script src="../js/admin.js"></script>
<script>
    // Xử lý khi submit form
    document.getElementById('searchForm').onsubmit = function() {
        var emailInput = document.getElementById('search');
        emailInput.value = encodeURIComponent(emailInput.value.trim());
    };
</script>
</body>
</html>