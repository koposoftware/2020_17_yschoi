<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>



<%@ include file="/WEB-INF/jsp/include/head.jsp"%>


<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
  font-size: 16px;
  font-weight: bold;
}
.project-tab .nav-link {
    border: 1px solid transparent;
    border-top-left-radius: .25rem;
    border-top-right-radius: .25rem;
    color: #0062cc;
    font-size: 16px;
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


</style>


<!-- 수정할부분 시작 -->
<section>

  <div class="container class="col-xl-12"">
    <div class="row">
      <div class="col-xl-12">
        <!-- <div class="section_title text-center mb-50"> -->
        <header class="section_title mb-50 major" >
          <h3>환전 & 예약 내역 보기</h3>
        </header>
      </div>
    </div>
    
    
    
    
        <div class="container">
      <div class="row">
        <div class="col-md-12">
          <nav>
            <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
              <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">환전내역</a> 
              <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">환전예약내역</a> 
              <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">재환전내역</a>
            </div>
          </nav>
          <div class="tab-content" id="nav-tabContent">
            <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
            <br>
                  <table border="1" class="table table-bordered">
                  <thead>
                    <tr>
                      <th>통화명</th>
                      <th>보유금액(외화 기준)</th>
                      <th>우대적용 환율</th>
                      <th>환전금액(원)</th>
                      <th>수령인</th>
                      <th>수령일</th>
                      <th>수령지점</th>
                      <th>환전일</th>
                    </tr>
                  </thead>
                <c:forEach items="${exchangeList}" var="exchange" varStatus="loop">
                  <tbody>
                    <tr>
                      <td>${exchange.currencycode}</td>
                      <td>${exchange.exchangeprice}</td>
                      <td>${exchange.exchangerate}</td>
                      <td>${exchange.exchangecharge}</td>
                      <td>${exchange.name}</td>
                      <td>${exchange.exchange_date}</td>
                      <td>${exchange.exchange_place}</td>
                      <td>${exchange.reg_date}</td>
                    </tr>
                  </tbody>
                </c:forEach>
              </table>
            </div>
            
            
            
            
            <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
            <br>
              <table border="1" class="table table-bordered">
                  <thead>
                    <tr>
                      <th>통화명</th>
                      <th>환전예정금액(외화 기준)</th>
                      <th>우대적용 환율</th>
                      <th>환전금액(원)</th>
                      <th>환전여부</th>
                      <th>최대환전일</th>
                      <th>예약일</th>
                      <th>출금예정계좌번호</th>
                    </tr>
                  </thead>
                <c:forEach items="${reserveList}" var="reserve" varStatus="loop">
                  <tbody>
                    <tr>
                      <td>${reserve.currencycode}</td>
                      <td>${reserve.exchangeprice}</td>
                      <td>${reserve.exchangerate}</td>
                      <td>${reserve.exchangecharge}</td>
                      <td>${reserve.isexchange}</td>
                      <td>${reserve.max_date}</td>
                      <td>${reserve.reg_date}</td>
                      <td>${reserve.account_num}</td>
          
                    </tr>
                  </tbody>
                  </c:forEach>
              </table>
            </div>
            
            
            
            
            
            
            <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
              <c:forEach items="${revExchangeList}" var="account" varStatus="loop">
              <br>
                <form action="${pageContext.request.contextPath }/" method="post" id="formm">
                  <table border="1" class="table table-bordered">
                    <thead>
                      <tr>
                        <th>통화명</th>
                        <th>환전금액(외화)</th>
                        <th>우대적용 환율</th>
                        <th>환전된금액(원화)</th>
                        <th>환전일</th>
                      </tr>
                    </thead>
                    <tbody>
                      <td>${account.currencycode}</td>
                      <td>${account.exchangeprice}</td>
                      <td>${account.exchangerate}</td>
                      <td>${account.exchangecharge}</td>
                      <td>${account.reg_date}</td>
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
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
<%--     
    <header class="section_title mb-50 major">
      <h5>환전내역</h5>   
    </header>
    
    <div class="table-wrapper">
    <table border="1" class="table table-bordered">
        <thead>
          <tr>
            <th>통화명</th>
            <th>보유금액(외화 기준)</th>
            <th>우대적용 환율</th>
            <th>환전금액(원)</th>
            <th>수령인</th>
            <th>수령일</th>
            <th>수령지점</th>
            <th>환전일</th>
          </tr>
        </thead>
      <c:forEach items="${exchangeList}" var="exchange" varStatus="loop">
        <tbody>
          <tr>
            <td>${exchange.currencycode}</td>
            <td>${exchange.exchangeprice}</td>
            <td>${exchange.exchangerate}</td>
            <td>${exchange.exchangecharge}</td>
            <td>${exchange.name}</td>
            <td>${exchange.exchange_date}</td>
            <td>${exchange.exchange_place}</td>
            <td>${exchange.reg_date}</td>
          </tr>
        </tbody>
      </c:forEach>
    </table>
    </div>
    
    
    
    
    <br><br><br>
    <header class="section_title mb-50 major">
      <h5>환전예약내역</h5>   
    </header>
    
    <div class="table-wrapper">
    <table border="1" class="table table-bordered">
        <thead>
          <tr>
            <th>통화명</th>
            <th>환전예정금액(외화 기준)</th>
            <th>우대적용 환율</th>
            <th>환전금액(원)</th>
            <th>환전여부</th>
            <th>최대환전일</th>
            <th>예약일</th>
            <th>출금예정계좌번호</th>
          </tr>
        </thead>
      <c:forEach items="${reserveList}" var="reserve" varStatus="loop">
        <tbody>
          <tr>
            <td>${reserve.currencycode}</td>
            <td>${reserve.exchangeprice}</td>
            <td>${reserve.exchangerate}</td>
            <td>${reserve.exchangecharge}</td>
            <td>${reserve.isexchange}</td>
            <td>${reserve.max_date}</td>
            <td>${reserve.reg_date}</td>
            <td>${reserve.account_num}</td>

          </tr>
        </tbody>
        </c:forEach>
    </table>
    </div> --%>
    
    
    
    


  </div>

</section><br><br><br><br><br>
<!-- 수정할부분 끝 -->




<%@ include file="/WEB-INF/jsp/include/foot.jsp"%>