<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/jsp/include/head.jsp"%>

<style>
.aaa{
  width: 80%;
  align-content: center;
  margin-left: 10%;
  margin-right: 20%:
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
    
    
    
    
    
    <!-- 오늘현황 시작 -->
    <div class="aaa">
      <div class="counter_area counter_bg_1 overlay_03">
        <div class="container">
          <div class="row">
            <div class="col-xl-3 col-lg-3 col-md-3">
              <div class="single_counter text-center">
                <div class="counter_icon">
                  <img src="${pageContext.request.contextPath }/resources/img/svg_icon/group.svg" alt="">
                </div>
                <h3>
                  <span class="counter">200</span> <span> +</span>
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
                  <span class="counter">97</span> <span>%</span>
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
                  <span class="counter">5628</span>
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
                  <span class="counter">5637</span>
                </h3>
                <p>Business Done</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- 오늘현황 끝 -->
    
    
    
    
    
    
    <!-- 1주일현황 시작 -->
    <!-- 1주일현황 끝 -->
    
    
    
    
    
  </div>
</section>
<br><br><br><br><br>
<!-- 수정할부분 끝 -->




<%@ include file="/WEB-INF/jsp/include/foot.jsp"%>


