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
          <h3>환전 & 예약 내역 보기</h3>
        </header>
      </div>
    </div>
    
    
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
    </div>
    
    
    
    


  </div>

</section><br><br><br><br><br>
<!-- 수정할부분 끝 -->




<%@ include file="/WEB-INF/jsp/include/foot.jsp"%>