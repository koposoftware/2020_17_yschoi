<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
  System.out.println("list.jsp 진입");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
  function goWriteForm() {
    location.href = "${ pageContext.request.contextPath }/board/write"
  }
  function doAction(boardNo) {
    //location.href="${ pageContext.request.contextPath }/board/detail?no="+boardNo;
    location.href = "${ pageContext.request.contextPath }/board/" + boardNo; //REST방식
  }
</script>
</head>
<body>
		<h2>전체 게시글 목록</h2>
		<header>
				<%-- <%@ include file="/WEB-INF/jsp/include/topMenu.jsp"%> --%>
				<!-- 복사 붙여넣기 방식 -->
				<jsp:include page="/WEB-INF/jsp/include/topMenu.jsp" />
				<!-- 메소드 호출방식 -->
		</header>
		<section>
				<div align="center">
						<hr width="100%">
						<h2>게시판 목록</h2>
						<hr width="100%">
						<table border="1" style="width: 100%">
								<tr>
										<th width="6%">번호</th>
										<th>제목</th>
										<th width="16%">글쓴이</th>
										<th width="15%">등록일</th>
										<th width="8%">조회수</th>
								</tr>
								<c:forEach items="${ boardList }" var="board" varStatus="loop">
										<tr <c:if test="${ loop.count mod 2 eq 0}"> class="even" </c:if>>
												<td>${board.no}</td>
												<c:choose>
														<c:when test="${ not empty resultVO  }">
																<td>
																		<%-- <a href="viewCnt.jsp?no=${ board.no }"> --%> <a href="datail.jsp?type=list&no=${ board.no }"> <c:out value="${ board.title }" />
																</a>
																</td>
														</c:when>
														<c:otherwise>
																<td><a href="javascript:doAction(${ board.no })"> <c:out value="${ board.title }" />
																</a></td>
														</c:otherwise>
												</c:choose>
												<td>${ board.writer }</td>
												<td>${ board.regDate }</td>
												<td>${ board.viewCnt }</td>
										</tr>
								</c:forEach>
						</table>
						<br>
						<c:if test="${ not empty loginVO }">
								<button onclick="goWriteForm()">새글등록</button>
								<!--인라인 방식의 이벤트 처리-->
								<!--  button 등으로 이벤트 넣으려면 js나 jquery 필요!! -->
						</c:if>
				</div>
		</section>
		<footer>
				<%@ include file="/WEB-INF/jsp/include/footer.jsp"%>
				<!-- 복사 붙여넣기 방식 -->
		</footer>
</body>
</html>