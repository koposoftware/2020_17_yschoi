<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>SBANK</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- <link rel="manifest" href="site.webmanifest"> -->
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath }/resources/img/favicon.png">
<!-- Place favicon.ico in the root directory -->

<!-- CSS here -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/magnific-popup.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/themify-icons.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/nice-select.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/flaticon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/gijgo.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/animate.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/slick.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/slicknav.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
<!-- <link rel="stylesheet" href="css/responsive.css"> -->
</head>

<body>
    <!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->

    <!-- header-start -->




	<header>
		<div class="header-area ">
			<div class="header-top_area d-none d-lg-block">
				<div class="container">
					<div class="row">
						<div class="col-xl-5 col-md-5 ">
							<div class="header_left">
								<p>Welcome to SBANK</p>
							</div>
						</div>
						<div class="col-xl-7 col-md-7">
							<div class="header_right d-flex">
								<div class="short_contact_list">
									<ul>
										<li><a href="#"> <i class="fa fa-envelope"></i>
												cysun31@naver.com
										</a></li>
										<li><a href="#"> <i class="fa fa-phone"></i>
												010-9438-5248
										</a></li>
									</ul>
								</div>
								<div class="social_media_links">
									<a href="#"> <i class="fa fa-linkedin"></i>
									</a> <a href="#"> <i class="fa fa-facebook"></i>
									</a> <a href="#"> <i class="fa fa-google-plus"></i>
									</a>

								</div>
								<br>

							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="sticky-header" class="main-header-area details_nav">
				<div class="container">
					<div class="header_bottom_border">
						<div class="row align-items-center">
							<div class="col-xl-3 col-lg-2">
								<div class="logo">
									<a href="${pageContext.request.contextPath }/"> <img
										src="${pageContext.request.contextPath }/resources/img/logo.png"
										alt="">
									</a>
								</div>
							</div>
							<div class="col-xl-6 col-lg-7">
								<div class="main-menu  d-none d-lg-block">
									<nav>
										<ul id="navigation">
											<li><a href="#">디자인참고<i class="ti-angle-down"></i></a>
												<ul class="submenu">
													<li><a
														href="${pageContext.request.contextPath }/case_details.html">case
															details</a></li>
													<li><a
														href="${pageContext.request.contextPath }/about.html">about</a></li>
													<li><a
														href="${pageContext.request.contextPath }/elements.html">elements</a></li>
													<li><a
														href="${pageContext.request.contextPath }/services.html">Services</a></li>
													<li><a
														href="${pageContext.request.contextPath }/study.html">Case
															study</a></li>
													<li><a
														href="${pageContext.request.contextPath }/blog.html">blog</a></li>
													<li><a
														href="${pageContext.request.contextPath }/single-blog.html">single-blog</a></li>
													<li><a
														href="${pageContext.request.contextPath }/contact.html">Contact</a></li>
												</ul></li>
											<li><a href="#">bank<i class="ti-angle-down"></i></a>
												<ul class="submenu">
													<li><a
														href="${pageContext.request.contextPath }/account/myAccount">내 모든 계좌 조회</a></li>
													<li><a
														href="${pageContext.request.contextPath }/account/create">계좌 개설</a></li>
													<%--	<div class="dropdown-divider"></div>
													<li><a
                            href="${pageContext.request.contextPath }/account/myExchange">외화 계좌 개설</a></li>
														<div class="dropdown-divider"></div>
													<li><a
														href="${pageContext.request.contextPath }/account/myAccount2">사이드바
															테스트</a></li> --%>
												</ul></li>
											<li><a href="#">exchange<i class="ti-angle-down"></i></a>
												<ul class="submenu">
													<li><a
														href="${pageContext.request.contextPath }/rate/rateInfo">환율정보</a></li>
													<li><a
														href="${pageContext.request.contextPath }/exchange/guide">환전가이드</a></li>
													<div class="dropdown-divider"></div>
													<c:choose>
													<c:when test="${loginVO.type == 'K'  }">
													<li><a
														href="${pageContext.request.contextPath }/exchange/doExchangeKakao">비회원
															환전하기</a></li>
                          </c:when>
                          <c:otherwise>
													<li><a
														href="${pageContext.request.contextPath }/exchange/doExchange">환전하기</a></li>
													<li><a
														href="${pageContext.request.contextPath }/exchange/doReserve">목표 환전 예약하기</a></li>
													<li><a
														href="${pageContext.request.contextPath }/exchange/doRevExchange">재환전하기</a></li>
													<li><a
														href="${pageContext.request.contextPath }/exchange/present">환전선물하기</a></li>
                          </c:otherwise>
                          </c:choose>
                          <div class="dropdown-divider"></div>
                          <li><a
                            href="${pageContext.request.contextPath }/exchange/myExchange">환전 & 예약 내역 보기</a></li>
                          <li><a
                            href="${pageContext.request.contextPath }/account/myExchange">보유 외화 보기</a></li>
												</ul></li>

										</ul>

									</nav>
								</div>
							</div>
							<div class="col-xl-3 col-lg-3 d-none d-lg-block">
								<div class="Appointment">
									<p align="right" class="head-login">
										<c:choose>
											<c:when test="${not empty loginVO  }">
												[${loginVO.id}님 환영합니다!] &nbsp;&nbsp;&nbsp;
												<a href="${pageContext.request.contextPath }/logout">
												  <img src="${pageContext.request.contextPath }/resources/img/logout.png">
												</a>
											</c:when>
											<c:otherwise>
												<a href="${pageContext.request.contextPath }/login">
												  <img src="${pageContext.request.contextPath }/resources/img/login.png">
												</a>
											</c:otherwise>
										</c:choose>
									</p>

								</div>
							</div>
							<div class="col-12">
								<div class="mobile_menu d-block d-lg-none"></div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</header>
	<!-- header-end! -->
    <br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br><br><br><br>