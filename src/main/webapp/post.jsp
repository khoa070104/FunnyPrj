<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Post List</title>

    <style>
        /* Style for modal overlay */
        .modal-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            display: none;
            justify-content: center;
            align-items: center;
            z-index: 1000;
        }

        /* Style for modal content */
        .modal-content {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            max-width: 600px;
            width: 100%;
            max-height: 80%;
            overflow: auto;
        }
    </style>
</head>
<body>
<h2>Post List</h2>
<!-- Button to show create post modal -->
<div>
    <button type="button" class="btn btn-primary" onclick="showCreatePostModal()">
        Create Post
    </button>
</div>
<table border="1">
    <thead>
    <tr>
        <th>ID</th>
        <th>Title</th>
        <th>Content</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="post" items="${posts}">
        <tr onclick="viewComments(${post.id}, '${post.title}', '${post.content}')" style="cursor: pointer;">
            <td>${post.id}</td>
            <td>
                <form action="listcomment" method="get">
                    <button type="submit" name="id" value="${post.id}">${post.title}</button>
                </form>
            </td>
            <td>${post.content}</td>
            <td>
                <c:if test="${sessionScope.user.id == post.idUser}">
                    <!-- Button to trigger edit modal -->
                    <button type="button" class="btn btn-sm btn-outline-primary" onclick="editPostModal('${post.id}', '${post.title}', '${post.content}')">Edit</button>

                    <!-- Form for deleting post -->
                    <form action="deletePost" method="post" style="display: inline;">
                        <input type="hidden" name="id" value="${post.id}">
                        <button type="submit" onclick="return confirm('Are you sure you want to delete this post?')">Delete</button>
                    </form>
                </c:if>
            </td>
        </tr>
    </c:forEach>


    <%--    <c:forEach var="post" items="${posts}">--%>
<%--        <tr onclick="viewComments(${post.id})" style="cursor: pointer;">--%>
<%--            <td>${post.id}</td>--%>
<%--            <td>${post.title}</td>--%>
<%--            <td>${post.content}</td>--%>
<%--            <td>--%>
<%--                <c:if test ="${sessionScope.user.id == post.idUser}">--%>
<%--                    <!-- Button to trigger edit modal -->--%>
<%--                    <button type="button" class="btn btn-sm btn-outline-primary" onclick="event.stopPropagation(); editPostModal('${post.id}', '${post.title}', '${post.content}')">Edit</button>--%>

<%--                    <!-- Form for deleting post -->--%>
<%--                    <form action="deletePost" method="post" style="display: inline;" onsubmit="event.stopPropagation();">--%>
<%--                        <input type="hidden" name="id" value="${post.id}">--%>
<%--                        <button type="submit">Delete</button>--%>
<%--                    </form>--%>
<%--                </c:if>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--    </c:forEach>--%>
    </tbody>
</table>

<!-- Modal for creating post -->
<div class="modal-overlay" id="createPostModal">
    <div class="modal-content">
        <span class="close" onclick="hideCreatePostModal()">&times;</span>
        <h2>Create New Post</h2>
        <form id="createPostForm" action="CreatePost" method="post">
            <!-- Hidden input to store idUser -->
            <input type="hidden" id="idUser" name="idUser" value="${user.id}">

            <label for="title">Title:</label><br>
            <input type="text" id="title" name="title" required><br><br>

            <label for="content">Content:</label><br>
            <textarea id="content" name="content" rows="4" cols="50" required></textarea><br><br>

            <button type="submit">Create Post</button>
        </form>
    </div>
</div>

<!-- Modal for editing post -->
<div class="modal-overlay" id="editPostModal">
    <div class="modal-content">
        <span class="close" onclick="hideEditPostModal()">&times;</span>
        <h2>Edit Post</h2>
        <form id="editPostForm" action="EditPost" method="post">
            <!-- Hidden input to store idUser -->
            <input type="hidden" id="editIdUser" name="idUser" value="${user.id}">

            <input type="hidden" id="editPostId" name="id" value="${post.id}"><br><br>

            <label for="editTitle">Title:</label><br>
            <input type="text" id="editTitle" name="title" value="${post.title}" required><br><br>

            <label for="editContent">Content:</label><br>
            <textarea id="editContent" name="content" rows="4" cols="50" required>${post.content}</textarea><br><br>

            <button type="submit">Edit Post</button>
        </form>
    </div>
</div>

<script>
    // Function to show create post modal
    function showCreatePostModal() {
        document.getElementById('createPostModal').style.display = 'flex';
    }

    // Function to hide create post modal
    function hideCreatePostModal() {
        document.getElementById('createPostModal').style.display = 'none';
    }

    // Function to show edit post modal
    function editPostModal(id, title, content) {
        document.getElementById('editPostId').value = id;
        document.getElementById('editTitle').value = title;
        document.getElementById('editContent').value = content;
        document.getElementById('editPostModal').style.display = 'flex';
    }

    // Function to hide edit post modal
    function hideEditPostModal() {
        document.getElementById('editPostModal').style.display = 'none';
    }
</script>

<%--<script>--%>
<%--    function viewComments(postId) {--%>
<%--        window.location.href = 'listcomment?id=' + postId;--%>
<%--    }--%>
<%--</script>--%>



</body>
</html>
