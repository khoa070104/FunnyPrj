<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search User</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h2>Search User by Email</h2>
    <form id="searchForm" action="searchUser" method="post">
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="text" id="email" name="email" class="form-control" required>
        </div>
        <input type="submit" value="Search">
    </form>

    <c:if test="${not empty userList}">
        <h3>User Details</h3>
        <table class="table table-striped">
            <thead>
            <tr>
                <th>ID</th>
                <th>Username</th>
                <th>Email</th>
                <th>Full Name</th>
                <th>Avatar</th>
                <th>Phone</th>
                <th>Role</th>
                <th>Status</th>
                <th>Code</th>
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
                    <td>${user.avatar}</td>
                    <td>${user.phone}</td>
                    <td>${user.role}</td>
                    <td>${user.status}</td>
                    <td>${user.code}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>
    <c:if test="${not empty error}">
        <p class="text-danger">${error}</p>
    </c:if>
</div>

<script>
    // Xử lý khi submit form
    document.getElementById('searchForm').onsubmit = function() {
        var emailInput = document.getElementById('email');
        emailInput.value = encodeURIComponent(emailInput.value.trim());
    };
</script>

</body>
</html>
