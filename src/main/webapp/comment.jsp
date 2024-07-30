<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Comments for Post</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="./components/header.jsp"/>
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

    <!-- Nút hiển thị form thêm comment mới -->
    <button class="btn btn-primary mb-4" id="showCommentFormBtn">Add New Comment</button>

    <!-- Form thêm comment mới (ẩn theo mặc định) -->
    <div class="card mb-4" id="commentForm" style="display: none;">
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
                <c:if test="${sessionScope.user.id == comment.idUser}">
                    <form action="deleteComment" method="post" class="d-inline">
                        <input type="hidden" name="commentId" value="${comment.id}">
                        <input type="hidden" name="postId" value="${comment.idPost}">
                        <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                    </form>
                    <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#editCommentModal${comment.id}">Edit</button>
                </c:if>

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
                                    <input type="hidden" name="postId" value="${sessionScope.post.id}">
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
<jsp:include page="./components/footer.jsp"/>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script>
    $(document).ready(function() {
        // Xử lý sự kiện khi modal được đóng
        $('.modal').on('hidden.bs.modal', function (e) {
            $(this).find('form')[0].reset(); // Đặt lại form khi modal được đóng
        });

        // Hiển thị form thêm comment khi nút được nhấn
        $('#showCommentFormBtn').click(function() {
            $('#commentForm').toggle();
            $('#showCommentFormBtn').hide();
        });
    });
</script>
</body>
</html>
