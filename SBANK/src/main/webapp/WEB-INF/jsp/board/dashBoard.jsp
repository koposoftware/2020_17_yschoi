<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%@ include file="/WEB-INF/jsp/include/head.jsp"%>


<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>

<!-- 아래 2개는 탭관련 링크 -->
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<script>
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
  
  
  /* console.log(JSON.stringify(exchangeResult));
  console.log(JSON.stringify(reserveResult));
  console.log(JSON.stringify(revExchangeResult)); */
  
  
  
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
    labels: ['Value'],
    xLabels:'day',
    hideHover:'true'
  });
  
  
  new Morris.Line({
    // ID of the element in which to draw the chart.
    element: 'reserveCntSeven',
    // Chart data records -- each entry in this array corresponds to a point on
    // the chart.
    data: reserveResult,
    // The name of the data record attribute that contains x-values.
    xkey: 'reg_date',
    // A list of names of data record attributes that contain y-values.
    ykeys: ['value'],
    // Labels for the ykeys -- will be displayed when you hover over the
    // chart.
    labels: ['Value'],
    xLabels:'day',
    hideHover:'false'
  });
  
  
  new Morris.Line({
    // ID of the element in which to draw the chart.
    element: 'revExchangeCntSeven',
    // Chart data records -- each entry in this array corresponds to a point on
    // the chart.
    data: revExchangeResult,
    // The name of the data record attribute that contains x-values.
    xkey: 'reg_date',
    // A list of names of data record attributes that contain y-values.
    ykeys: ['value'],
    // Labels for the ykeys -- will be displayed when you hover over the
    // chart.
    labels: ['Value'],
    xLabels:'day',
    hideHover:'auto'
  });
  
  
  

  
  
  
  
  
  
});






</script>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.css">


<!-- 아래 1개는 탭 관련 -->
<!-- <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"> -->

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
.centerLine{
  text-align: center;
}
th {
  background-color: #f4f8f9;
  font-size: 15px !important;
  font-weight: 600 !important;
}
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
    
    <!-- <header class="section_title mb-50 major">
      <h5>오늘 현황</h5>   
    </header> -->
    
    
    
    
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <nav>
            <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
              <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">IP차단관리</a> 
              <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">오늘 하루 내역</a> 
              <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">최근 1주일 내역</a>
            </div>
          </nav>
          <div class="tab-content" id="nav-tabContent">
            <!-- 첫번째 탭 시작 -->
            <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
            <br>
              <table border="1" class="table table-bordered centerLine">
                <thead>
                  <tr>
                    <th>차단된IP주소</th>
                    <th>공격패턴</th>
                    <th>차단시각</th>
                    <th>차단해제여부</th>
                  </tr>
                </thead>
                <c:forEach items="${ControlList}" var="control" varStatus="loop">
                <tbody>
                  <tr>
                    <td>${control.ip}</td>
                    <td>${control.pattern}</td>
                    <td>${control.reg_date}</td>
                    <td>${control.is_lift}</td>
                  </tr>
                </tbody>
                </c:forEach>
              </table>
            <br>
            </div>
            <!-- 첫번째 탭 끝 -->
            
            
            
            
            <!-- 두번째 탭 시작 -->
            <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
            <br>
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
                            <%-- <span class="counter">${normalCntOne}</span> <span> +</span> <span class="counter">${kakaoCntOne}</span> --%>
                            <span>${currency}</span>
                          </h3>
                          <p>인기 외화</p>
                        </div>
                      </div>
                      <div class="col-xl-3 col-lg-3 col-md-3">
                        <div class="single_counter text-center">
                          <div class="counter_icon">
                            <img src="${pageContext.request.contextPath }/resources/img/svg_icon/cart.svg" alt="">
                          </div>
                          <h3>
                            <!-- <span class="counter"> --><span>${normalCntOne}</span> <span> +</span> <span>${kakaoCntOne}</span>
                          </h3>
                          <!-- <p>환전건수</p>  --><p>normal + kakao</p>
                        </div>
                      </div>
                      <div class="col-xl-3 col-lg-3 col-md-3">
                        <div class="single_counter text-center">
                          <div class="counter_icon">
                            <img src="${pageContext.request.contextPath }/resources/img/svg_icon/heart.svg" alt="">
                          </div>
                          <h3>
                            <!-- <span class="counter">5628</span> -->
                            <span>${exchangeCntOne }</span>
                          </h3>
                          <p>환전+재환전 건수</p>
                        </div>
                      </div>
                      <div class="col-xl-3 col-lg-3 col-md-3">
                        <div class="single_counter text-center">
                          <div class="counter_icon">
                            <img src="${pageContext.request.contextPath }/resources/img/svg_icon/respect.svg" alt="">
                          </div>
                          <h3>
                            <!-- <span class="counter">5637</span> -->
                            <span>${reserveCntOne }</span>
                          </h3>
                          <p>환전예약건수</p>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- 오늘현황 끝 -->
            </div>
            <!-- 두번째 탭 끝 -->
            
            
            
            
            
            <!-- 세번째 탭 시작 -->
            <!-- <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab"> tab-pane 있으면 그래프 이상함 -->
            <div class="fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
            <br>
                

            <br>
            <!-- <table>
              <tr>
                <td>1</td>
                <td><div id="exchangeCntSeven" style="height: 140px;" ></div></td>
              </tr>
              <tr>
                <td>2</td>
                <td><div id="reserveCntSeven" style="height: 140px;" ></div></td>
              </tr>
              <tr>
                <td>3</td>
                <td><div id="revExchangeCntSeven" style="height: 140px;"></div></td>
                
              </tr>
            </table> -->
            
                  <!-- 1주일현황 시작 -->
                    <header class="section_title mb-50 major">
                    <h5>환전 현황</h5>   
                  </header>
                  <div id="exchangeCntSeven" style="height: 200px;"></div><br><br><br><br>
                  
                  <header class="section_title mb-50 major">
                    <h5>목표 환전 예약 현황</h5>   
                  </header>
                  <div id="reserveCntSeven" style="height: 200px; width: 99%;"></div><br><br><br><br>
                  
                  <header class="section_title mb-50 major">
                    <h5>재환전 현황</h5>   
                  </header>
                  <div id="revExchangeCntSeven" style="height: 200px; width: 99%;"></div><br><br> 
                  <!-- 1주일현황 끝 -->
            <br>
            <br>
            </div>
            <!-- 세번째 탭 끝 -->
            
            
            
            
            
            
            
            
            
            
          </div>
        </div>
      </div>
    </div>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
        <br><br><br><br>
    
    <!-- 1주일현황 시작 -->
    
    
<!--     <header class="section_title mb-50 major">
      <h5>최근 1주일 환전 현황</h5>   
    </header>
    <div id="exchangeCntSeven" style="height: 180px;"></div><br><br>
    
    <header class="section_title mb-50 major">
      <h5>최근 1주일 목표 환전 예약 현황</h5>   
    </header>
    <div id="reserveCntSeven" style="height: 180px;"></div><br><br>
    
    <header class="section_title mb-50 major">
      <h5>최근 1주일 재환전 현황</h5>   
    </header>
    <div id="revExchangeCntSeven" style="height: 180px;"></div><br><br>  -->
    
    
    <!-- 1주일현황 끝 -->
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
 
    
    
    
    
    
  </div>
</section>
<br><br><br><br><br>
<!-- 수정할부분 끝 -->




<%@ include file="/WEB-INF/jsp/include/foot.jsp"%>

