<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <jsp:include page="./components/header.jsp"/>
    <title>Community</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        /* General page styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
        }

        /* Style for the container */
        .container {
            margin-top: 20px;
        }

        /* Table styling */
        .table-container {
            max-width: 90%;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        /* Style for table header */
        .table thead th {
            background-color: #007bff;
            color: #fff;
        }

        /* Style for buttons */
        .btn-custom {
            margin-right: 5px;
        }

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
            border-radius: 10px;
            width: 90%;
            max-width: 800px;
            max-height: 80%;
            overflow: auto;
        }

        /* Comment styling */
        .comment-section {
            margin-top: 20px;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .comment {
            display: flex;
            align-items: center;
            border-bottom: 1px solid #ddd;
            padding: 10px 0;
        }

        .comment:last-child {
            border-bottom: none;
        }

        .comment-author {
            font-weight: bold;
            margin-right: 10px;
        }

        .comment-content {
            flex: 1;
        }

        .comment-actions {
            margin-left: auto;
        }

        /* Hide default browser outline on focus for buttons and inputs */
        button:focus, input:focus {
            outline: none;
        }
    </style>
</head>
<body>
<div class="container">
    <h2 class="my-4">Community</h2>

    <!-- Button to show create post modal -->
    <div class="mb-3">
        <button type="button" class="btn btn-primary" onclick="showCreatePostModal()">Create Post</button>
    </div>

    <!-- Table Container -->
    <div class="table-container">
        <table class="table table-bordered table-hover">
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
                <tr>
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
                            <button type="button" class="btn btn-sm btn-outline-primary btn-custom" onclick="showEditPostModal('${post.id}', '${post.title}', '${post.content}')">Edit</button>

                            <!-- Form for deleting post -->
                            <form action="deletePost" method="post" style="display: inline;">
                                <input type="hidden" name="id" value="${post.id}">
                                <button type="submit" class="btn btn-sm btn-outline-danger" onclick="return confirm('Are you sure you want to delete this post and all related comments?')">Delete</button>
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
            <form action="EditPost" method="post">
                <input type="hidden" name="idUser" value="${sessionScope.user.id}">
                <input type="hidden" id="editPostId" name="id" >
                <div class="form-group">
                    <label for="editTitle">Title:</label>
                    <input type="text" id="editTitle" name="title" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="editContent">Content:</label>
                    <textarea id="editContent" name="content" class="form-control" rows="4" required></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Save Changes</button>
            </form>
        </div>
    </div>

    <!-- Comment section -->
<%--    <div class="comment-section">--%>
<%--        <h3>Comments</h3>--%>
<%--        <c:forEach var="comment" items="${comments}">--%>
<%--            <div class="comment">--%>
<%--                <span class="comment-content">${comment.message}</span>--%>
<%--                <div class="comment-actions">--%>
<%--                    <c:if test="${sessionScope.user.id == comment.idUser}">--%>
<%--                        <button type="button" class="btn btn-sm btn-outline-primary btn-custom" onclick="showEditCommentModal('${comment.id}', '${comment.message}')">Edit</button>--%>
<%--                        <form action="deleteComment" method="post" style="display: inline;">--%>
<%--                            <input type="hidden" name="commentId" value="${comment.id}">--%>
<%--                            <input type="hidden" name="postId" value="${comment.idPost}">--%>
<%--                            <button type="submit" class="btn btn-sm btn-outline-danger" onclick="return confirm('Are you sure you want to delete this comment?')">Delete</button>--%>
<%--                        </form>--%>
<%--                    </c:if>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </c:forEach>--%>
<%--    </div>--%>
</div>
<script src="js/hompage.js"></script>
<script>
    function showCreatePostModal() {
        document.getElementById('createPostModal').style.display = 'flex';
    }

    function hideCreatePostModal() {
        document.getElementById('createPostModal').style.display = 'none';
    }

    function showEditPostModal(id, title, content) {
        document.getElementById('editPostId').value = id;
        document.getElementById('editTitle').value = title;
        document.getElementById('editContent').value = content;
        document.getElementById('editPostModal').style.display = 'flex';
    }

    function hideEditPostModal() {
        document.getElementById('editPostModal').style.display = 'none';
    }

    function showEditCommentModal(commentId, commentMessage) {
        // Implement this function if you have an edit comment modal
    }

    function hideEditCommentModal() {
        // Implement this function if you have an edit comment modal
    }
</script>
<jsp:include page="./components/footer.jsp"/>
</body>
</html>
