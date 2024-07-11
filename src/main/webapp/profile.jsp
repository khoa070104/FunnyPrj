
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="User profile page with contact information, profile details, and footer links.">
    <title>Hồ Sơ Người Dùng</title>
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/main.css">
    <link rel="stylesheet" href="css/homepage_after.css">
    <link rel="stylesheet" href="css/profile.css">
    <style>
        .default_input {
            background-color: white !important;
        }
    </style>
</head>


<body class="white-bg">
<div class="cover">
    <div class="header_info">
        <div class="phone_header">
            <div class="phone_header-logo">

                <img src="icon/phone.svg" alt="Phone icon">
            </div>
            <div class="phone_header-info">
                <p>0333333333</p>
            </div>
            <div class="mail_header">
                <div class="mail_header-logo">
                    <img src="icon/mail.png" alt="Mail icon">
                </div>
                <div class="mail_header-info">
                    <a href="mailto:mamgh789@gmail.com">mamgh789@gmail.com</a>

                </div>
            </div>
        </div>
        <div class="language_header">

            <label for="language_option" class="visually-hidden">Select Language</label>
            <select id="language_option">

                <option value="VIE">Vietnamese</option>
                <option value="ENG">English</option>
            </select>
        </div>
    </div>


    <div class="header_bar">
        <div class="header_barlogosearch">
            <div class="header_bar-logo">
                <img src="icon/Logo.png" alt="Website Logo">
            </div>
            <div class="header_bar-danhMuc" id="danhMuc">
                <div class="header_bar-danhMuc-icon">
                    <img src="icon/list-solid.svg" alt="Menu icon">
                </div>
                <i class="header_bar-danhMuc-info">
                    Danh Mục
                </i>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownCourses">
                    <a href="mycourses.html" class="dropdown-item">
                        <i class="fas fa-book mr-2"></i> Khóa học
                    </a>
                    <a href="cart.html" class="dropdown-item">
                        <i class="fas fa-store mr-2"></i> Cửa hàng
                    </a>
                </div>
            </div>

            <div class="header_bar-search">
                <div class="header_bar-search-info">
                    <input type="text" placeholder="Tìm kiếm" aria-label="Search">
                    <div class="header_bar-search-icon">
                        <img src="icon/search.svg" alt="Search icon">
                    </div>
                </div>
            </div>
        </div>

        <div class="header_bar-cart">
            <a href="lecturer.html" class="header-icon" aria-label="Giảng viên">
                <div class="header_bar-cart-icon">
                    <p class="icon-text">Mentor</p>
                </div>
            </a>

            <a href="mycourses.html" aria-label="Khóa học của tôi">
                <div class="header_bar-cart-icon no-icon">
                    <p class="icon-text">Khóa học của tôi</p>
                </div>
            </a>

            <a href="cart.html" aria-label="Giỏ hàng">
                <div class="header_bar-cart-icon">
                    <img src="icon/cart.svg" alt="Giỏ hàng">
                </div>
            </a>

            <div class="header_bar-cart header_bar-cart-user">
                <a href="#" class="profile-link" aria-label="Hồ sơ">
                    <div class="header_bar-cart-icon">
                        <img src="icon/user.png" alt="Hồ sơ" style="border-radius: 50%; height: 65%;">
                    </div>
                </a>
                <div class="profile-dropdown">
                    <a href="#" class="list-group-item list-group-item-action">
                        <i class="fas fa-user mr-2"></i> Tên người dùng: John Doe
                    </a>
                    <a href="#" class="list-group-item list-group-item-action">
                        <i class="fas fa-envelope mr-2"></i> Email: john.doe@example.com
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="allcourse.jsp" class="list-group-item list-group-item-action">
                        <i class="fas fa-book mr-2"></i> Giỏ hàng cùa tôi
                    </a>
                    <a href="user-profile.html" class="list-group-item list-group-item-action">
                        <i class="fas fa-id-card mr-2"></i> Hồ sơ người dùng
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="logout" class="list-group-item list-group-item-action">
                        <i class="fas fa-sign-out-alt mr-2"></i> Đăng xuất

                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

