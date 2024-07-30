<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Community Management</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="../css/admin.css">
    <style>
        .content {
            display: block;
            justify-content: center;
            align-items: center;
            height: 80vh;
        }
        .container {
            width: 50%; /* Chiếm 50% chiều rộng của màn hình */
        }
        #chatMessagesWrapper {
            max-height: 500px; /* Tăng chiều cao khung chat */
            overflow-y: auto;
            position: relative;
        }
        .list-group-item{
            font-size: 0.6rem; /* Giảm kích thước font của tin nhắn */
            padding: 0px; /* Giảm padding của tin nhắn */
            cursor: pointer; /* Thêm con trỏ để cho biết có thể nhấp vào */
        }
        .d-inline{
            font-size: 0.6rem; /* Giảm kích thước font của tin nhắn */
            padding: 0px; /* Giảm padding của tin nhắn */
            cursor: pointer;
        }
        .card {
            width: 100%; /* Chiếm toàn bộ chiều rộng khung chat */
        }
        .modal-body textarea {
            font-size: 0.6rem; /* Giảm kích thước font trong modal chỉnh sửa tin nhắn */
        }
        label {
            font-weight: 700;
        }
    </style>
</head>
<body>
<div class="container-fluid">
        <!-- Include the sidebar -->
        <jsp:include page="dist/components/admin_slider.jsp"/>
        <!-- Main Content -->
        <main class="content">
            <!-- Include the header -->
            <jsp:include page="dist/components/admin_header.jsp" />
            <div class="container mt-5">
                <h2 style="text-align: center">Chat Room</h2>

                <!-- Hiển thị tin nhắn -->
                <div class="list-group mb-4" id="chatMessagesWrapper">
                <div id="chatMessages" class="card" data-autoscroll="1">
                    <c:forEach var="message" items="${messages}">
                        <div class="card-body" style="border-bottom: solid 1px #a6a6a6">
                            <p><strong>User ID:</strong> ${message.idUser}</p>
                            <p><strong>Message:</strong> ${message.content}</p>
                            <p><strong>Created Date:</strong> ${message.createdDate}</p>
                            <form action="deleteMessage" method="post" class="d-inline">
                                <input type="hidden" name="messageId" value="${message.id}">
                                <button type="submit" class="float-right btn btn-danger btn-sm">Delete</button>
                            </form>
                        </div>
                    </c:forEach>
                </div>
            </div>

                <!-- Form gửi tin nhắn mới -->
                <div class="card mb-4">
                    <div class="card-body">
                        <form action="createMessage" method="post">
                            <input type="text" class="form-control" name="idUser" placeholder="UseID" value="${sessionScope.user.id}">
                            <div class="form-group">
                                <label for="content">Message</label>
                                <textarea class="form-control" id="content" name="content" placeholder="Message..." rows="3" required></textarea>
                            </div>
                            <%--            <button type="submit" class="btn btn-primary">Send Message</button>--%>
                            <input type="submit" class="float-right btn btn-info btn-sm" value="SEND">
                        </form>
                    </div>
                </div>
            </div>

        </main>
    </div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- Custom JS -->
<script src="dist/js/admin.js"></script>
<script>
    // Sử dụng AJAX để gửi và nhận tin nhắn mà không làm tải lại trang
    $(document).ready(function () {
        // Hàm gửi tin nhắn
        $('#sendMessageForm').submit(function (event) {
            event.preventDefault(); // Ngăn chặn form gửi đi mặc định
            var form = $(this);
            $.ajax({
                type: form.attr('method'),
                url: form.attr('action'),
                data: form.serialize(),
                success: function (response) {
                    $('#content').val(''); // Xóa nội dung tin nhắn sau khi gửi thành công
                    fetchMessages(); // Lấy lại danh sách tin nhắn mới nhất
                },
                error: function (xhr, status, error) {
                    console.error('Error sending message:', error);
                }
            });
        });

        // Hàm lấy tin nhắn mới nhất và hiển thị lên giao diện
        function fetchMessages() {
            $.ajax({
                type: 'GET',
                url: '${pageContext.request.contextPath}/listmessage', // URL servlet hoặc controller để lấy tin nhắn
                success: function (messages) {
                    var chatMessages = $('#chatMessages');
                    chatMessages.empty(); // Xóa tin nhắn cũ để hiển thị tin nhắn mới nhất
                    messages.forEach(function (message) {
                        chatMessages.append('<div class="list-group-item">');
                        chatMessages.append('<p><strong>User ID:</strong> ' + message.idUser + '</p>');
                        chatMessages.append('<p><strong>Message:</strong> ' + message.content + '</p>');
                        chatMessages.append('<p><strong>Created Date:</strong> ' + message.createdDate + '</p>');
                        if (${sessionScope.user.id == message.idUser}) {
                            chatMessages.append('<form action="${pageContext.request.contextPath}/deleteMessage" method="post" class="d-inline">');
                            chatMessages.append('<input type="hidden" name="messageId" value="' + message.id + '">');
                            chatMessages.append('<button type="submit" class="btn btn-danger btn-sm">Delete</button>');
                            chatMessages.append('</form>');
                            chatMessages.append('<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#editMessageModal' + message.id + '">Edit</button>');
                        }
                        chatMessages.append('<div class="modal fade" id="editMessageModal' + message.id + '" tabindex="-1" role="dialog" aria-labelledby="editMessageModalLabel' + message.id + '" aria-hidden="true">');
                        chatMessages.append('<div class="modal-dialog" role="document">');
                        chatMessages.append('<div class="modal-content">');
                        chatMessages.append('<div class="modal-header">');
                        chatMessages.append('<h5 class="modal-title" id="editMessageModalLabel' + message.id + '">Edit Message</h5>');
                        chatMessages.append('<button type="button" class="close" data-dismiss="modal" aria-label="Close">');
                        chatMessages.append('<span aria-hidden="true">&times;</span>');
                        chatMessages.append('</button>');
                        chatMessages.append('</div>');
                        chatMessages.append('<div class="modal-body">');
                        chatMessages.append('<form id="editMessageForm' + message.id + '" action="${pageContext.request.contextPath}/updateMessage" method="post">');
                        chatMessages.append('<input type="hidden" name="messageId" value="' + message.id + '">');
                        chatMessages.append('<div class="form-group">');
                        chatMessages.append('<label for="content' + message.id + '">Message</label>');
                        chatMessages.append('<textarea class="form-control" id="content' + message.id + '" name="content" rows="3">' + message.content + '</textarea>');
                        chatMessages.append('</div>');
                        chatMessages.append('<button type="submit" class="btn btn-primary">Save changes</button>');
                        chatMessages.append('</form>');
                        chatMessages.append('</div>');
                        chatMessages.append('</div>');
                        chatMessages.append('</div>');
                        chatMessages.append('</div>');
                        chatMessages.append('<hr>');
                    });
                },
                error: function (xhr, status, error) {
                    console.error('Error fetching messages:', error);
                }
            });
        }

        // Tự động cập nhật tin nhắn mỗi 5 giây
        setInterval(fetchMessages, 5000);

        // Gọi hàm lấy tin nhắn để hiển thị khi trang được tải lần đầu
        fetchMessages();
    });
</script>
</body>
</html>
