<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<%@ include file="/WEB-INF/jsp/include/head.jsp"%>




<!-- 수정할부분 시작 -->
<section>
<div class="row">
	<div class="col-4">
		<%@ include file="/WEB-INF/jsp/include/aside.jsp"%>
	</div>
	<div class="section_title mb-50">
					<h3>내 계좌 조회</h3>
				</div>
	<div class="col-8">
		<div class="table-wrapper">
			<c:forEach items="${accountList}" var="account" varStatus="loop">
				<form
					action="${pageContext.request.contextPath }/account/accountTransfer"
					method="post" id="formm">
					<table border="1" class="table table-bordered">
						<tr>
							<th width="25%">보유은행</th>
							<td width="25%">${account.bank_name}</td>
							<th width="25%">개설일자</th>
							<td width="25%">${account.reg_date}</td>
						</tr>
						<tr>
							<th>계좌번호</th>
							<td>${account.account_num}</td>
							<th>별칭</th>
							<td>${account.nick_name}</td>
						</tr>
						<tr>
							<th>잔액</th>
							<td>${account.balance}</td>
							<td colspan="2">
								<button class="btn btn-outline-dark">계좌이체하기</button> 
								<input type="hidden" id="account_num" name="account_num" value="${account.account_num}">
							</td>
						</tr>
					</table>
				</form>
				<br>
			</c:forEach>
		</div>
	</div>
  
</div>



<!-- 	<div class="container class="col-xl-12"">
		<div class="row">
			<div class="col-xl-12">
				<div class="section_title text-center mb-50">
				<div class="section_title mb-50">
					<h3>내 계좌 조회</h3>
				</div>
			</div>
		</div>
		

	</div> -->

</section><br><br><br><br><br>
<!-- 수정할부분 끝 -->




<%@ include file="/WEB-INF/jsp/include/foot.jsp"%>