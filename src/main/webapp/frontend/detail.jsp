<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!-- Font-awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA==" crossorigin="anonymous" referrerpolicy="no-referrer"
    />
    <!-- self-config -->
    <link rel="stylesheet" href="/oe/assets/css/detail.css">
    <link rel="icon" type="image/x-icon" href="/oe/assets/img/logo.png">

    <title>Chi tiết phim || Online Entertainment</title>
</head>

<body>
    
    <jsp:include page="header.jsp"></jsp:include>

    <div class="content">
        <div class="container">
            <div class="row py-4">
                <div class="col-9 me-3">
	           		<c:if test="${not empty message}">
	                   	<h4 class="mx-auto py-2 text-center text-white bg-main mt-2">${message}</h4>
	               	</c:if>
                    <div class="frame pt-5">
                        <div class="container ratio ratio-16x9">
                            <iframe src="https://www.youtube.com/embed/${video.linkVideo}" title="YouTube video player" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                        </div>
                    </div>

                    <div class="video-info py-3">
                        <div class="container" style="padding: 0;">
                            <h3 class="video-info__title">${video.title}</h3>
                            <div class="video-info__details d-flex justify-content-between">
                                <div>
                                    <span class="video-info__views me-2">${video.views} Lượt xem</span>
                                    <span class="video-info__released-date">
                                    	<fmt:formatDate value="${video.releasedDate}" type="date" pattern="dd/MM/yyyy" />
									</span>
                                </div>
                                <div>
                                    <label for="" class="cursor-pointer link-opacity">
                                    	<a href="/oe/like?videoID=${video.videoID}">
                                        <i class="fas fa-heart me-2"></i>
                                        ${favoriteCount} Lượt thích</a>
                                    </label>
                                    <label for="" class="cursor-pointer link-opacity ms-4">
                                        <a href="/oe/share?videoID=${video.videoID}"><i class="fas fa-share me-2"></i></a>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="content__header bg-main mt-4 p-3 position-relative border-gradient">
                        <ul class="nav nav-pills">
                            <li class="nav-item">
                                <a class="nav-link active" data-bs-toggle="pill" href="#desc">Mô tả</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-bs-toggle="pill" href="#comment">Bình luận
                                    <span class="nav-badge badge bg-secondary">99</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="tab-content">
                        <div class="tab-pane active" id="desc">
                            <div class="desc__card card">
                                <div class="card-body d-flex">
                                    <div class="me-4">
                                        <img src="/oe/assets/poster/${video.poster}" alt="${video.poster}" style="width: 200px;">
                                    </div>

                                    <div>
                                        <p class="desc__text ">${video.description}</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="tab-pane fade" id="comment">
                            <div class="comment__card card text-main">
                                <div class="card-header d-flex">
                                    <div class="rounded-circle border border-secondary me-3" style="background: url(../assets/avatar/user-1.png) center center / cover no-repeat; width: 40px; height: 40px;">
                                    </div>
                                    <div>
                                        <div>Nguyễn Văn Tèo</div>
                                        <div class="comment__time">23/01/2022, 17:53</div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <p class="comment__text">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nesciunt, rem quidem! Deleniti adipisci sapiente veniam iure temporibus illum! Adipisci praesentium quos, officiis optio mollitia at recusandae! Libero, rem!
                                        Aspernatur, velit.
                                    </p>
                                </div>
                            </div>
                            <div class="comment__card card text-main">
                                <div class="card-header d-flex">
                                    <div class="rounded-circle border border-secondary me-3" style="background: url(../assets/avatar/user-1.png) center center / cover no-repeat; width: 40px; height: 40px;">
                                    </div>
                                    <div>
                                        <div>Nguyễn Văn Tèo</div>
                                        <div class="comment__time">23/01/2022, 17:53</div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <p class="comment__text">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nesciunt, rem quidem! Deleniti adipisci sapiente veniam iure temporibus illum! Adipisci praesentium quos, officiis optio mollitia at recusandae! Libero, rem!
                                        Aspernatur, velit.
                                    </p>
                                </div>
                            </div>
                            <div class="comment__card card text-main">
                                <div class="card-header d-flex">
                                    <div class="rounded-circle border border-secondary me-3" style="background: url(../assets/avatar/user-1.png) center center / cover no-repeat; width: 40px; height: 40px;">
                                    </div>
                                    <div>
                                        <div>Nguyễn Văn Tèo</div>
                                        <div class="comment__time">23/01/2022, 17:53</div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <p class="comment__text">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nesciunt, rem quidem! Deleniti adipisci sapiente veniam iure temporibus illum! Adipisci praesentium quos, officiis optio mollitia at recusandae! Libero, rem!
                                        Aspernatur, velit.
                                    </p>
                                </div>
                            </div>
                            <div class="comment__card card text-main">
                                <div class="card-header d-flex">
                                    <div class="rounded-circle border border-secondary me-3" style="background: url(../assets/avatar/user-1.png) center center / cover no-repeat; width: 40px; height: 40px;">
                                    </div>
                                    <div>
                                        <div>Nguyễn Văn Tèo</div>
                                        <div class="comment__time">23/01/2022, 17:53</div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <p class="comment__text">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nesciunt, rem quidem! Deleniti adipisci sapiente veniam iure temporibus illum! Adipisci praesentium quos, officiis optio mollitia at recusandae! Libero, rem!
                                        Aspernatur, velit.
                                    </p>
                                </div>
                            </div>
                            <div class="comment__card card text-main">
                                <div class="card-header d-flex">
                                    <div class="rounded-circle border border-secondary me-3" style="background: url(../assets/avatar/user-1.png) center center / cover no-repeat; width: 40px; height: 40px;">
                                    </div>
                                    <div>
                                        <div>Nguyễn Văn Tèo</div>
                                        <div class="comment__time">23/01/2022, 17:53</div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <p class="comment__text">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Nesciunt, rem quidem! Deleniti adipisci sapiente veniam iure temporibus illum! Adipisci praesentium quos, officiis optio mollitia at recusandae! Libero, rem!
                                        Aspernatur, velit.
                                    </p>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>

                <div class="suggest col">
                    <h3>Gợi ý</h3>
                    <c:forEach var="video1" items="${random4Videos}">
                    <div class="suggest__card card mt-3">
                        <a href="/oe/detail?videoID=${video1.videoID}">
                            <div class="card-body d-flex p-0">
                                <div class="row">
                                    <div class="col-4 p-0 ms-2">
                                        <img src="/oe/assets/poster/${video1.poster}" alt="${video1.title}" style="max-width: 100%;">
                                    </div>
                                    <div class="col p-2">
                                        <span>${video1.title}</span>
                                    </div>
                                </div>

                            </div>
                        </a>
                    </div>
					</c:forEach>
                </div>
            </div>
        </div>
    </div>

    </div>

    <jsp:include page="footer.jsp"></jsp:include>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>

</html>