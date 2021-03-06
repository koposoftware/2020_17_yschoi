<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<%@ include file="/WEB-INF/jsp/include/head.jsp"%>





<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
function numberWithCommas(x) {
  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}


$(document).ready(function() {  //원화계좌 숫자는 콤마 넣자 시작 

  var accountListResult = new Array();
  let budget = "${accountList}";
  //console.log(budget);
  
  <c:forEach items="${accountList}" var="exchange">
    var json = new Object();
    json.account_num="${exchange.account_num}"
    json.balance=numberWithCommas("${exchange.balance}")
    accountListResult.push(json)
  </c:forEach>

  //console.log(reserveResult);
  
  $.each(accountListResult, function() {
    
    var price = '#krwBalance';
    price += $(this)[0].account_num

    $(price).text($(this)[0].balance)

  });  
}) //원화계좌 숫자는 콤마 넣자 끝 


$(document).ready(function() {  //보유외화 숫자는 콤마 넣자 시작 

  var curListResult = new Array();
  let budget = "${curlist}";
  //console.log(budget);
  
  <c:forEach items="${curlist}" var="exchange">
    var json = new Object();
    json.currencycode="${exchange.currencycode}"
    json.balance=numberWithCommas("${exchange.balance}")
    curListResult.push(json)
  </c:forEach>

  //console.log(reserveResult);
  
  $.each(curListResult, function() {
    
    var price = '#curListBalance';
    price += $(this)[0].currencycode

    $(price).text($(this)[0].balance)

  });  
}) //보유외화 숫자는 콤마 넣자 끝 


</script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<style>
.project-tab {
  padding: 10%;
  margin-top: -8%;
}
.project-tab #tabs{
  background: #007b5e;
  color: #eee;
}
.project-tab #tabs h6.section-title{
  color: #eee;
}
.project-tab #tabs .nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active {
  color: #004584;
  background-color: transparent;
  border-color: transparent transparent #f3f3f3;
  border-bottom: 3px solid !important;
  font-size: 20px;
  font-weight: bold;
}
.project-tab .nav-link {
    border: 1px solid transparent;
    border-top-left-radius: .25rem;
    border-top-right-radius: .25rem;
    color: #0062cc;
    font-size: 19px;
    font-weight: 600;
}
.project-tab .nav-link:hover {
  border: none;
}
.project-tab thead{
  background: #f3f3f3;
  color: #333;
}
.project-tab a{
  text-decoration: none;
  color: #333;
  font-weight: 600;
}
.ali{
  text-align: right !important;
}
.centerLine{
  text-align: center;
}
th{
  background-color: #f4f8f9;
  font-size: 19px !important;
  font-weight: 600 !important;
}
td{
  font-size: 17px !important;
  font-weight: 400 !important;
}
</style>



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
    
    
    
    
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <nav>
            <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
              <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">원화계좌</a> <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">외화계좌</a> <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">보유외화</a>
            </div>
          </nav>
          <div class="tab-content" id="nav-tabContent">
            <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
              <c:forEach items="${accountList}" var="account" varStatus="loop">
              <br>
                <form action="${pageContext.request.contextPath }/account/accountTransfer" method="post" id="formm">
                  <table border="1" class="table table-bordered centerLine">
                    <input type="hidden" id="account_num" name="account_num" value="${account.account_num}">
                    <tr>
                      <th>계좌번호</th>
                      <td>${account.account_num}</td>
                      <th width="25%">개설일자</th>
                      <td width="25%">${account.reg_date}</td>
                      <td><button class="btn btn-outline-dark">계좌이체하기</button></td>
                    </tr>
                    <tr>
                      <th>잔액(원)</th>
                      <td class="ali"><span id="krwBalance${account.account_num}"></span></td>
                      <th>별칭</th>
                      <td>${account.nick_name}</td>
                      <td><button class="btn btn-outline-dark">계좌별칭수정</button></td>
                    </tr>
                  </table>
                </form>
                <br>
              </c:forEach>
            </div>
            <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
              <c:forEach items="${accountCurList}" var="account" varStatus="loop">
              <br>
                <form action="${pageContext.request.contextPath }/" method="post" id="formm">
                  <table border="1" class="table table-bordered centerLine">
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
            <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
              <c:forEach items="${curlist}" var="account" varStatus="loop">
              <br>
                <form action="${pageContext.request.contextPath }/" method="post" id="formm">
                  <table border="1" class="table table-bordered centerLine">
                    <thead>
                      <tr>
                        <th>계좌번호</th>
                        <th>통화명</th>
                        <th>잔액(외화)</th>
                      </tr>
                    </thead>
                    <tbody>
                      <td>${account.account_num}</td>
                      <td>${account.currencycode}</td>
                      <td class="ali"><span id="curListBalance${account.currencycode}"></span></td>
                    </tbody>
                  </table>
                </form>
                <br>
              </c:forEach>
            </div>
          </div>
        </div>
      </div>
    </div>
    <br><br><br><br><br><br><br><br>
    
    
    
    
    
    
    
		
<%-- 		<header class="section_title mb-50 major">
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
    </div> --%>
		
		

	</div>

</section><br><br><br><br><br>
<!-- 수정할부분 끝 -->




<%@ include file="/WEB-INF/jsp/include/foot.jsp"%>