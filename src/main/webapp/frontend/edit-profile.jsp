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

    <title>Chỉnh sửa hồ sơ || Online Entertainment</title>
</head>

<body>
    <div class="main d-flex justify-content-center align-items-center">
        <div class="content d-flex flex-column align-items-center pt-4 px-4 pb-5">
            <a href="/oe/" class="header__logo-link text-decoration-none">
                <img class="header__logo-img" src="/oe/assets/img/logo.png" alt="Logo">
                <span class="header__logo-name">Online Entertainment</span>
            </a>

            <h2 class="my-4 text-white pe-none">EDIT <span class="text-gradient">PROFILE</span></h2>

            <form action="/oe/edit-profile" method="post" class="form mb-3" enctype='multipart/form-data'>
            	<div class="mb-3 text-center">
            		<img src="/oe/assets/avatar/${sessionScope.user.image}" id="output" class="rounded-circle ms-3" alt="Cinque Terre" width="80" height="80" style="transform: translateX(-10px);">
                </div>
                <div class="mb-3">
                    <input type="hidden" name="currentImage" value="${sessionScope.user.image}"/>
                    <input name="image" class="form-control form-control-sm p-2" type="file" accept="image/*" id="userImage" onchange="document.getElementById('output').src = window.URL.createObjectURL(this.files[0])">
                </div>
                <div class="form-floating mb-3 mt-3">
                    <input name="email" value="${sessionScope.user.email}" type="email" class="form-control" placeholder="Email" required>
                    <label for="email">Email</label>
                </div>
                <div class="form-floating mb-3 mt-3">
                    <input name="fullname" value="${sessionScope.user.fullname}" type="text" class="form-control" placeholder="Họ tên" required>
                    <label for="fullname">Họ tên</label>
                </div>
                
                <div class="mb-3">
                	<p class="font-italic text-warning">${message}</p>
                </div>
                
                <button type="submit" class="btn btn-gradient w-100 mt-4">LƯU LẠI</button>
            </form>

        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>

</html>