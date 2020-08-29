<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>






<br>
<br>
<br>
<br>
<br>
<br>
<br>
<section>
	<form action="${pageContext.request.contextPath }/account/accountTransferProcess" method="post" id="formm">
		<table border="1" style="width: 100%">
			<tr>
				<th>이체 할 계좌</th>
				<td><input type="text" id="bank_name" name="bank_name" placeholder="이체할 계좌번호를 입력하세요"></td>
			</tr>
			<tr>
				<th>이체 할 금액 </th>
				<td>
					<input type="text" id="balance" name="balance" placeholder="출금할 금액을 입력하세요"  /> 
					<!-- <span id="chkMsg2" name="chkMsg2"></span> -->
				</td>
			</tr>
			<input type="hidden" id="account_num" name="account_num" value="${accountVO.account_num }" >
		</table>
		<input type="submit" value="이체하기">
	</form>
</section>