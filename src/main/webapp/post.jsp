<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Post List</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
            width: 80%; /* Adjusted to 80% width */
            max-width: 800px; /* Set max-width if needed */
            max-height: 80%;
            overflow: auto;
        }

        /* Centering the table */
        .table-container {
            max-width: 80%; /* Adjusted to 80% width */
            margin: 0 auto;
        }

        /* Custom styles for table */
        .table-custom {
            color: #000; /* Set text color to black */
            background-color: #fff; /* Set background color to white */
        }
    </style>
</head>
<body>
<div class="container">
    <h2 class="my-4">Post List</h2>
    <!-- Button to show create post modal -->
    <div class="mb-3">
        <button type="button" class="btn btn-primary" onclick="showCreatePostModal()">
            Create Post
        </button>
    </div>
    <!-- Table Container -->
    <div class="table-container">
        <table class="table table-bordered table-custom">
            <thead class="thead-custom">
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
                        <form action="listcomment" method="get" style="margin: 0;">
                            <button type="submit" name="id" value="${post.id}" class="btn btn-link">${post.title}</button>
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
                                <button type="submit" class="btn btn-sm btn-outline-danger" onclick="return confirm('Are you sure you want to delete this post?')">Delete</button>
                            </form>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Modal for creating post -->
    <div class="modal-overlay" id="createPostModal">
        <div class="modal-content">
            <span class="close" onclick="hideCreatePostModal()" style="cursor: pointer; float: right;">&times;</span>
            <h2>Create New Post</h2>
            <form id="createPostForm" action="CreatePost" method="post">
                <!-- Hidden input to store idUser -->
                <input type="hidden" id="idUser" name="idUser" value="${sessionScope.user.id}">

                <div class="form-group">
                    <label for="title">Title:</label>
                    <input type="text" id="title" name="title" class="form-control" required>
                </div>

                <div class="form-group">
                    <label for="content">Content:</label>
                    <textarea id="content" name="content" class="form-control" rows="4" required></textarea>
                </div>

                <button type="submit" class="btn btn-primary">Create Post</button>
            </form>
        </div>
    </div>

    <!-- Modal for editing post -->
    <div class="modal-overlay" id="editPostModal">
        <div class="modal-content">
            <span class="close" onclick="hideEditPostModal()" style="cursor: pointer; float: right;">&times;</span>
            <h2>Edit Post</h2>
            <form id="editPostForm" action="EditPost" method="post">
                <!-- Hidden input to store idUser -->
                <input type="hidden" id="editIdUser" name="idUser" value="${sessionScope.user.id}">

                <input type="hidden" id="editPostId" name="id" value="${sessionScope.post.id}"><br><br>

                <div class="form-group">
                    <label for="editTitle">Title:</label>
                    <input type="text" id="editTitle" name="title" class="form-control" value="${sessionScope.post.title}" required>
                </div>

                <div class="form-group">
                    <label for="editContent">Content:</label>
                    <textarea id="editContent" name="content" class="form-control" rows="4" required>${sessionScope.post.content}</textarea>
                </div>

                <button type="submit" class="btn btn-primary">Edit Post</button>
            </form>
        </div>
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
</body>
</html>
