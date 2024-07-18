<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="header">
    <div class="left">
        <button class="btn btn-link" onclick="showList()">
            <i class="fas fa-list"></i> List
        </button>
        <button class="btn btn-link" onclick="showSearchBar()">
            <i class="fas fa-search"></i> Search
        </button>
        <button class="btn btn-link" onclick="showMessageCenter()">
            <i class="fas fa-envelope"></i> Messages
        </button>
        <button class="btn btn-link" onclick="showNotification()">
            <i class="fas fa-bell"></i> Notifications
        </button>
    </div>
    <div class="right">
        <button class="btn btn-link" onclick="logout()">
            Logout <i class="fas fa-sign-out-alt"></i>
        </button>
    </div>
</div>
