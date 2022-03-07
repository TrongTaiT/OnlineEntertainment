<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <!-- self-config -->
    <link rel="stylesheet" href="../assets/css/manages.css">
    <link rel="icon" type="image/x-icon" href="../assets/img/logo.png">

    <title>Thống kê || Online Entertainment</title>
</head>

<body>
    <jsp:include page="header.jsp"></jsp:include>

    <main class="main text-main">
        <!-- Nav pills -->
        <div class="main__head bg-main">
            <div class="container py-3">
                <ul class="nav nav-pills">
                    <li class="nav-item">
                        <a class="nav-link active" data-bs-toggle="pill" href="#favorites">Favorites</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-bs-toggle="pill" href="#favoriteUsers">Favorite Users</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-bs-toggle="pill" href="#sharedFriends">Shared Friends</a>
                    </li>
                </ul>

            </div>
        </div>

        <!-- Tab panes -->
        <div class="container">
            <div class="tab-content mt-4">
                <div class="tab-pane active" id="favorites">
                    <table class="table table-hover table-dark table-striped ">
                    	<thead class="thead-dark text-center">
                            <tr>
                                <th>Video Title</th>
                                <th>Favorite Count</th>
                                <th>Newest Date</th>
                                <th>Oldest Date</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="favorite" items="${favorite1}">
                       		<tr>
                               <td>${favorite.group}</td>
                               <td>${favorite.likes}</td>
                               <td><fmt:formatDate value="${favorite.newest}" type="date" pattern="dd/MM/yyyy" /></td>
                               <td><fmt:formatDate value="${favorite.oldest}" type="date" pattern="dd/MM/yyyy" /></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

                <div class="tab-pane fade mt-4 bg-light" id="favoriteUsers">
                    <div class="text-secondary p-4 d-flex align-items-center">
                        <label for="keyword">Video Title:</label>
                        <input class="form-control border-black w-75 ms-4" list="titles" name="keyword" id="keyword">
                        <datalist id="titles">
                            <option value="Vá»£ giÃ ">
                            <option value="Bá» tráº»">
                            <option value="ChÃº há»">
                            <option value="Máº¹ ÄÃ¢y">
                            <option value="CÆ°a láº¡i">
                        </datalist>
                    </div>
                    <table class="table table-hover table-dark table-striped ">
                    	<thead class="thead-dark text-center">
                            <tr>
                                <th>Email</th>
                                <th>Fullname</th>
                                <th>Favorite Date</th>
                            </tr>
                        </thead>
                        <tbody>
                       	<c:forEach var="favorite" items="${favorite2}">
                       		<tr>
                               <td>${favorite.email}</td>
                               <td>${favorite.fullname}</td>
                               <td><fmt:formatDate value="${favorite.likedDate}" type="date" pattern="dd/MM/yyyy" /></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

                <div class="tab-pane fade mt-4 bg-light" id="sharedFriends">
                    <div class="text-secondary p-4 d-flex align-items-center">
                        <label for="keyword">Video Title:</label>
                        <input class="form-control border-black w-75 ms-4" list="titles" name="keyword" id="keyword">
                        <datalist id="titles">
                            <option value="Vá»£ giÃ ">
                            <option value="Bá» tráº»">
                            <option value="ChÃº há»">
                            <option value="Máº¹ ÄÃ¢y">
                            <option value="CÆ°a láº¡i">
                        </datalist>
                    </div>
                    <table class="table table-hover table-striped ">
                        <thead class="thead-dark ">
                            <tr>
                                <th>Sender's Name</th>
                                <th>Sender's Email</th>
                                <th>Receiver Email</th>
                                <th>Sent Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>John Son</td>
                                <td>john@example.com</td>
                                <td>bubuchacha@gmail.com</td>
                                <td>12/12/2021</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js " integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM " crossorigin="anonymous "></script>
</body>

</html>