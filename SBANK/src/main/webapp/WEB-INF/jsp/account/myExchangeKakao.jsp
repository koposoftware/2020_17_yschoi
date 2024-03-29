<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>



<%@ include file="/WEB-INF/jsp/include/head.jsp"%>

<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- 여기아래는 툴팁관련 -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script>

$(function () {
  $('[data-toggle="tooltip"]').tooltip()
}) // 툴팁관련!


$(document).ready(function() {
  
  var CurAccount_num ='';
  $.ajax({
    url : '${ pageContext.request.contextPath }/exchange/getCurAccount_num',
    type : 'get',
    success : function(data) {
      let list = JSON.parse(data);
      console.log(data)
      
      
      CurAccount_num=list;
      
/*       if (CurAccount_num.length >3) {
        console.log(data)
        CurAccount_num=data;
      } else{
        $("select option[value*='own']").prop('disabled',true);
        $("#alarm").html("&nbsp;&nbsp;&nbsp;(외화계좌 미보유자는 개인소유가 불가능합니다.)");
      } */
      


    }, 
    error : function() {
      alert('실패')
    }, complete : function() {
            /* 뭘해줘야할까 */
    }
  })
  

  
  $(document).on("click",".modal_show",function(){

    var no =$(this).val();
    var currency = $(this).attr('name');
    var exchangeprice = $(this).attr('id');
    /* alert(currency); */
    $(".modal-title").append("수령정보 수정하기");
    var str = '<input type="hidden" id="exchangeNo" name="exchangeNo" value="'+no+'" >';
    str += '<input type="hidden" id="currencycode" name="currencycode" value="'+currency+'" >';
    str += '<input type="hidden" id="reg_date" name="reg_date" value="'+CurAccount_num+'" >';
    str += '<input type="hidden" id="exchangeprice" name="exchangeprice" value="'+exchangeprice+'" >';
    str += '수령인<br>';
    str += '<input type="text" id="name" name="name" class="form-control" aria-describedby="inputGroupSuccess1Status" ><br><br>' ;
    str += '수령일<br>'
    str += '<input type="date" id="exchange_date" name="exchange_date" class="form-control" aria-describedby="inputGroupSuccess1Status" max="2020-12-23" ><br><br>' ;
    str += '수령지점<br>'
    str += '<select name="exchange_place" id="exchange_place"  onchange="categoryChange(this)" class="form-control" aria-describedby="inputGroupSuccess1Status"  >';
    str += '  <option value="a" selected disabled  >- 수령지점을 선택하세요 -</option> ';
    str += '  <option value="인천국제공항">인천국제공항</option>';
    str += '  <option value="김포공항">김포공항</option>';
    str += '  <option value="김해공항">김해공항</option>';
    str += '  <option value="제주공항">제주공항</option>';
    str += '  <option value="서울역점">서울역점</option>';
    str += '</select>';
    $(".modal-body").append(str);
    $("#exampleModal").modal("show");
    if (CurAccount_num.length >3){
      $("select option[value*='own']").prop('disabled',false);
    }
  });

  $("#close_submit").click(function() {
    $("#exampleModal").modal("hide");
    $(".modal-title").empty();
    $(".modal-body").empty();
  });
  
  
  $("#close_cancel").click(function() {
    $("#exampleModal").modal("hide");
    $(".modal-title").empty();
    $(".modal-body").empty();
  });
  
  
  
});
  
  
function numberWithCommas(x) {
  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

$(document).ready(function() {  //환전내역 숫자는 콤마 넣자 시작 
  
  
  var exchangeResult = new Array();
  let budget = "${exchangeList}";
  //console.log(budget);
  
  <c:forEach items="${exchangeList}" var="exchange">
    var json = new Object();
    json.exchangeNo="${exchange.exchangeNo}"
    json.exchangeprice=numberWithCommas("${exchange.exchangeprice}")
    exchangeResult.push(json)
  </c:forEach>

  //console.log(reserveResult);
  
  $.each(exchangeResult, function() {
    
    var price = '#excPrice';

     
     price += $(this)[0].exchangeNo

     
     
    $(price).text($(this)[0].exchangeprice)

  });  
}) //환전내역 숫자는 콤마 넣자 끝 

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
          <h3>환전 내역 보기</h3>
        </header>
      </div>
    </div>
    
    
    
    
        <div class="container">
      <div class="row">
        <div class="col-md-12">
          <nav>
            <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
              <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">환전내역</a> 
            </div>
          </nav>
          <div class="tab-content" id="nav-tabContent">
          
            <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
            <br>
                  <table class="table table-bordered centerLine">
                  <thead>
                    <tr>
                      <th>환전일</th>
                      <th>통화명</th>
                      <th>외화금액</th>
                      <!-- <th>우대적용 환율</th>
                      <th>환전금액(원)</th> -->
                      <th>수령인</th>
                      <th>수령일</th>
                      <th>수령점</th>
                      <th>수령정보 수정</th>
                    </tr>
                  </thead>
                <c:forEach items="${exchangeList}" var="exchange" varStatus="loop">
                  <tbody>
                    <tr>
                      <td>${exchange.reg_date}</td>
                      <td>${exchange.currencycode}</td>
                      <td class="ali"><span id="excPrice${exchange.exchangeNo}"></span></td>
                      <%-- <td>${exchange.exchangerate}</td>
                      <td>${exchange.exchangecharge}</td> --%>
                      <td>${exchange.name}</td>
                      <td>${exchange.exchange_date}</td>
                      <td>${exchange.exchange_place}</td>
                      <td>
                      <c:choose>
                        <c:when test="${exchange.exchange_place != 'own'  }">
                          <button id="${exchange.exchangeprice}" value="${exchange.exchangeNo}" name="${exchange.currencycode}" 
                                class="modal_show btn btn-outline-dark">수령정보 수정</button>
                         </c:when>
                         <c:otherwise>
                                                            수정불가
                         </c:otherwise>
                      </c:choose>
                      </td>
                    </tr>
                  </tbody>
                </c:forEach>
              </table>
            </div>
            
            
            <!-- 모달창 시작 -->
            <form action="${pageContext.request.contextPath }/exchange/changeInfo2" method="post" id="formmm">
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"></h5>
                    <!-- 여기에 제목넣기 -->
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body"></div>
                  <!-- 여기에 내용 넣기 -->
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" id="close_cancel" onclick="return false">취소</button>
                    <input type="submit" class="btn btn-success btn-md" value="확인" >
                  </div>
                </div>
              </div>
            </div>
            </form>
            <!-- 모달창 끝 --> 
            
            
            

            
            
            
            
            
            

          </div>
        </div>
      </div>
    </div>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    
    
    
    


  </div>

</section><br><br><br><br><br>
<!-- 수정할부분 끝 -->




<%@ include file="/WEB-INF/jsp/include/foot.jsp"%>