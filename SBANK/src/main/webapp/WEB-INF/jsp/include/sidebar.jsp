<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Sidebar -->
<div id="sidebar">
		<div class="inner">
				<!-- Search -->
				<section id="search" class="alt">
						<form method="post" action="#">
								<input type="text" name="query" id="query" placeholder="Search" />
						</form>
				</section>
				<!-- Menu -->
				<nav id="menu">
						<header class="major">
								<h2>Menu</h2>
						</header>
						<ul>
								<li><a href="/SBANK/generic.jsp">Generic 마이페이지 </a></li>
								<li><a href="/SBANK/elements.jsp">Elements</a></li>
								<li><span class="opener"><a href="${pageContext.request.contextPath}/account/myAccount">BANK</a></span>
										<ul>
												<li><a href="${pageContext.request.contextPath}/account/myAccount">내계좌</a></li>
												<li><a href="${pageContext.request.contextPath}/account/create">계좌개설</a></li>
												<li><a href="#">오픈뱅킹 - 계좌 연동</a></li>
												<li><a href="#">오픈뱅킹 - 계좌 확인</a></li>
										</ul></li>
								<li><a href="${pageContext.request.contextPath}/rate/rateInfo">환율정보</a></li>
								<li><span class="opener">환전</span>
										<ul>
												<li><a href="${pageContext.request.contextPath}/exchange/guide">환전가이드</a></li>
												<li><a href="${pageContext.request.contextPath}/exchange/doExchange">환전하기</a></li>
												<li><a href="#">환전예약하기</a></li>
												<li><a href="#">환전 메시지/SNS신청</a></li>
												<li><a href="#">비회원고객 환전하기</a></li>
										</ul></li>
								<li><a href="#">송금</a></li>
								<li><a href="#">외화선물하기</a></li>
								<li><a href="${pageContext.request.contextPath}/board">Q&A</a></li>
						</ul>
				</nav>
				<section>
						<header class="major">
								<h2>Get in touch</h2>
						</header>
						<ul class="contact">
								<li class="icon solid fa-envelope"><a href="#">cysun31@naver.com</a></li>
								<li class="icon solid fa-phone">010 - 9438 -5248</li>
								<li class="icon solid fa-home">경기 광명시 오리로 904</li>
						</ul>
				</section>
				<!-- Footer -->
				<!-- <footer id="footer">
			<p class="copyright">
				&copy; Untitled. All rights reserved. Demo Images: <a
					href="https://unsplash.com">Unsplash</a>. Design: <a
					href="https://html5up.net">HTML5 UP</a>.
			</p>
		</footer> -->
				<!-- Scripts -->
				<script src="${pageContext.request.contextPath }/resources/js/jquery.min.js"></script>
				<script src="${pageContext.request.contextPath }/resources/js/browser.min.js"></script>
				<script src="${pageContext.request.contextPath }/resources/js/breakpoints.min.js"></script>
				<script src="${pageContext.request.contextPath }/resources/js/util.js"></script>
				<script src="${pageContext.request.contextPath }/resources/js/main.js"></script>
		</div>
</div>