<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	function getReplyList() {
		// 해당게시물의 댓글리스트 조회 => <div id="replyList"></div> 조회데이터 업데이트
		$.ajax({
			url : '${ pageContext.request.contextPath }/reply/${ board.no }',
			type : 'get',
			success : function(data) {
				
				$('#replyList').empty();
				
				console.log(typeof data)
				let list = JSON.parse(data);
				
				$(list).each(function() {
					//console.log(this)
					
					let str = '';
					str += '<hr>';
					str += '<div>';
					str += '<strong>' + this.content + '</strong>';
					str += '(' + this.writer + ')'
					str += '&nbsp;&nbsp;&nbsp;' + this.regDate + '&nbsp;&nbsp;&nbsp;'
					str += '<button class="delBtn" id=' + this.no + '>삭제</button>'
					str += '</div>'
					
					$('#replyList').append(str);
				})
			}, 
			error : function() {
				alert('실패')
			}
		})
	}

	$(document).ready(function() {
		$('#replyAddBtn').click(function() {
			let content = document.rform.content.value;
			let writer = document.rform.writer.value;
			
			// /reply/insert?boardNo=12&content=aaa&writer=bbb
			$.ajax({
				url : '${ pageContext.request.contextPath }/reply',
				type : 'post',
				data : {
					boardNo : ${ board.no },
					content : content,
					writer : writer
				}, 
				success : function() {
					
					getReplyList();
				}, 
				error : function() {
					alert('실패')
				}, complete : function() {
					document.rform.writer.value = '';
					document.rform.content.value = '';
				}
			})
		})
	})
	
	$(document).ready(function() {
		getReplyList();
	})
	
	$(document).ready(function() {
		$(document).on('click', '.delBtn', function() {
			
			if(!confirm('댓글을 삭제하시겠습니까?')) return;
			
			let replyNo = $(this).attr('id');
			
			$.ajax({
				url: '${ pageContext.request.contextPath }/reply/' + replyNo + '/${board.no}',
				type: 'delete',
				success : function() {
					getReplyList()
				}, error: function() {
					alert('실패')
				}
			});
			/*
			$.ajax({
				url: '${ pageContext.request.contextPath }/reply/' + replyNo,
				type: 'delete',
				success : function() {
					getReplyList()
				}, error: function() {
					alert('실패')
				}
			});
			*/
		})
	})
</script>
</head>
<body>
		<header>
				<jsp:include page="/WEB-INF/jsp/include/topMenu.jsp" />
		</header>
		<section>
				<div align="center">
						<hr>
						<h2>게시판 상세 페이지</h2>
						<hr>
						<br>
						<table border="1">
								<tr>
										<th width="25%">번호</th>
										<td>${ board.no }</td>
								</tr>
								<tr>
										<th width="25%">제목</th>
										<td><c:out value="${ board.title }" /></td>
								</tr>
								<tr>
										<th width="25%">글쓴이</th>
										<td><c:out value="${ board.writer }" /></td>
								</tr>
								<tr>
										<th width="25%">내용</th>
										<td>${ board.content }</td>
								</tr>
								<tr>
										<th width="25%">조회수</th>
										<td>${ board.viewCnt }</td>
								</tr>
								<tr>
										<th width="25%">등록일</th>
										<td>${ board.regDate }</td>
								</tr>
								<tr>
										<th>첨부파일</th>
										<td><c:forEach items="${ fileList }" var="file">
														<a href="/Mission-WEB/upload/${ file.fileSaveName }"> ${ file.fileOriName } </a>
							(${ file.fileSize } bytes)<br>
												</c:forEach></td>
								</tr>
						</table>
						<br> <input type="button" value="수정" onclick="doAction('U')">&nbsp;&nbsp; <input type="button" value="삭제" onclick="doAction('D')">&nbsp;&nbsp; <input type="button" value="목록" onclick="doAction('L')">&nbsp;&nbsp; <br>
						<hr>
						<form name="rform">
								댓글 : <input type="text" name="content" size="50"> 이름 : <input type="text" name="writer" size="10"> <input type="button" value="댓글추가" id="replyAddBtn">
						</form>
						<div id="replyList"></div>
				</div>
		</section>
		<footer>
				<%@include file="/WEB-INF/jsp/include/footer.jsp"%>
		</footer>
</body>
</html>
