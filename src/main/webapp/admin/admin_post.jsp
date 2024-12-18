<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Post Management</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="../css/admin.css">
    <link rel="stylesheet" href="../css/adminuser.css">
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
<div class="container-fluid">
    <div class="row">
        <!-- Include the sidebar -->
        <jsp:include page="dist/components/admin_slider.jsp"/>
        <!-- Main Content -->
        <main class="content">
            <!-- Include the header -->
            <jsp:include page="dist/components/admin_header.jsp" />

            <div class="container" style="max-width: 80%; margin: 0 auto;">
                <h2>Post List</h2>
                <!-- Button to show create post modal -->
                <div>
                    <button type="button" class="btn btn-primary" onclick="showCreatePostModal()">
                        Create Post
                    </button>
                </div>

                <table class="table table-bordered table-hover" style="background-color: white; color: black;">
                    <thead class="thead-light">
                    <tr>
                        <th>ID</th>
                        <th>Title</th>
                        <th>Content</th>
                        <th style="width: 150px;">Actions</th> <!-- Set fixed width for Actions column -->
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="post" items="${posts}">
                        <tr onclick="viewComments(${post.id}, '${post.title}', '${post.content}')" style="cursor: pointer;">
                            <td>${post.id}</td>
                            <td>
                                <form action="listcomment" method="get">
                                    <button type="submit" name="id" value="${post.id}" class="btn btn-link" style="color: black;">${post.title}</button>
                                </form>
                            </td>
                            <td>${post.content}</td>
                            <td>
                                <!-- Button to trigger edit modal -->
                                <button type="button" class="btn btn-sm btn-outline-primary" onclick="editPostModal('${post.id}', '${post.title}', '${post.content}')">
                                    <i class="fas fa-edit"></i> Edit
                                </button>

                                <!-- Form for deleting post -->
                                <form action="deletePost" method="post" style="display: inline;">
                                    <input type="hidden" name="id" value="${post.id}">
                                    <button type="submit" class="btn btn-sm btn-outline-danger" onclick="return confirm('Are you sure you want to delete this post?')">
                                        <i class="fas fa-trash-alt"></i> Delete
                                    </button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <!-- Modal for creating post -->
            <div class="modal-overlay" id="createPostModal">
                <div class="modal-content">
                    <span class="close" onclick="hideCreatePostModal()">&times;</span>
                    <h2>Create New Post</h2>
                    <form id="createPostForm" action="CreatePost" method="post">
                        <!-- Hidden input to store idUser -->
                        <input type="hidden" id="idUser" name="idUser" value="${sessionScope.user.id}">

                        <label for="title">Title:</label><br>
                        <input type="text" id="title" name="title" required><br><br>

                        <label for="content">Content:</label><br>
                        <textarea id="content" name="content" rows="4" cols="50" required></textarea><br><br>

                        <button type="submit">Create Post</button>
                    </form>

                </div>
            </div>
        </main>
    </div>
</div>
<!-- Modal for creating post -->
<div class="modal-overlay" id="createPostModal">
    <div class="modal-content">
        <div class="section-title">
            <span class="close" style="color: white" onclick="hideCreatePostModal()">&times;</span>
            <h3>Create New Post</h3>
        </div>
        <form id="createPostForm" action="CreatePost" method="post" style="padding: 0 1.5rem">
            <!-- Hidden input to store idUser -->
            <input type="hidden" id="idUser" class="form-control" name="idUser" value="${sessionScope.user.id}">

            <label for="title">Title:</label><br>
            <input type="text" id="title" class="form-control" name="title" placeholder="Title" required><br>

            <label for="content">Content:</label><br>
            <textarea id="content" name="content" rows="4" cols="50" placeholder="Content..." required></textarea><br>
            <div class="card-footer">
                <button type="submit" style="position: relative;left: 80%;"
                        class="btn btn-primary btn-sm">Create Post</button>
            </div>
        </form>

    </div>
</div>

<!-- Modal for editing post -->
<div class="modal-overlay" id="editPostModal">
    <div class="modal-content">
        <div class="section-title">
            <span class="close" style="color: white" onclick="hideEditPostModal()">&times;</span>
            <h2>Edit Post</h2>
        </div>
        <form id="editPostForm" action="EditPost" method="post">
            <!-- Hidden input to store idUser -->
            <input type="hidden" id="editIdUser" class="form-control" name="idUser" value="${sessionScope.user.id}">

            <input type="hidden" id="editPostId" class="form-control" name="id" value="${sessionScope.post.id}"><br>

            <label for="editTitle">Title:</label><br>
            <input type="text" id="editTitle" class="form-control" name="title" value="${sessionScope.post.title}" required><br>

            <label for="editContent">Content:</label><br>
            <textarea id="editContent" name="content" rows="4" cols="50" required>${sessionScope.post.content}</textarea><br>
            <div class="card-footer">
                <button type="submit" style="position: relative;left: 80%;"
                        class="btn btn-primary btn-sm">Edit Post</button>
            </div>
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


<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- Custom JS -->
<script src="../js/admin.js"></script>
</body>
</html>