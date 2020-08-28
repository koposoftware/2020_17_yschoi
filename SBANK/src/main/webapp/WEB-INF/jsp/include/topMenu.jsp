<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/${pageContext.request.contextPath }/resources/${pageContext.request.contextPath }/resources/css/board.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/${pageContext.request.contextPath }/resources/${pageContext.request.contextPath }/resources/css/layout.css">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
  function addFavorite() {
    try {
      window.external.AddFavorite('http://localhost:9999/Mission-Spring/', 'spring web')
    } catch (e) {
      alert("hoxy chrome..? try with IE or press ctrl +d ");
    }
  }
</script>
<table border="1" width="100%">
		<tr>
				<td rowspan="2" style="width: 184px; height: 60px"><a href="${pageContext.request.contextPath}"> <img src="${pageContext.request.contextPath}/resources/images/logo.png">
				</a></td>
				<td align="right">
						<%-- 			<a href="javascript:window.external.AddFavorite('http://localhost:9999/Mission-WEB/index.jsp','첫번째 나의 웹')">--%> <%--			<a href="javascript:addFavorite()">--%> <a href="#" onclick="addFavorite()"> 즐겨찾기 </a> <c:if test="${ not empty loginVO }">
				[${loginVO.id}님으로 로그인 중...]
			</c:if>
				</td>
		</tr>
		<tr>
				<td>
						<nav>
								<c:if test="${ loginVO.type eq 'S' }">
										<a href="${pageContext.request.contextPath}/jsp/member/showAllUser.jsp">회원관리</a>  |
				</c:if>
								<a href="${pageContext.request.contextPath}/board">게시판</a>|
								<c:choose>
										<c:when test="${empty loginVO  }">
												<a href="${pageContext.request.contextPath}/login">로그인 </a> |
					</c:when>
										<c:otherwise>
												<a href="${pageContext.request.contextPath}/logout">로그아웃 </a>
										</c:otherwise>
								</c:choose>
						</nav>
				</td>
		</tr>
</table>