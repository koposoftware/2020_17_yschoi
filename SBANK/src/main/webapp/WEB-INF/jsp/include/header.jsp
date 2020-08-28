<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<header id="header">
		<a href="${pageContext.request.contextPath }/index.jsp" class="logo"><h2>SBANK</h2></a>
		<ul class="icons">
				<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
				<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
				<li><a href="#" class="icon brands fa-snapchat-ghost"><span class="label">Snapchat</span></a></li>
				<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
				<li><a href="#" class="icon brands fa-medium-m"><span class="label">Medium</span></a></li>
				<br>
				<li>
						<%-- <a href="${pageContext.request.contextPath }/login">로그인 로그아웃</a>  --%> <c:choose>
								<c:when test="${empty loginVO  }">
										<a href="${pageContext.request.contextPath}/login">로그인 </a> |
			</c:when>
								<c:otherwise>
										<a href="${pageContext.request.contextPath}/logout">로그아웃 </a>
								</c:otherwise>
						</c:choose>
				</li>
				<li><a href="${pageContext.request.contextPath }/board/write">새글등록</a></li>
				<li><a>마이페이지</a></li>
				<br>
				<c:if test="${ not empty loginVO }">
						<li>[${loginVO.id}님으로 로그인 중...]</li>
				</c:if>
		</ul>
</header>
