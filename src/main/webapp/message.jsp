<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Chat Room</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        #chatMessages {
            position: sticky;
            bottom: 0;
            padding-top: 10px; /* Để tránh bị che phủ bởi thanh cuộn */
        }
    </style>
    <style>
        /* Style for centering and styling the chat room container */
        .chat-container {
            max-width: 40%; /* Container now takes up 40% of the screen width */
            margin: 0 auto; /* Center horizontally */
            padding: 15px; /* Reduced padding around the container */
            background-color: #f8f9fa; /* Light background color */
            border-radius: 8px; /* Rounded corners */
        }

        /* Style for list group items */
        .list-group-item {
            background-color: #fff; /* White background for messages */
            color: #333; /* Dark text color */
            border: 1px solid #dee2e6; /* Border color */
            border-radius: 5px; /* Rounded corners for messages */
        }

        /* Style for card */
        .card {
            border: 1px solid #dee2e6; /* Border color */
            border-radius: 8px; /* Rounded corners */
        }

        /* Adjust button size */
        .send {
            font-size: 0.875rem; /* Smaller font size for buttons */
        }
        .send {
            background-color: var(--primary-color); /* Set background color */
            border-color: var(--primary-color); /* Set border color to match background */
            color: #fff; /* Set text color to white */
            font-weight: bold;
        }

        .send:hover {
            background-color: #3a8ba8; /* Darker shade for hover effect */
            border-color: #3a8ba8; /* Match border color with hover background */
        }
    </style>
</head>
<body>
<jsp:include page="./components/header.jsp"/>
<div class="container chat-container mt-5">
    <h2 class="text-center mb-4">Chat Room</h2>

    <!-- Hiển thị tin nhắn -->
    <div class="list-group mb-4" id="chatMessagesWrapper"
         style="max-height: 200px; overflow-y: auto; position: relative;">
        <div id="chatMessages" data-autoscroll="1">
            <c:forEach var="message" items="${messages}">
                <div class="list-group-item mb-3 p-3 rounded shadow-sm">
                    <p><strong>User ID:</strong> ${message.idUser}</p>
                    <p><strong>Message:</strong> ${message.content}</p>
                    <p><strong>Created Date:</strong> ${message.createdDate}</p>
                    <c:if test="${sessionScope.user.id == message.idUser}">
                        <form action="deleteMessage" method="post" class="d-inline">
                            <input type="hidden" name="messageId" value="${message.id}">
                            <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                        </form>
                    </c:if>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- Form gửi tin nhắn mới -->
    <div class="card mb-4 shadow-sm">
        <div class="card-body">
            <form action="createMessage" method="post">
                <input type="hidden" name="idUser" value="${sessionScope.user.id}">
                <div class="form-group">
                    <label for="content">Message</label>
                    <textarea class="form-control" id="content" name="content" rows="3" required></textarea>
                </div>
                <button type="submit" class="send">Send</button>
            </form>
        </div>
    </div>
</div>
</div>
<script src="js/script.js"></script>
<jsp:include page="./components/footer.jsp"/>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
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
