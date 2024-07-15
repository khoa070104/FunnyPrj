<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>--%>
<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <title>Comments for Post</title>--%>
<%--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">--%>
<%--</head>--%>
<%--<body>--%>
<%--<div class="container mt-5">--%>
<%--    <!-- Hiển thị thông tin bài post -->--%>
<%--    <div class="card mb-3">--%>
<%--        <div class="card-body">--%>
<%--            <h5 class="card-title">Post Details</h5>--%>
<%--            <p><strong>User ID:</strong> ${post.idUser}</p>--%>
<%--            <p><strong>Title:</strong> ${post.title}</p>--%>
<%--            <p><strong>Content:</strong> ${post.content}</p>--%>
<%--        </div>--%>
<%--    </div>--%>

<%--    <h2>Comments for Post</h2>--%>
<%--    <!-- Form thêm comment mới -->--%>
<%--    <div class="card">--%>
<%--        <div class="card-body">--%>
<%--            <h5 class="card-title">Add New Comment</h5>--%>
<%--            <form action="addComment" method="post">--%>
<%--                <div class="form-group">--%>
<%--                    <label for="message">Message</label>--%>
<%--                    <textarea class="form-control" id="message" name="message" rows="3" required></textarea>--%>
<%--                </div>--%>
<%--                <input type="hidden" name="idUser" value="${user.id}"> <!-- Giả sử bạn có đối tượng user trong session -->--%>
<%--                <input type="hidden" name="idPost" value="1"> <!-- Giả sử bạn có đối tượng post trong request -->--%>
<%--                <button type="submit" class="btn btn-primary">Add Comment</button>--%>
<%--            </form>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    <!-- Hiển thị danh sách comments -->--%>
<%--    <div class="list-group mb-4">--%>
<%--        <c:forEach var="comment" items="${sessionScope.comments}">--%>
<%--            <div class="list-group-item">--%>
<%--                <p><strong>User ID:</strong> ${comment.idUser}</p>--%>
<%--                <p><strong>Message:</strong> ${comment.message}</p>--%>
<%--                <p><strong>Created Date:</strong> ${comment.createdDate}</p>--%>
<%--                <c:if test ="${sessionScope.user.id == comment.idUser}">--%>
<%--                    <form action="deleteComment" method="post" class="d-inline">--%>
<%--                        <input type="hidden" name="commentId" value="${comment.id}">--%>

<%--                        <button type="submit" class="btn btn-danger btn-sm">Delete</button>--%>
<%--                    </form>--%>


<%--                <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#editCommentModal${comment.id}">Edit</button>--%>
<%--                </c:if>--%>

<%--                <!-- Modal chỉnh sửa comment -->--%>
<%--                <div class="modal fade" id="editCommentModal${comment.id}" tabindex="-1" role="dialog" aria-labelledby="editCommentModalLabel${comment.id}" aria-hidden="true">--%>
<%--                    <div class="modal-dialog" role="document">--%>
<%--                        <div class="modal-content">--%>
<%--                            <div class="modal-header">--%>
<%--                                <h5 class="modal-title" id="editCommentModalLabel${comment.id}">Edit Comment</h5>--%>
<%--                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">--%>
<%--                                    <span aria-hidden="true">&times;</span>--%>
<%--                                </button>--%>
<%--                            </div>--%>
<%--                            <div class="modal-body">--%>
<%--                                <form id="editCommentForm${comment.id}" action="updateComment" method="post">--%>
<%--                                    <input type="hidden" name="commentId" value="${comment.id}">--%>
<%--                                    <div class="form-group">--%>
<%--                                        <label for="message${comment.id}">Message</label>--%>
<%--                                        <textarea class="form-control" id="message${comment.id}" name="message" rows="3">${comment.message}</textarea>--%>
<%--                                    </div>--%>
<%--                                    <button type="submit" class="btn btn-primary">Save changes</button>--%>
<%--                                </form>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--            </div>--%>
<%--        </c:forEach>--%>
<%--    </div>--%>


<%--</div>--%>

<%--<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>--%>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>--%>
<%--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>--%>
<%--<script>--%>
<%--    $(document).ready(function() {--%>
<%--        // Xử lý sự kiện khi modal được đóng--%>
<%--        $('.modal').on('hidden.bs.modal', function (e) {--%>
<%--            $(this).find('form')[0].reset(); // Đặt lại form khi modal được đóng--%>
<%--        });--%>
<%--    });--%>
<%--</script>--%>
<%--</body>--%>
<%--</html>--%>
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

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
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
