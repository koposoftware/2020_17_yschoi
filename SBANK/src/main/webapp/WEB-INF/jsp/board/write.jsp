<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<section>
				<div align="center">
						<hr width="80%">
						<h2>게시물 등록폼</h2>
						<hr width="80%">
						<br>
						<form:form commandName="boardVO" method="post">
								<!-- commandName과 관련이 있는 form이다. 명시해주자 -->
								<table border="1" style="width: 80%">
										<tr>
												<th width="23%">제목</th>
												<td><form:input path="title" /> <form:errors path="title" cssStyle="color :red;" /></td>
										</tr>
										<tr>
												<th width="23%">글쓴이</th>
												<td><form:input path="writer" /> <form:errors path="writer" cssStyle="color :red;" /></td>
										</tr>
										<tr>
												<th width="23%">내용</th>
												<td><form:textarea path="content" rows="4" cols="100" /> <form:errors path="content" cssStyle="color :red;" /></td>
										</tr>
								</table>
								<button>등록</button>
						</form:form>
				</div>
		</section>
</body>
</html>