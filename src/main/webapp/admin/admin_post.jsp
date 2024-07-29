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
    <link rel="stylesheet" href="../css/admin-user.css">
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
            <div id="userManagement" class="card">
                <div class="section-title card-header">
                    <h4 class="card-title">Post List</h4>
                </div>
                <form id="searchForm" action="search-user" method="post" class="row p-2">
                    <div class="col-8">
                        <button type="button" class="btn btn-primary btn-sm" onclick="showCreatePostModal()">
                            <i class="fa fa-plus" aria-hidden="true"></i>
                            Create Post
                        </button>

                    </div>
                    <div class="form-group row col-4 input-group-sm"
                         style="margin: 0">
                        <input type="text" id="search" name="email"
                               class="form-control col-9" placeholder="Search User By Name Post" required>
                        <input type="submit" value="Search" class="col-3">
                    </div>
                </form>
                <div class="card-body table-responsive p-0" style="text-align: center; line-height: 1.5rem">
                    <table class="table table-head-fixed text-wrap table-sm table-striped">
                        <thead>
                        <tr>
                            <th>Id</th>
                            <th>Title</th>
                            <th>Content</th>
                            <th style="width: 95px;">Actions</th>
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
                                    <!-- Button to trigger edit modal -->
                                    <button type="button" class="btn btn-sm btn-outline-primary" onclick="editPostModal('${post.id}', '${post.title}', '${post.content}')">Edit</button>

                                    <!-- Form for deleting post -->
                                    <form action="deletePost" method="post" style="display: inline;">
                                        <input type="hidden" name="id" value="${post.id}">
                                        <button type="submit" onclick="return confirm('Are you sure you want to delete this post?')">Delete</button>
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
            <!-- Modal for creating post -->
            <div class="modal-overlay" id="createPostModal">
                <div class="modal-content">
                    <div class="section-title">
                        <span class="close ml-auto" style="color: white" onclick="hideCreatePostModal()">&times;</span>
                        <h3>Create New Post</h3>
                    </div>
                    <form id="createPostForm" action="CreatePost" method="post" style="padding: 0 1.5rem">
                        <!-- Hidden input to store idUser -->
                        <input type="hidden" id="idUser" class="form-control" name="idUser" value="${sessionScope.user.id}">

                        <label for="title">Title:</label><br>
                        <input type="text" id="title" class="form-control" name="title" placeholder="Title" required><br>

                        <label for="content">Content:</label><br>
                        <textarea id="content" name="content" rows="4" cols="50" placeholder="Content..." required></textarea><br>

                    </form>
                    <div class="card-footer">
                        <button type="submit" style="position: relative;left: 80%;"
                                class="btn btn-primary btn-sm">Create Post</button>
                    </div>
                </div>
            </div>

            <!-- Modal for editing post -->
            <div class="modal-overlay" id="editPostModal">
                <div class="modal-content">
                    <span class="close" onclick="hideEditPostModal()">&times;</span>
                    <h2>Edit Post</h2>
                    <form id="editPostForm" action="EditPost" method="post">
                        <!-- Hidden input to store idUser -->
                        <input type="hidden" id="editIdUser" name="idUser" value="${sessionScope.user.id}">

                        <input type="hidden" id="editPostId" name="id" value="${sessionScope.post.id}"><br><br>

                        <label for="editTitle">Title:</label><br>
                        <input type="text" id="editTitle" name="title" value="${sessionScope.post.title}" required><br><br>

                        <label for="editContent">Content:</label><br>
                        <textarea id="editContent" name="content" rows="4" cols="50" required>${sessionScope.post.content}</textarea><br><br>

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
        </main>
    </div>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- Custom JS -->
<script src="../js/admin.js"></script>
</body>
</html>
