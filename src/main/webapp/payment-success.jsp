
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Successful</title>
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/custom.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/homepage_after.css">
</head>
<body>
<main class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8 text-center">
            <div class="alert alert-success">
                <h1 class="display-4">Payment Successful</h1>
                <p class="lead">Your payment has been processed successfully. Thank you for your purchase!</p>
                <a href="home" class="btn btn-primary btn-lg">Return to Home</a>
            </div>
        </div>
    </div>
</main>
<script src="js/script.js"></script>
</body>
</html>
