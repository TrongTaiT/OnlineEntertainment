<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!-- self-config -->
    <link rel="stylesheet" href="/oe/assets/css/sign-in-up.css">
    <link rel="icon" type="image/x-icon" href="/oe/assets/img/logo.png">

    <title>Đổi mật khẩu || Online Entertainment</title>
</head>

<body>
    <div class="main d-flex justify-content-center align-items-center">
        <div class="content d-flex flex-column align-items-center pt-4 px-4 pb-5">
            <a href="/oe/" class="header__logo-link text-decoration-none">
                <img class="header__logo-img" src="/oe/assets/img/logo.png" alt="Logo">
                <span class="header__logo-name">Online Entertainment</span>
            </a>

            <h2 class="my-4 text-white pe-none">CHANGE <span class="text-gradient">PASSWORD</span></h2>

            <form action="/oe/change-password" method="post" class="form mb-3">
                <div class="form-floating my-4">
                    <input name="currentPassword" value="${param.currentPassword}" type="password" id="password" class="form-control" placeholder="Mật khẩu hiện tại" required>
                    <label for="password">Mật khẩu hiện tại</label>
                </div>
                <div class="form-floating my-4">
                    <input name="newPassword" value="${param.newPassword}" type="password" id="newPassword" class="form-control" placeholder="Mật khẩu mới" required>
                    <label for="newPassword">Mật khẩu mới</label>
                </div>
                <div class="form-floating my-4">
                    <input name="confirmNewPassword" value="${param.confirmNewPassword}" type="password" id=""confirmNewPassword"" class="form-control" placeholder="Xác nhận Mật khẩu mới" required>
                    <label for="confirmNewPassword">Xác nhận Mật khẩu mới</label>
                </div>
                
                <div class="mb-3">
                	<p class="font-italic text-warning">${message}</p>
                </div>
                <button type="submit" class="btn btn-gradient w-100 mt-4">ĐĂNG NHẬP</button>
            </form>

            <div>
                <span class="text-main">Không có tài khoản?</span>
                <a class="link-opacity text-gradient" href="/oe/sign-up">Đăng ký</a>
            </div>

            <a class="link-opacity text-gradient mt-3" href="/oe/forgot-password">Quên mật khẩu?</a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>

</html>