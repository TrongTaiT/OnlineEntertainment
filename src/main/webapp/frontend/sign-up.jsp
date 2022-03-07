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

    <title>Đăng kí || Online Entertainment</title>
</head>

<body>
    <div class="main d-flex justify-content-center align-items-center">
        <div class="content d-flex flex-column align-items-center pt-4 px-4 pb-5">
            <a href="/oe/" class="header__logo-link text-decoration-none">
                <img class="header__logo-img" src="/oe/assets/img/logo.png" alt="Logo">
                <span class="header__logo-name">Online Entertainment</span>
            </a>

            <h2 class="my-4 text-white pe-none">SIGN <span class="text-gradient">UP</span></h2>

            <form action="/oe/sign-up" method="post" class="form mb-3">
            	<div class="form-floating mb-3 mt-3">
				  <input name="email" value="${param.email}" type="email" class="form-control" id="email" placeholder="Email" required>
				  <label for="email">Email</label>
				</div>
            	<div class="form-floating mb-3 mt-3">
				  <input name="fullname" value="${param.fullname}" type="text" class="form-control" id="fullname" placeholder="Họ tên" required>
				  <label for="fullname">Họ tên</label>
				</div>
            	<div class="form-floating mb-3 mt-3">
				  <input name="password" value="${param.password}" type="password" class="form-control" id="email" placeholder="Mật khẩu" required>
				  <label for="password">Mật khẩu</label>
				</div>
				
                <!-- <div class="form-check mb-3 ms-2">
                    <label class="form-check-label cursor-pointer ml-3">
                        <input class="form-check-input cursor-pointer" type="checkbox" name="remember">
                        Tôi đồng ý với 
                        <a class="ms-1 link-opacity text-gradient" href="#">Chính sách Quyền riêng tư</a>
                    </label>
                </div> -->
                
                <div class="mb-3">
                	<p class="font-italic text-warning">${message}</p>
                </div>
                
                <button type="submit" class="btn btn-gradient w-100 mt-4">ĐĂNG KÍ</button>
            </form>

            <div>
                <span class="text-main">Đã có tài khoản?</span>
                <a class="link-opacity text-gradient ms-1" href="/oe/sign-in">Đăng nhập</a>
            </div>

            <a class="link-opacity text-gradient mt-3" href="/oe/forgot-password">Quên mật khẩu?</a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>

</html>