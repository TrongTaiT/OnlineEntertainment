<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<!-- Font-awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- self-config -->
<link rel="stylesheet" href="/oe/assets/css/main.css">
<link rel="icon" type="image/x-icon" href="/oe/assets/img/logo.png">

<title>Video Yêu Thích || Online Entertainment</title>
</head>

<body>
	
    <jsp:include page="header.jsp"></jsp:include>

	<div class="home text-light">
		<div class="home__wrapper container-xl container-sm-fluid">
			<div class="home__content py-5">
           		<c:if test="${not empty message}">
                   	<h4 class="mx-auto py-2 text-center text-white bg-main mt-2">${message}</h4>
               	</c:if>
				<div class="home__movie-section">
					<div>
						<h2>Những bộ phim yêu thích của bạn</h2>
					</div>
					<div>
						<div class="row justify-content-around">
							<c:forEach var="video" items="${favoriteVideos}">
							<div class="movie-card card p-0 mx-2 mt-5" style="width: 250px;">
								<a href="/oe/detail?videoID=${video.videoID}" class="text-secondary"> 
									<img class="movie-card-img card-img-top"
									src="/oe/assets/poster/${video.poster}" alt="${video.title}">
									<div class="card-body mt-auto">${video.title}</div>
								</a>
								<div class="card-footer text-end mt-auto">
									<button onclick="location.href='/oe/unlike?videoID=${video.videoID}';" class="btn btn-outline-success me-1">UNLIKE</button>
									<a href="/oe/share?videoID=${video.videoID}" class="btn btn-gradient">SHARE</a>
								</div>
							</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

    <jsp:include page="footer.jsp"></jsp:include>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>

</html>