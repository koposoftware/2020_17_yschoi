<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%@ include file="/WEB-INF/jsp/include/head.jsp"%>


<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
<script>
$(document).ready(function(){
  new Morris.Line({
    // ID of the element in which to draw the chart.
    element: 'myfirstchart',
    // Chart data records -- each entry in this array corresponds to a point on
    // the chart.
    data: [
      { year: '2008', value: 20 },
      { year: '2009', value: 10 },
      { year: '2010', value: 5 },
      { year: '2011', value: 5 },
      { year: '2012', value: 20 }
    ],
    // The name of the data record attribute that contains x-values.
    xkey: 'year',
    // A list of names of data record attributes that contain y-values.
    ykeys: ['value'],
    // Labels for the ykeys -- will be displayed when you hover over the
    // chart.
    labels: ['Value']
  });
});

/* $(function() { */
$(document).ready(function(){

  var exchangeResult = new Array();
  var reserveResult = new Array();
  var revExchangeResult = new Array();
  
  <c:forEach items="${exchangeCntSeven}" var="exchange">
    var json = new Object();
    json.reg_date="${exchange.reg_date}"
    json.value="${exchange.exchangeNo}"
    exchangeResult.push(json)
  </c:forEach>
  <c:forEach items="${reserveCntSeven}" var="exchange">
    var json = new Object();
    json.reg_date="${exchange.reg_date}"
    json.value="${exchange.reserveno}"
    reserveResult.push(json)
  </c:forEach>
  <c:forEach items="${revExchangeCntSeven}" var="exchange">
    var json = new Object();
    json.reg_date="${exchange.reg_date}"
    json.value="${exchange.exchangeNo}"
    revExchangeResult.push(json)
  </c:forEach>
  
  
  console.log(JSON.stringify(exchangeResult));
  console.log(JSON.stringify(reserveResult));
  console.log(JSON.stringify(revExchangeResult));
  
  
  
  new Morris.Line({
    // ID of the element in which to draw the chart.
    element: 'exchangeCntSeven',
    // Chart data records -- each entry in this array corresponds to a point on
    // the chart.
    data: exchangeResult,
    // The name of the data record attribute that contains x-values.
    xkey: 'reg_date',
    // A list of names of data record attributes that contain y-values.
    ykeys: ['value'],
    // Labels for the ykeys -- will be displayed when you hover over the
    // chart.
    labels: ['Value']
  });
  
  
  

  
  
  
  
  
  
});
</script>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">
<style>

</style>




<!-- 수정할부분 시작 -->
<section>
  <div class="container class="col-xl-12">
    <div class="row">
      <div class="col-xl-12">
        <!-- <div class="section_title text-center mb-50"> -->
        <header class="section_title mb-50 major">
          <h3>dashBoard</h3>
        </header>
      </div>
    </div>
    
    
    
    <!-- 1주일현황 시작 -->
    <div id="myfirstchart" style="height: 250px;"></div>
    <div id="exchangeCntSeven" style="height: 250px;"></div>
    <div id="reserveCntSeven" style="height: 250px;"></div>
    <div id="revExchangeCntSeven" style="height: 250px;"></div>
    <!-- 1주일현황 끝 -->
    <br><br><br><br><br>
    
    
    
    
    
    <!-- 오늘현황 시작 -->
    
      <div class="counter_area counter_bg_1 overlay_03">
        <div class="container">
          <div class="row">
            <div class="col-xl-3 col-lg-3 col-md-3">
              <div class="single_counter text-center">
                <div class="counter_icon">
                  <img src="${pageContext.request.contextPath }/resources/img/svg_icon/group.svg" alt="">
                </div>
                <h3>
                  <!-- <span class="counter">200</span> <span> +</span> -->
                  <span class="counter">${exchangeCntOne}</span> <span> +</span>
                </h3>
                <p>Team Members</p>
              </div>
            </div>
            <div class="col-xl-3 col-lg-3 col-md-3">
              <div class="single_counter text-center">
                <div class="counter_icon">
                  <img src="${pageContext.request.contextPath }/resources/img/svg_icon/cart.svg" alt="">
                </div>
                <h3>
                  <!-- <span class="counter">97</span> <span>%</span> -->
                  <span class="counter">${reserveCntOne }</span> <span>%</span>
                </h3>
                <p>Business Success</p>
              </div>
            </div>
            <div class="col-xl-3 col-lg-3 col-md-3">
              <div class="single_counter text-center">
                <div class="counter_icon">
                  <img src="${pageContext.request.contextPath }/resources/img/svg_icon/heart.svg" alt="">
                </div>
                <h3>
                  <!-- <span class="counter">5628</span> -->
                  <span class="counter">${revExchangeCntOne }</span>
                </h3>
                <p>Happy Client</p>
              </div>
            </div>
            <div class="col-xl-3 col-lg-3 col-md-3">
              <div class="single_counter text-center">
                <div class="counter_icon">
                  <img src="${pageContext.request.contextPath }/resources/img/svg_icon/respect.svg" alt="">
                </div>
                <h3>
                  <!-- <span class="counter">5637</span> -->
                  <span class="counter">56</span>
                </h3>
                <p>Business Done</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    
    <!-- 오늘현황 끝 -->
    
    
    <br><br><br><br><br>
    
    
    
   
    
    
    
    
    
  </div>
</section>
<br><br><br><br><br>
<!-- 수정할부분 끝 -->




<%@ include file="/WEB-INF/jsp/include/foot.jsp"%>


