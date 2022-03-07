<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<header class="header fixed-top">
	<div class="header__wrap">
		<div class="container-xl container-sm-fluid h-100">
			<div class="header__content navbar navbar navbar-expand-lg h-100">
				<a href="/oe/admin"
					class="header__logo-link navbar-brand px-4 text-white"> <img
					class="header__logo-img" src="/oe/assets/img/logo.png" alt="Logo">
					<span class="header__logo-name text-gradient">Online
						Entertainment</span>
				</a>

				<div class="collapse navbar-collapse" id="collapsibleNavbar">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link" href="/oe/admin">Home</a></li>
						<li class="nav-item"><a class="nav-link" href="/oe/admin/video">Videos</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="/oe/admin/user">Users</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="/oe/admin/report">Reports</a>
						</li>
					</ul>
				</div>
				<div class="header__end">
						<!-- search button is going to be placed here -->
						
						<c:if test="${not empty sessionScope.user}">
							<div class="d-flex justify-content-center align-items-center">
								<span class="text-white">Welcome<br>${sessionScope.user.fullname}</span>
								<img src="/oe/assets/avatar/${sessionScope.user.image}" class="rounded-circle ms-3" alt="Cinque Terre" width="50" height="50">
							</div>
						</c:if>
						<c:if test="${empty sessionScope.user}">
							<a href="sign-in"
								class="header__sign-in btn btn-gradient px-3 py-2"> <span
								class="text-light">ĐĂNG NHẬP</span>
							</a>
						</c:if>
					</div>

				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
					<i class="fas fa-bars text-white"></i>
				</button>
			</div>
		</div>
	</div>
</header>