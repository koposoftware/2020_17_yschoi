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
				<header class="section_title mb-50 major" >
					<h3>내 계좌 조회</h3>
				</header>
			</div>
		</div>
		
		<header class="section_title mb-50 major">
      <h5>원화 계좌 내역 조회</h5>   
    </header>
		
		<div class="table-wrapper">
			<c:forEach items="${accountList}" var="account" varStatus="loop">
				<form
					action="${pageContext.request.contextPath }/account/accountTransfer"
					method="post" id="formm">
					<table border="1" class="table table-bordered">
					<input type="hidden" id="account_num" name="account_num" value="${account.account_num}">
						<tr>
							<th>계좌번호</th>
              <td>${account.account_num}</td>
							<th width="25%">개설일자</th>
							<td width="25%">${account.reg_date}</td>
							<td><button class="btn btn-outline-dark">계좌이체하기</button></td>
						</tr>
						<tr>
							<th>잔액</th>
              <td>${account.balance}</td>
							<th>별칭</th>
							<td>${account.nick_name}</td>
							<td><button class="btn btn-outline-dark">계좌별칭수정</button></td>
						</tr>
					</table>
				</form>
				<br>
			</c:forEach>
		</div>
		
		
		
		
		<br><br><br>
		<header class="section_title mb-50 major">
      <h5>외화 계좌 내역 조회</h5>   
    </header>
    
    <div class="table-wrapper">
      <c:forEach items="${accountCurList}" var="account" varStatus="loop">
        <form action="${pageContext.request.contextPath }/" method="post" id="formm">
          <table border="1" class="table table-bordered">
            <thead>
            <tr>
              <th>계좌번호</th>
              <th>별명</th>
              <th>개설일자</th>
            </tr>
            </thead>
            <tbody>
              <td>${account.account_num}</td>
              <td>${account.nick_name}</td>
              <td>${account.reg_date}</td>
            </tbody>

          </table>
        </form>
        <br>
      </c:forEach>
    </div>
		
		

	</div>

</section><br><br><br><br><br>
<!-- 수정할부분 끝 -->




<%@ include file="/WEB-INF/jsp/include/foot.jsp"%>