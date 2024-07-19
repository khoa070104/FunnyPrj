<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Comment Management</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="../css/admin.css">
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <!-- Include the sidebar -->
        <jsp:include page="../components/admin_slider.jsp"/>
        <!-- Main Content -->
        <main class="content">
            <!-- Include the header -->
            <jsp:include page="../components/admin_header.jsp" />

            <div class="container mt-5">
                <h2>Comments for Post</h2>

                <!-- Hiển thị thông tin bài đăng -->
                <div class="card mb-4">
                    <div class="card-body">
                        <h5 class="card-title">Post Details</h5>
                        <p><strong>ID:</strong> ${sessionScope.post.id}</p>
                        <p><strong>Title:</strong> ${sessionScope.post.title}</p>
                        <p><strong>Content:</strong> ${sessionScope.post.content}</p>
                    </div>
                </div>

                <!-- Form thêm comment mới -->
                <div class="card mb-4">
                    <div class="card-body">
                        <h5 class="card-title">Add New Comment</h5>
                        <form action="listcomment" method="post">
                            <input type="hidden" name="idUser" value="${sessionScope.user.id}">
                            <input type="hidden" name="idPost" value="${sessionScope.post.id}">
                            <div class="form-group">
                                <label for="message">Message</label>
                                <textarea class="form-control" id="message" name="message" rows="3" required></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary">Add Comment</button>
                        </form>

                    </div>
                </div>

                <!-- Hiển thị danh sách comments -->
                <div class="list-group mb-4">
                    <c:forEach var="comment" items="${sessionScope.comments}">
                        <div class="list-group-item">
                            <p><strong>User ID:</strong> ${comment.idUser}</p>
                            <p><strong>Message:</strong> ${comment.message}</p>
                            <p><strong>Created Date:</strong> ${comment.createdDate}</p>
                                <form action="deleteComment" method="post" class="d-inline">
                                    <input type="hidden" name="commentId" value="${comment.id}">
                                    <input type="hidden" name="postId" value="${comment.idPost}">
                                    <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                                </form>
                                <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#editCommentModal${comment.id}">Edit</button>

                            <!-- Modal chỉnh sửa comment -->
                            <div class="modal fade" id="editCommentModal${comment.id}" tabindex="-1" role="dialog" aria-labelledby="editCommentModalLabel${comment.id}" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="editCommentModalLabel${comment.id}">Edit Comment</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <form id="editCommentForm${comment.id}" action="updateComment" method="post">
                                                <input type="hidden" name="postId" value="${post.id}">
                                                <input type="hidden" name="commentId" value="${comment.id}">
                                                <div class="form-group">
                                                    <label for="message${comment.id}">Message</label>
                                                    <textarea class="form-control" id="message${comment.id}" name="message" rows="3">${comment.message}</textarea>
                                                </div>
                                                <button type="submit" class="btn btn-primary">Save changes</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </main>
    </div>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- Custom JS -->
<script src="../js/admin.js"></script>
<script>
    $(document).ready(function() {
        // Xử lý sự kiện khi modal được đóng
        $('.modal').on('hidden.bs.modal', function (e) {
            $(this).find('form')[0].reset(); // Đặt lại form khi modal được đóng
        });
    });
</script>
</body>
</html>