<section class="user-dashboard-area pt-3">
    <div class="container">
        <div class="row">
            <div class="col-md-4 profile-image">
                <form id="photo-form" enctype="multipart/form-data">
                    <img src="icon/anh.jpg" alt="Ảnh đại diện" id="profile-img" style="width: 200px; height: 200px;">
                    <input type="file" id="photo-input" class="hidden" onchange="previewPhoto()">
                    <button type="button" id="edit-photo-btn" class="btn btn-secondary" onclick="enablePhotoInput()">Edit</button>
                    <button type="button" id="save-photo-btn" class="btn btn-primary hidden" onclick="changePhoto()">Save</button>
                </form>
            </div>
            <div class="col-md-7 profile-info">
                <form id="profile-form" action="update-profile" method="POST">
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" class="form-control" id="username" name="username" value="${sessionScope.user.username}" readonly>
                    </div>
                    <div class="form-group">
                        <label for="role">Role</label>
                        <input type="text" class="form-control" id="role" name="role" value="${sessionScope.user.role==1?'Admin':'User'}" readonly>
                    </div>
                    <div class="form-group">
                        <label for="fullname">Full Name</label>
                        <input type="text" class="form-control" id="fullname" name="fullname" value="${sessionScope.user.fullName}" readonly/>
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" id="email" name="email" value="${sessionScope.user.email}" readonly>
                    </div>
                    <div class="form-group">
                        <label for="phone">Phone</label>
                        <input type="text" class="form-control" id="phone" name="phone" value="${sessionScope.user.phone}" readonly>
                    </div>
                    <button type="button" id="edit-info-btn" class="btn btn-secondary" onclick="enableEdit(this)">Edit</button>
                    <a href="profile" id="cancel-btn" class="btn btn-secondary" hidden>Cancel</a>
                </form>
            </div>
        </div>
    </div>
</section>

<div class="footer_content">
    <div class="footer-lienket">
        <div class="footer-lienket-title">
            <h3>Study and topic, any thing with </h3>
        </div>
        <div class="footer-lienket-info">

            <ul>
                <li><a href="facebook.com"><img src="icon/facebook.svg" alt=""></a></li>
                <li><a href="instagram.com"><img src="icon/instagram.svg" alt=""></a></li>
                <li><a href="twitter.com"><img src="icon/twitter.svg" alt=""></a></li>
                <li><a href="youtube.com"><img src="icon/youtube.svg" alt=""></a></li>
            </ul>
        </div>
    </div>
    <div class="footer-list">
        <div class="footer-list-title">
            <h3>Danh mục hàng đầu</h3>
        </div>
        <div class="footer-list-info">

            <ul>
                <li><a href="list.html?id=1">Kì 1</a></li>
                <li><a href="list.html?id=1">Kì 1</a></li>
                <li><a href="list.html?id=1">Kì 1</a></li>
                <li><a href="list.html?id=1">Kì 1</a></li>
                <li><a href="list.html?id=1">Bài tập</a></li>

            </ul>
        </div>
    </div>
    <div class="footer-favorite">
        <div class="footer-favorite-title">
            <h3>Liên kết hữu ích</h3>
        </div>
        <div class="footer-favorite-info">
            <ul>
                <li><a href="">Blog</a></li>
                <li><a href="">Login</a></li>
                <li><a href="">SignUp</a></li>
            </ul>
        </div>
    </div>
</div>
<footer>
    <div class="footer-logo">
        <img src="icon/Logo.png" alt="">

    </div>
    <div class="footer-info">
        <p>© 2024 Study and topic, any thing with. All Rights Reserved.</p>
    </div>
    <div class="language_footer">
        <select name="" id="">
            <option value="VIE">Vietnamese</option>
            <option value="ENG">English</option>
        </select>
    </div>
</footer>

<script src="js/hompage.js"></script>

<script>
    function previewPhoto() {
        const fileInput = document.getElementById('photo-input');
        const file = fileInput.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function (e) {
                const profileImg = document.getElementById('profile-img');
                profileImg.src = e.target.result;
            };
            reader.readAsDataURL(file);
        }
    }

    function enablePhotoInput() {
        const photoInput = document.getElementById('photo-input');
        const savePhotoBtn = document.getElementById('save-photo-btn');
        const editPhotoBtn = document.getElementById('edit-photo-btn');

        photoInput.disabled = false;
        photoInput.click();
        savePhotoBtn.classList.remove('hidden');
        editPhotoBtn.classList.add('hidden');
    }

    function changePhoto() {
        const photoInput = document.getElementById('photo-input');
        const savePhotoBtn = document.getElementById('save-photo-btn');
        const editPhotoBtn = document.getElementById('edit-photo-btn');

        photoInput.disabled = true;
        savePhotoBtn.classList.add('hidden');
        editPhotoBtn.classList.remove('hidden');
    }

    function enableEdit(button) {
        const inputs = document.querySelectorAll("#profile-form .form-control");
        const cancelButton = document.getElementById('cancel-btn');

        if (button.id === "edit-info-btn") {
            button.id = "save-info-btn";
            button.textContent = "Save";
            inputs.forEach(input => {
                if (input.id !== "username" && input.id !== "role" && input.id !== "email") {
                    input.readOnly = false;
                    input.classList.add("default_input");
                }
            });
            cancelButton.hidden = false;
        } else {
            document.getElementById("profile-form").submit();
            button.id = "edit-info-btn";
            button.textContent = "Edit";
            inputs.forEach(input => {
                if (input.id !== "username" && input.id !== "role" && input.id !== "email") {
                    input.readOnly = true;
                    input.classList.remove("default_input");
                }
            });
            cancelButton.hidden = true;
        }
    }
</script>
</body>

</html>
