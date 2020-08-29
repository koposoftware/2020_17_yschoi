<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<%@ include file="/WEB-INF/jsp/include/head.jsp"%>




<!-- 수정할부분 시작 -->
<section>

	<div class="container class="col-xl-12"">
		<div class="row">
			<div class="col-xl-12">
				<!-- <div class="section_title text-center mb-50"> -->
				<div class="section_title mb-50">
					<h3>이체하기</h3>
				</div>
			</div>
		</div>
		<div class="table-wrapper">
			<form
				action="${pageContext.request.contextPath }/account/accountTransferProcess"
				method="post" id="formm">
				<table border="1" style="width: 100%" class="table table-bordered">
					<tr>
						<th>이체 할 계좌</th>
						<td><input type="text" id="bank_name" name="bank_name"
							placeholder="이체할 계좌번호를 입력하세요"></td>
					</tr>
					<tr>
						<th>이체 할 금액</th>
						<td><input type="text" id="balance" name="balance"
							placeholder="출금할 금액을 입력하세요" /> <!-- <span id="chkMsg2" name="chkMsg2"></span> -->
						</td>
					</tr>
					<input type="hidden" id="account_num" name="account_num"
						value="${accountVO.account_num }">
				</table>
				<button class="btn btn-outline-dark">이체하기</button>
				<!-- <input type="submit" value="이체하기"> -->
			</form>
		</div>

	</div>

</section><br><br><br><br><br>
<!-- 수정할부분 끝 -->




<%@ include file="/WEB-INF/jsp/include/foot.jsp"%>
















<section>

</section>