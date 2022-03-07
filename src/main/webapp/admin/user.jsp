<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%-- <c:set var="image" value="${not empty user.image ? /oe/assets/avatar/user.image : /oe/assets/img/default_png.png}" />--%>
<c:if test="${empty user.image}">
	<c:set var="image" value="/oe/assets/avatar/default_avatar.png" />
</c:if>
<c:if test="${not empty user.image}">
	<c:set var="image" value="/oe/assets/avatar/${user.image}" />
</c:if>

<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<!-- Fontawesome -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    
    <!-- self-config -->
    <link rel="stylesheet" href="/oe/assets/css/manages.css">
    <link rel="icon" type="image/x-icon" href="/oe/assets/img/logo.png">

    <title>User Management || Online Entertainment</title>
</head>

<body>
    <jsp:include page="header.jsp"></jsp:include>
	
    <main class="main text-main">
        <!-- Nav pills -->
        <div class="main__head bg-main">
            <div class="container py-3">
                <ul class="nav nav-pills">
                    <li class="nav-item">
                        <a class="nav-link active" data-bs-toggle="pill" href="#list">List</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-bs-toggle="pill" href="#edition">Form</a>
                    </li>
                </ul>

            </div>
        </div>

        <!-- Tab panes -->
        <div class="container">
            <div class="tab-content">
            	<div class="tab-pane active mt-4" id="list">
                	<c:if test="${not empty message}">
                    	<h4 class="mx-auto py-2 text-center text-white bg-main mt-2">${message}</h4>
                	</c:if>
                    <table class="table table-hover table-dark table-striped ">
                    	<thead class="thead-dark text-center">
                            <tr>
                                <th>Index</th>
                                <th>User ID</th>
                                <th>Email</th>
                                <th>Password</th>
                                <th>Fullname</th>
                                <th>Adminstrator</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                    	<c:forEach var="user" items="${users}" varStatus="status">
                    		<tr>
                                <td>${status.index + 1}</td>
                                <td>${user.userID}</td>
                                <td>${user.email}</td>
                                <td>${user.password}</td>
                                <td>${user.fullname}</td>
                                <td>${user.admin}</td>
                                <td class="text-center">
                                	<a href="/oe/admin/user/edit?userID=${user.userID}" class="btn btn-sm btn-info me-2"><i class="fa-solid fa-pen-to-square me-1"></i>Edit</a>
                                	<a href="/oe/admin/user/delete?userID=${user.userID}" class="btn btn-sm btn-danger"><i class="fa-regular fa-trash-can me-1"></i>Detele</a>
                                </td>
                            </tr>
                    	</c:forEach>
                        </tbody>
                    </table>
                </div>
                
                <div class="tab-pane fade" id="edition">
                    <form action="/oe/admin/user" method="post" class="form bg-main mx-auto mt-4 p-4" enctype='multipart/form-data'>
                        <div class="d-flex">
                            <div class="form__img bg-secondary display-inline-block me-4">
                                <img src="${image}" id="output" alt="User's avatar" width="100%">
                            </div>
                            <div class="flex-grow-1">
                            	
                            	<c:if test="${user.userID > 0}">
	                            	<div class="mb-3">
	                                    <label for="userID" class="form-label">ID:</label>
	                                    <input name="userID" value="${user.userID}" type="text" readonly class="form-control form-control-sm" id="userID" required>
	                                </div>
								</c:if>
                            
                                <div class="mb-3">
                                    <label for="userEmail" class="form-label">Email:</label>
                                    <input name="email" value="${user.email}" type="email" id="userEmail" class="form-control form-control-sm" required>
                                </div>
                                <div class="mb-3">
                                    <label for="userPassword" class="form-label">Password:</label>
                                    <input name="password" value="${user.password}" type="password" id="userPassword" class="form-control form-control-sm" required>
                                </div>
                                <div class="mb-3">
                                    <label for="userFullname" class="form-label">Fullname:</label>
                                    <input name="fullname" value="${user.fullname}" type="text" id="userFullname" class="form-control form-control-sm" required>
                                </div>
                                <div class="form-check form-switch mb-3">
                                    <input name="admin" type="checkbox" ${user.admin ? 'checked' : ''} class="form-check-input cursor-pointer" id="mySwitch">
                                    <label class="form-check-label cursor-pointer" for="mySwitch">Admin?</label>
                                </div>
                                <div class="mb-3">
                                    <label for="userImage" class="form-label">Avatar:</label>
                                    <input type="hidden" name="currentImage" value="${user.image}"/>
                                    <input name="image" class="form-control form-control-sm " type="file" accept="image/*" id="userImage" onchange="document.getElementById('output').src = window.URL.createObjectURL(this.files[0])">
                                </div>
                            </div>
                        </div>
                        <hr>
                        <div class="text-end ">
                        	<c:if test="${user.userID <= 0}">
                            	<button formaction="/oe/admin/user/create" type="submit" class="btn btn-outline-success me-3 ">Create</button>
							</c:if>
							<c:if test="${user.userID > 0}">
	                            <button formaction="/oe/admin/user/update" type="submit" class="btn btn-outline-warning me-3 ">Update</button>
	                            <button formaction="/oe/admin/user/delete" type="submit" class="btn btn-outline-danger me-3 ">Delete</button>
							</c:if>
                            <a href="/oe/admin/user" class="btn btn-outline-info me-3 ">Reset</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js " integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM " crossorigin="anonymous "></script>
	<!-- <script>
		// Auto change tab when userId != null
		const 
		const tabPanes = document.querySelector(".tab-pane");
	</script> -->
</body>

</html>