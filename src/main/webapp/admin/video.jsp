<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> --%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<%-- <c:set var="image" value="${not empty video.poster ? /oe/assets/poster/video.poster : '/oe/assets/poster/default_poster.png' } " /> --%>
<c:if test="${empty form.poster}">
	<c:set var="image" value="/oe/assets/poster/default_poster.png" />
</c:if>
<c:if test="${not empty form.poster}">
	<c:set var="image" value="/oe/assets/poster/${form.poster}" />
</c:if>

<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <!-- self-config -->
    <link rel="stylesheet" href="/oe/assets/css/manages.css">
    <link rel="icon" type="image/x-icon" href="/oe/assets/img/logo.png">
	<!-- Fontawesome -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Video Management || Online Entertainment</title>
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
                                <th>Video ID</th>
                                <th>Title</th>
                                <th>View Count</th>
                                <th>Released date (dd/MM/yyyy)</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                    	<c:forEach var="video" items="${videos}" varStatus="status">
                    		<tr>
                                <td>${status.index + 1}</td>
                                <td>${video.videoID}</td>
                                <td>${video.title}</td>
                                <td>${video.views}</td>
                                <td>
                                	<fmt:formatDate value="${video.releasedDate}" type="date" pattern="dd/MM/yyyy" />
                                </td>
                                <td>${video.active}</td>
                                <td class="">
                                	<a href="/oe/admin/video/edit?videoID=${video.videoID}" class="btn btn-sm btn-info me-2"><i class="fa-solid fa-pen-to-square me-1"></i>Edit</a>
                                	<a href="/oe/admin/video/delete?videoID=${video.videoID}" class="btn btn-sm btn-danger"><i class="fa-regular fa-trash-can me-1"></i>Detele</a>
                                </td>
                            </tr>
                    	</c:forEach>
                        </tbody>
                    </table>
                </div>
            
                <div class="tab-pane fade" id="edition">
                    <form action="/oe/admin/video" method="post" class="form bg-main mx-auto mt-4 p-4" enctype='multipart/form-data'>
                        <div class="d-flex">
                            <div class="form__img bg-secondary display-inline-block me-4">
                                <img src="${image}" id="output" alt="Video's poster" width="100%">
                            </div>
                            <div class="flex-grow-1">
                            
	                            <c:if test="${form.videoID > 0}">
	                            	<div class="mb-3">
	                                    <label for="videoID" class="form-label">ID:</label>
	                                    <input name="videoID" value="${form.videoID}" type="text" readonly class="form-control form-control-sm" id="videoID">
	                                </div>
								</c:if>
								
                                <div class="mb-3">
                                    <label for="title" class="form-label">Title:</label>
                                    <input name="title" value="${form.title}" type="text" class="form-control form-control-sm" id="title" placeholder="Title" required>
                                </div>
                                <div class="mb-3">
                                    <label for="viewCount" class="form-label">Views:</label>
                                    <input name="views" value="${form.views}" type="number" min="0" class="form-control form-control-sm" placeholder="View Count" id="viewCount" required>
                                </div>
                                <div class="form-check form-switch mb-3">
                                    <input name="active" value="true" ${form.active ? 'checked' : ''} type="checkbox" class="form-check-input cursor-pointer" id="mySwitch">
                                    <label class="form-check-label cursor-pointer" for="mySwitch">Active?</label>
                                </div>
                                <div class="mb-3 d-flex">
                                    <label for="releasedDate" class="form-label me-3">Released date<br> (MM/dd/yyyy):</label>
                                    <input name="releasedDate" value='<fmt:formatDate pattern="yyyy-MM-dd" value="${form.releasedDate}" />' type="date" class="form-control" id="releasedDate" required>
                                </div>
                                <div class="mb-3">
                                    <label for="formFileSm" class="form-label">Video poster:</label>
                                    <input type="hidden" name="currentPoster" value="${form.poster}"/>
                                    <input name="poster" class="form-control form-control-sm " type="file" accept="image/*" id="formFileSm" onchange="document.getElementById('output').src = window.URL.createObjectURL(this.files[0])">
                                </div>
                            </div>
                        </div>
                        <div class="form-group my-3">
                            <label for="form-textarea" class="form-label">Description</label>
                            <textarea name="description" class="form-control" id="form-textarea" rows="5">${form.description}</textarea>
                        </div>
                        <hr>
                        <div class="text-end ">
                        	<c:if test="${form.videoID <= 0}">
                            	<button formaction="/oe/admin/video/create" type="submit" class="btn btn-outline-success me-3 ">Create</button>
							</c:if>
							<c:if test="${form.videoID > 0}">
                            	<button formaction="/oe/admin/video/update" type="submit" class="btn btn-outline-warning me-3 ">Update</button>
                            	<button formaction="/oe/admin/video/delete" type="submit" class="btn btn-outline-danger me-3 ">Delete</button>
							</c:if>
                            <a href="/oe/admin/video" class="btn btn-outline-info me-3 ">Reset</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js " integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM " crossorigin="anonymous "></script>
</body>

</html>