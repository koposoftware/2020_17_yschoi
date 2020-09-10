<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>



<%@ include file="/WEB-INF/jsp/include/head.jsp"%>


<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">




<!-- 수정할부분 시작 -->
<section>
  <div class="container class="col-xl-12"">
    
    
    <div class="row">
      <div class="col-xl-12">
        <!-- <div class="section_title text-center mb-50"> -->
        <header class="section_title mb-50 major">
          <h3>수수료 조정</h3>
        </header>
      </div>
    </div>
    
        <table class="table table-bordered table-striped table-condensed">
        <thead>
          <tr>
            <th class="leftNone" scope="col" rowspan="3">통화</th>
            <th class="leftLine" scope="col" colspan="4">현찰</th>
            <th class="leftLine" scope="col" colspan="2">송금</th>
            <th class="leftLine" scope="col" rowspan="3">T/C<br>사실때
            </th>
            <th class="leftLine" scope="col" rowspan="3">외화<br>수표<br>파실때
            </th>
            <th class="leftLine" scope="col" rowspan="3">매매<br>기준율
            </th>
            <th class="leftLine" scope="col" rowspan="3">환가<br>료율
            </th>
            <th class="leftLine" scope="col" rowspan="3">미화<br>환산율
            </th>
          </tr>
          <tr>
            <th class="leftLine" scope="col" colspan="2">사실 때</th>
            <th class="leftLine" scope="col" colspan="2">파실 때</th>
            <th class="leftLine" scope="col" rowspan="2">보낼 때</th>
            <th class="leftLine" scope="col" rowspan="2">받을 때</th>
          </tr>
          <tr>
            <th class="leftLine" scope="col">환율</th>
            <th class="leftLine" scope="col">Spread</th>
            <th class="leftLine" scope="col">환율</th>
            <th class="leftLine" scope="col">Spread</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach items="${ currencyList }" var="cur">
            <tr>
              <td>${cur.currency}</td>
              <td>${cur.cashbuyrate}</td>
              <td>${cur.cashbuyspread}</td>
              <td>${cur.cashsellrate}</td>
              <td>${cur.cashsellspread}</td>
              <td>${cur.remittance}</td>
              <td>${cur.receive}</td>
              <td>${cur.tcbuy}</td>
              <td>${cur.fcsell}</td>
              <td>${cur.basicrate}</td>
              <td>${cur.conversion}</td>
              <td>${cur.usdrate}</td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    
    
    
    
    
    
    
    
    
    
    
    
    
  </div>
</section><br><br><br><br><br>
<!-- 수정할부분 끝 -->




<%@ include file="/WEB-INF/jsp/include/foot.jsp"%>


