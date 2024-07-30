<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search User</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 30px;
        }
        .form-group label {
            font-weight: bold;
        }
        .table th, .table td {
            text-align: center;
        }
        .table th {
            background-color: #343a40;
            color: white;
        }
        .table td {
            vertical-align: middle;
        }
        .table a {
            color: #007bff;
            text-decoration: none;
        }
        .table a:hover {
            text-decoration: underline;
        }
        .text-danger {
            font-weight: bold;
        }
    </style>
</head>
<body>
<jsp:include page="./components/header.jsp"/>
<div class="container">
    <h2 class="mb-4">Search Friend</h2>
    <form id="searchForm" action="searchUser" method="post" class="mb-4">
        <div class="form-group">
            <label for="email">Email or User Name:</label>
            <input type="text" id="email" name="email" class="form-control" required>
        </div>
        <input type="submit" value="Search" class="btn btn-primary">
    </form>

    <c:if test="${not empty userList}">
        <h3 class="mb-4">User Details</h3>
        <table class="table table-striped">
            <thead>
            <tr>
                <th>ID</th>
                <th>Username</th>
                <th>Email</th>
                <th>Full Name</th>
                <th>Avatar</th>
                <th>Phone</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="user" items="${userList}">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.username}</td>
                    <td>
                        <c:choose>
                            <c:when test="${user.id == sessionScope.user.id}">
                                <form id="profileForm" action="profile" method="post" style="display:none;">
                                    <input type="hidden" name="userid" value="${sessionScope.user.id}" />
                                </form>
                                <a href="#" onclick="document.getElementById('profileForm').submit();">
                                    <i class="fas fa-user mr-2"></i> ${user.email}
                                </a>
                            </c:when>
                            <c:otherwise>
                                <form id="profileotherForm" action="profileother" method="get" style="display:none;">
                                    <input type="hidden" name="userid" value="${user.id}" />
                                </form>
                                <a href="#" onclick="document.getElementById('profileotherForm').submit();">
                                    <i class="fas fa-user mr-2"></i> ${user.email}
                                </a>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>${user.fullName}</td>
                    <td>
                        <c:if test="${not empty user.avatar}">
                            <img src="${user.avatar}" alt="Avatar" class="img-fluid rounded-circle" style="width: 50px; height: 50px;">
                        </c:if>
                        <c:if test="${empty user.avatar}">
                            <i class="fas fa-user-circle" style="font-size: 50px;"></i>
                        </c:if>
                    </td>
                    <td>${user.phone}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
    <c:if test="${not empty error}">
        <p class="text-danger">${error}</p>
    </c:if>
</div>
<jsp:include page="./components/footer.jsp"/>
<script>
    // Xử lý khi submit form
    document.getElementById('searchForm').onsubmit = function() {
        var emailInput = document.getElementById('email');
        emailInput.value = encodeURIComponent(emailInput.value.trim());
    };
</script>
</body>
</html>
