<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>

<%-- <%@ include file="head.jsp"%> --%>
<jsp:include page="/WEB-INF/jsp/include/head.jsp" /> 



<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script>
$(document).ready(function() {
    // 이미지 슬라이드 컨트롤를 사용하기 위해서는 carousel를 실행해야한다.
    $('#carousel-example-generic').carousel({

    // 슬리아딩 자동 순환 지연 시간
    // false면 자동 순환하지 않는다.
    interval : 1,
    // hover를 설정하면 마우스를 가져대면 자동 순환이 멈춘다.
    pause : 'hover',
    // 순환 설정, true면 1 -> 2가면 다시 1로 돌아가서 반복
    wrap : true,
    // 키보드 이벤트 설정 여부(?)
    keyboard : true
    });
  });
  
$(document).ready(function(){
  var str = "${nameList}";  //자바스크립트에서 파라미터(모델클래스 객체) 접근하기
  console.log(str);
  
  
  
  
  
});
  
</script>
<style>
.haha{
  margin: 0 0 0.6em 0 !important;
}
</style>








    <!-- service_area_start -->
    <div class="service_area">
        <div class="container">
          <div class="row">
          
            <div class="col-xl-12 haha">
              <header class="section_title mb-50 major haha">
                <h3 class="haha">NOTICE</h3>
              </header>
            </div>
          
          
          
            <!-- 공지에 대한 이미지 슬라이드 -->
            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
              <!-- Indicators -->
              <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <c:forEach items="${nameList}" var="name" varStatus="loop">
                  <li data-target="#carousel-example-generic" data-slide-to="${loop.count }"></li>
                </c:forEach>
              </ol>
              <!-- Wrapper for slides -->
              <div class="carousel-inner" role="listbox" style="width: 100%;">
                <div class="item active">
                  <img src="/mainmain.png" alt="..." width="1920px">
                  <div class="carousel-caption">...</div>
                </div>
                <c:forEach items="${nameList}" var="name" varStatus="loop">
                  <div class="item">
                    <img src="/${name.fileSaveName}" alt="NOTICE 사진" width="100%" >
                    <div class="carousel-caption"><%-- ${name.fileSaveName} --%></div>
                  </div>
                </c:forEach>
              </div>
              <!-- Controls -->
              <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev"> <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span class="sr-only">Previous</span>
              </a> <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> <span class="sr-only">Next</span>
              </a>
            </div>
            
            
            
            
            
          </div>
          
          
          
          
          
          
          <%-- <div class="row">
                <div class="col-xl-12">
                    <div class="section_title text-center mb-50">
                        <h3>What we Do 바꾼자리   index.jspPPPPPPPPP  ${a } </h3>
                    </div>
                </div>
          </div> --%>
            <!-- <div class="row">
                <div class="col-xl-4 col-md-6 col-lg-4">
                    <div class="single_service text-center">
                        <div class="service_icon">
                            <img src="resources/img/svg_icon/1.svg" alt="">
                        </div>
                        <h3>Marketing & SEO Agency</h3>
                        <p>Esteem spirit temper too say adieus who direct esteem.</p>
                        <a href="#" class="learn_more">Learn More</a>
                    </div>
                </div>
                <div class="col-xl-4 col-md-6 col-lg-4">
                    <div class="single_service text-center">
                        <div class="service_icon">
                            <img src="resources/img/svg_icon/2.svg" alt="">
                        </div>
                        <h3>Startup Agency</h3>
                        <p>Esteem spirit temper too say adieus who direct esteem.</p>
                        <a href="#" class="learn_more">Learn More</a>
                    </div>
                </div>
                <div class="col-xl-4 col-md-6 col-lg-4">
                    <div class="single_service text-center">
                        <div class="service_icon">
                            <img src="resources/img/svg_icon/3.svg" alt="">
                        </div>
                        <h3>Corporate Business</h3>
                        <p>Esteem spirit temper too say adieus who direct esteem.</p>
                        <a href="#" class="learn_more">Learn More</a>
                    </div>
                </div>
                <div class="col-xl-4 col-md-6 col-lg-4">
                    <div class="single_service text-center">
                        <div class="service_icon">
                            <img src="resources/img/svg_icon/4.svg" alt="">
                        </div>
                        <h3>Finance Solution</h3>
                        <p>Esteem spirit temper too say adieus who direct esteem.</p>
                        <a href="#" class="learn_more">Learn More</a>
                    </div>
                </div>
                <div class="col-xl-4 col-md-6 col-lg-4">
                    <div class="single_service text-center">
                        <div class="service_icon">
                            <img src="resources/img/svg_icon/5.svg" alt="">
                        </div>
                        <h3>Food & Restaurant</h3>
                        <p>Esteem spirit temper too say adieus who direct esteem.</p>
                        <a href="#" class="learn_more">Learn More</a>
                    </div>
                </div>
                <div class="col-xl-4 col-md-6 col-lg-4">
                    <div class="single_service text-center">
                        <div class="service_icon">
                            <img src="resources/img/svg_icon/6.svg" alt="">
                        </div>
                        <h3>Travel Agency </h3>
                        <p>Esteem spirit temper too say adieus who direct esteem.</p>
                        <a href="#" class="learn_more">Learn More</a>
                    </div>
                </div>
            </div> -->
        </div>
    </div>
    <!-- service_area_end -->

    <!-- about_info_area start  -->
    <!-- <div class="about_info_area">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-xl-6 col-lg-6">
                    <div class="about_text">
                        <h3>Why our Consulting?</h3>
                        <p>Esteem spirit temper too say adieus who direct esteem.
                            It esteems luckily or picture placing drawing. Apartments frequently or motionless on reasonable.</p>
                            <a href="#" class="boxed-btn3">About Us</a>
                    </div>
                </div>
                <div class="col-xl-6 col-lg-6">
                    <div class="about_thumb">
                        <img src="resources/img/service/about.png" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div> -->
    <!-- /about_info_area end  -->

    <!-- counter_area  -->
    <!-- <div class="counter_area counter_bg_1 overlay_03">
        <div class="container">
            <div class="row">
                <div class="col-xl-3 col-lg-3 col-md-3">
                    <div class="single_counter text-center">
                        <div class="counter_icon">
                            <img src="resources/img/svg_icon/group.svg" alt="">
                        </div>
                        <h3> <span class="counter">200</span> <span> +</span> </h3>
                        <p>Team Members</p>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-3">
                    <div class="single_counter text-center">
                        <div class="counter_icon">
                            <img src="resources/img/svg_icon/cart.svg" alt="">
                        </div>
                        <h3> <span class="counter">97</span> <span>%</span> </h3>
                        <p>Business Success</p>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-3">
                    <div class="single_counter text-center">
                        <div class="counter_icon">
                            <img src="resources/img/svg_icon/heart.svg" alt="">
                        </div>
                        <h3> <span class="counter">5628</span></h3>
                        <p>Happy Client</p>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-3">
                    <div class="single_counter text-center">
                        <div class="counter_icon">
                            <img src="resources/img/svg_icon/respect.svg" alt="">
                        </div>
                        <h3> <span class="counter">5637</span> </h3>
                        <p>Business Done</p>
                    </div>
                </div>
            </div>
        </div>
    </div> -->
    <!-- /counter_area  -->

    <!-- case_study_area  -->
    <!-- <div class="case_study_area">
        <div class="container">
            <div class="border_bottom">
                    <div class="row">
                            <div class="col-xl-12">
                                <div class="section_title text-center mb-40">
                                    <h3>Case Study</h3>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="case_active owl-carousel">
                                        <div class="single_case">
                                                <div class="case_thumb">
                                                        <img src="resources/img/case/1.png" alt="">
                                                    </div>
                                            <div class="case_heading">
                                                    <span>Finance Solution</span>
                                                    <h3><a href="#">Consumer Products Consulting</a></h3>
                                            </div>
                                        </div>
                                        <div class="single_case">
                                                <div class="case_thumb">
                                                        <img src="resources/img/case/2.png" alt="">
                                                    </div>
                                            <div class="case_heading">
                                                    <span>Finance Solution</span>
                                                    <h3><a href="#">Consumer Products Consulting</a></h3>
                                            </div>
                                        </div>
                                        <div class="single_case">
                                                <div class="case_thumb">
                                                        <img src="resources/img/case/3.png" alt="">
                                                    </div>
                                            <div class="case_heading">
                                                    <span>Finance Solution</span>
                                                    <h3><a href="#">Consumer Products Consulting</a></h3>
                                            </div>
                                        </div>
                                        <div class="single_case">
                                                <div class="case_thumb">
                                                        <img src="resources/img/case/1.png" alt="">
                                                    </div>
                                            <div class="case_heading">
                                                    <span>Finance Solution</span>
                                                    <h3><a href="#">Consumer Products Consulting</a></h3>
                                            </div>
                                        </div>
                                </div>
                                
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="more_close_btn text-center">
                                    <a href="#" class="boxed-btn3-line">More Cases</a>
                                </div>
                            </div>
                        </div>
            </div>
        </div>
    </div> -->
    <!-- /case_study_area  -->

    <!-- accordion  -->
    <!-- <div class="accordion_area">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-xl-6 col-lg-6">
                        <div class="accordion_thumb">
                            <img src="resources/img/banner/accordion.png" alt="">
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-6">
                        <div class="faq_ask">
                            <h3>Frequently ask</h3>
                                <div id="accordion">
                                        <div class="card">
                                            <div class="card-header" id="headingTwo">
                                                <h5 class="mb-0">
                                                    <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                                            Adieus who direct esteem <span>It esteems luckily?</span>
                                                    </button>
                                                </h5>
                                            </div>
                                            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion" style="">
                                                <div class="card-body">Esteem spirit temper too say adieus who direct esteem esteems luckily or picture placing drawing.
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card">
                                            <div class="card-header" id="headingOne">
                                                <h5 class="mb-0">
                                                    <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                                                            Who direct esteem It esteems?
                                                    </button>
                                                </h5>
                                            </div>
                                            <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordion" style="">
                                                <div class="card-body">Esteem spirit temper too say adieus who direct esteem esteems luckily or picture placing drawing.
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card">
                                            <div class="card-header" id="headingThree">
                                                <h5 class="mb-0">
                                                    <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                                            Duis consectetur feugiat auctor?
                                                    </button>
                                                </h5>
                                            </div>
                                            <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion" style="">
                                                <div class="card-body">Esteem spirit temper too say adieus who direct esteem esteems luckily or picture placing drawing.
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> -->
        <!-- accordion  -->

    <!-- <div class="testimonial_area overlay ">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="testmonial_active owl-carousel">
                        <div class="single_carousel">
                                <div class="single_testmonial text-center">
                                        <div class="quote">
                                            <img src="resources/img/svg_icon/quote.svg" alt="">
                                        </div>
                                        <p>Donec imperdiet congue orci consequat mattis. Donec rutrum porttitor <br> 
                                                sollicitudin. Pellentesque id dolor tempor sapien feugiat ultrices nec sed neque.  <br>
                                                Fusce ac mattis nulla. Morbi eget ornare dui. </p>
                                        <div class="testmonial_author">
                                            <div class="thumb">
                                                    <img src="resources/img/case/testmonial.png" alt="">
                                            </div>
                                            <h3>Robert Thomson</h3>
                                            <span>Business Owner</span>
                                        </div>
                                    </div>
                        </div>
                        <div class="single_carousel">
                                <div class="single_testmonial text-center">
                                        <div class="quote">
                                            <img src="resources/img/svg_icon/quote.svg" alt="">
                                        </div>
                                        <p>Donec imperdiet congue orci consequat mattis. Donec rutrum porttitor <br> 
                                                sollicitudin. Pellentesque id dolor tempor sapien feugiat ultrices nec sed neque.  <br>
                                                Fusce ac mattis nulla. Morbi eget ornare dui. </p>
                                        <div class="testmonial_author">
                                            <div class="thumb">
                                                    <img src="resources/img/case/testmonial.png" alt="">
                                            </div>
                                            <h3>Robert Thomson</h3>
                                            <span>Business Owner</span>
                                        </div>
                                    </div>
                        </div>
                        <div class="single_carousel">
                                <div class="single_testmonial text-center">
                                        <div class="quote">
                                            <img src="resources/img/svg_icon/quote.svg" alt="">
                                        </div>
                                        <p>Donec imperdiet congue orci consequat mattis. Donec rutrum porttitor <br> 
                                                sollicitudin. Pellentesque id dolor tempor sapien feugiat ultrices nec sed neque.  <br>
                                                Fusce ac mattis nulla. Morbi eget ornare dui. </p>
                                        <div class="testmonial_author">
                                            <div class="thumb">
                                                    <img src="resources/img/case/testmonial.png" alt="">
                                            </div>
                                            <h3>Robert Thomson</h3>
                                            <span>Business Owner</span>
                                        </div>
                                    </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> -->


    <!-- team_area  -->
    <!-- <div class="team_area">
            <div class="container">
                <div class="border_bottom">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="section_title mb-40 text-center">
                                <h3>
                                        Expert Team
                                </h3>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xl-4 col-lg-4 col-md-6">
                            <div class="single_team">
                                <div class="team_thumb">
                                    <img src="resources/img/team/3.png" alt="">
                                </div>
                                <div class="team_info text-center">
                                    <h3>Milani Mou</h3>
                                    <p>Photographer</p>
                                    <div class="social_link">
                                        <ul>
                                            <li><a href="#">
                                                    <i class="fa fa-facebook"></i>
                                                </a>
                                            </li>
                                            <li><a href="#">
                                                    <i class="fa fa-twitter"></i>
                                                </a>
                                            </li>
                                            <li><a href="#">
                                                    <i class="fa fa-instagram"></i>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-4 col-lg-4 col-md-6">
                            <div class="single_team">
                                <div class="team_thumb">
                                    <img src="resources/img/team/2.png" alt="">
                                </div>
                                <div class="team_info text-center">
                                    <h3>Jasmine Pinky</h3>
                                    <p>Photographer</p>
                                    <div class="social_link">
                                        <ul>
                                            <li><a href="#">
                                                    <i class="fa fa-facebook"></i>
                                                </a>
                                            </li>
                                            <li><a href="#">
                                                    <i class="fa fa-twitter"></i>
                                                </a>
                                            </li>
                                            <li><a href="#">
                                                    <i class="fa fa-instagram"></i>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-4 col-lg-4 col-md-6">
                            <div class="single_team">
                                <div class="team_thumb">
                                    <img src="resources/img/team/1.png" alt="">
                                </div>
                                <div class="team_info text-center">
                                    <h3>Piya Zosoldos</h3>
                                    <p>Photographer</p>
                                    <div class="social_link">
                                        <ul>
                                            <li><a href="#">
                                                    <i class="fa fa-facebook"></i>
                                                </a>
                                            </li>
                                            <li><a href="#">
                                                    <i class="fa fa-twitter"></i>
                                                </a>
                                            </li>
                                            <li><a href="#">
                                                    <i class="fa fa-instagram"></i>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> -->
    <!-- /team_area  -->

    <%-- <div class="contact_form_quote">
        <div class="container">
            <div class="row">
                <div class="col-xl-5 col-lg-6">
                    <div class="form_wrap">
                            <h3>Get Free Quote</h3>
                            <form action="#">
                                <input type="text" placeholder="Your Name" >
                                <input type="email" placeholder="Email" >
                                <textarea name="#" id="" cols="30" rows="10" placeholder="Message" ></textarea>
                                <button class="boxed-btn3">Send</button>
                            </form>
                    </div>
                </div>
                <div class="col-xl-6 offset-xl-1 col-lg-6">
                    <div class="contact_thumb">
                        <img src="resources/img/banner/contact_thumb.png" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div> --%>



    
    
<%-- <%@ include file="foot.jsp"%> --%>
<%@ include file="/WEB-INF/jsp/include/foot.jsp"%>