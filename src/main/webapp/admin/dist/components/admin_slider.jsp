<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-2">
    <nav id="sidebar" class="sidebar" style="background-color: #ed711cde">
        <div class="text-center mb-3">
            <h4 class="text-white">FunnyCode</h4>
        </div>
        <div class="text-center mb-3">
            <img src="../icon/Logo.png" alt="Group Logo" class="img-fluid rounded-circle"
                 style="width: 200px; height: auto;">

            <a href="/admin/list-user"></a>

        </div>
        <ul class="nav flex-column">
<%--            <li class="nav-item">--%>
<%--                <a class="nav-link" href="#"><i class="fas fa-search"></i> Search</a>--%>
<%--            </li>--%>
            <li class="nav-item">
                <a class="nav-link" href="list-user"><i class="fas fa-users"></i> User
                    Management</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="manage-course"><i class="fas fa-book"></i>
                    Course Management</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="listmessage"><i class="fas fa-envelope"></i> Community</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="listpost"> <i class="fas fa-thumbtack"></i> Post</a>
            </li>
        </ul>
    </nav>
</div>

