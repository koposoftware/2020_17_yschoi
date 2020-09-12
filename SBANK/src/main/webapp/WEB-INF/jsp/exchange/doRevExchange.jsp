<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%-- <jsp:include page="/head.jsp" />  --%>
<%@ include file="/WEB-INF/jsp/include/head.jsp"%>


<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script type="text/javascript">











function keyevent() {

  var exchangeCharge = document.getElementById("exchangeprice").value; //환전금액(외화)
  var commrate = document.getElementById("commrate").innerHTML; //우대적용환율

  //alert(exchangeCharge)
  //alert(commrate)

  exchangeChargeKRW = exchangeCharge * commrate
  exchangeChargeKRW = exchangeChargeKRW.toFixed(2)

  document.getElementById("exchangeChargeKRW").innerHTML = exchangeChargeKRW; //환전금액(원) 값 띄어주기

  var commrate = document.getElementById("commrate").innerHTML;

  /* alert(typeof(commrate));
  alert(typeof(exchangeChargeKRW)); */

  document.getElementById('exchangerate').value = commrate; // hidden필드에 값 넣어주기
  document.getElementById('exchangecharge').value = exchangeChargeKRW; // hidden필드에 값 넣어주기

  exchangeChargeKRW = "";
  commrate = "";

}


$(document).ready(function() {
  $("#modal_show").click(function() {
    $("#exampleModal").modal("show");
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




$(document).ready(function() {
  $('#currencycode').change(function() {
    
    
    let currency = $(this).val(); // 통화코드추출
    //alert(currency)
    
    $.ajax({
      url : '${ pageContext.request.contextPath }/exchange/getRateCommission/'+currency,
      type : 'get',
      success : function(data) {
        let list = JSON.parse(data);
        console.log(list)
        
        let rate =list.cashsellrate; /* 송금받을때 */
        let basicrate=list.basicrate; /* 매매기준율 */
        let commission = list.commission;
        let commrate = basicrate - ((rate-basicrate)*commission); //실제로 적용될 환율임
        
        $("#rate").text((list.cashsellrate).toFixed(2));
        $("#commrate").text(commrate.toFixed(2));
        $("#commission").text(list.commission2);
        
        /* document.getElementById('rateHidden').value = list.commission2; */
        
        rate="";
        basicrate="";
        commission="";
        commrate=""; 
      }, 
      error : function() {
        alert('실패')
      }, complete : function() {
              /* 뭘해줘야할까 */
      }
    })
    
    
    
    
    
    
    
    
    
  });
  


});





/* $(document).ready(function() {
  $('#account_num_from').change(function() {
    
    let realpwd = $("#account_num_from > option:selected").attr('id'); // 선택된 옵션의 id의 값을 가져오기
    $("input[type=hidden][name=pwd]").val(realpwd); // hidden에 방금 선택한 계좌의 비밀번호 값 저장
    


  });
}); */





$(document).ready(function() {
  var list='';
  
  
  
  
  
  $(document).on("keyup","#user_code",function(){  // 구글 OTP인증코드 적으면 함수
    var ipt = $(this).val()
    console.log(ipt);
    var keyofgoogle = list[0]
    
    if(ipt.length == 6){
      console.log('6');
      console.log(keyofgoogle);
      
      $.ajax({
        url : '${ pageContext.request.contextPath }/otp/chkk',
        type : 'post',
        data : {
          encodedKey : keyofgoogle,
          user_code : ipt
        },
        async:false,
        success : function(data) {
          result = JSON.parse(data);
          console.log(result);
          
          if(result=='true'){
            $("input[type=submit]").prop('disabled',false);
          } else{
            $("#setresult").text('인증코드를 확인하여주세요')
          }

          return false;
        }, 
        error : function() {
          alert('실패')
        }
      });
      
      
      
    }
    
  });// 구글 OTP인증코드 적으면 함수 끝

  
  
  
  
  
  
  
  
  
  
  
  
  
  $(document).on('click', '#subm', function() {  //모달에서 확인버튼 누르면 함수
    
    let iptval = $('#exchangeprice').val();  // 사용자가 입력할 재환전 할 금액
    let ownval = $("#currencycode > option:selected").attr('id'); // 사용자가 선택한 외화의 잔액
    iptval = iptval * 1;
    ownval = ownval * 1;
    /* alert(typeof(iptval))
    alert(typeof(ownval))  */
    
    if(iptval>ownval){
      $(".modal-title").append("재환전하기");
      $(".modal-body").append('선택하신 외화의 잔액을 확인해주세요. 외화가 부족합니다.');
      $("input[type=submit]").prop('disabled',true);
      $("#exampleModal").modal("show");
      return false;
    }
    
    //금액에는 문제없음. 비밀번호 확인하지
    let realpwd = $("#account_num_from > option:selected").attr('id'); //실제 계좌의 비번
    let iptpwd = $("#reg_date").val(); //사용자가 입력한 해싱 전의 계좌번호
    /* alert(realpwd)
    alert(iptpwd) */
    var afterHashIpt='';
    
    $.ajax({
      url : '${ pageContext.request.contextPath }/exchange/returnHash/'+iptpwd,
      type : 'get',
      async:false,
      success : function(data) {
        var list = JSON.parse(data);
        afterHashIpt=list;
        /* alert(typeof(list)) */
      }, 
      error : function() {
        alert('실패')
      
        return false;
      }
    });
    
    
    /* alert(afterHashIpt) */
    if(afterHashIpt == realpwd){
      
      var strr='';
      
      $.ajax({
        url : '${ pageContext.request.contextPath }/otp/genn',
        type : 'get',
        async:false,
        success : function(data) {
          list = JSON.parse(data);
          console.log(list);
          return false;
        }, 
        error : function() {
          alert('실패')
        }
      });
      console.log(list[0]);
      console.log(list[1]);
      console.log(list[2]);
      
      strr+='재환전을 원하시면 Google OTP로 본인인증을 진행하여주세요.<br><br>';
      strr+='인증키는 ';
      strr+=list[0];
      strr+='입니다.<br>';
      strr+='<a href="';
      strr+=list[1];
      strr+='" target="_blank"> QR코드확인하기 </a> 입니다.<br>';
      /* strr+='<img src="${pageContext.request.contextPath }/resources/upload/';
      strr+=list[2];
      strr+='"><br>'; */
      <%-- strr+='<form action="<%=request.getContextPath() %>/otp/chkk" method="post">'; --%>
      strr+='  code : <input  name="user_code" id="user_code"  type="text" ">';
      strr+='  <input name="encodedKey" type="hidden" readonly="readonly" value="'+list[0]+'"><br><br>';
      strr+='  <span id="setresult" name="setresult" ></span<br><br>';
      /* strr+='  <input type="submit" value="전송!">'; */
      /* strr+='</form>'; */
      
      $(".modal-title").append("재환전하기");
      $(".modal-body").append(strr);
      /* $("input[type=submit]").prop('disabled',false); */
      let aa =$("#exampleModal").modal("show");
      return false;
      if(aa){
        return true;
      }
    } else{
      $(".modal-title").append("재환전하기");
      $(".modal-body").append('선택하신 계좌(외화가 출금 될)의 비밀번호를 확인해주세요.');
      $("input[type=submit]").prop('disabled',true);
      $("#exampleModal").modal("show");
      return false;
    }
    
    
    
    return false;
    
  })// 구글 OTP인증코드 적으면 함수 끝
  
});




</script>


<!-- 수정할부분 시작 -->
<section>
  <div class="container class="col-xl-12"">
    <form method="post" action="${pageContext.request.contextPath }/exchange/doRevExchange">
      <div class="row">
        <div class="col-xl-12">
          <!-- <div class="section_title text-center mb-50"> -->
          <header class="section_title mb-50 major">
            <h3>재환전하기</h3>
          </header>
        </div>
      </div>
      <header class="section_title mb-50 major">
        <h5>환전신청내역</h5>
      </header>
      <div class="table-wrapper">
        <table border="1" class="table table-bordered">
          <tr>
            <th>통화종류</th>
            <td><select name="currencycode" id="currencycode" onchange="chageCurrencySelect()" class="form-control" aria-describedby="inputGroupSuccess1Status">
                <option value="a" selected disabled>- 재환전 할 통화를 선택하세요 -</option>
                <c:forEach items="${curlist}" var="account" varStatus="loop">
                  <option value="${account.currencycode}" id="${account.balance}">통화 : ${account.currencycode}, 잔액 : ${account.balance}</option>
                </c:forEach>
            </select></td>
          </tr>
          <tr>
            <th>환전금액(외화)</th>
            <td><input type="text" id="exchangeprice" name="exchangeprice" onkeyup="keyevent(this);" class="form-control" aria-describedby="inputGroupSuccess1Status" /></td>
          </tr>
          <tr>
            <th>현재 고시환율(원)</th>
            <td>
              <span id="rate" name="rate"></span> 
              <!-- <input type="hidden" id="rateHidden" name="rateHidden" value=""> -->
            </td>
          </tr>
          <tr>
            <th>우대 적용환율(원)</th>
            <td>
              <span id="commrate" name="commrate"></span> 
              <input type="hidden" id="exchangerate" name="exchangerate" value="">
            </td>
          </tr>
          <tr>
            <th>우대율(%)</th>
            <td><span id="commission" name="commission"></span></td>
          </tr>
          <tr>
            <th>환전금액(원)</th>
            <td>
              <span id="exchangeChargeKRW" name="exchangeChargeKRW"></span> 
              <input type="hidden" id="exchangecharge" name="exchangecharge" value="" />
            </td>
          </tr>
        </table>
      </div>
      <br> <br> <br>
      <header class="section_title mb-50 major">
        <h5>출금정보</h5>
      </header>
      <div class="table-wrapper">
        <table border="1" class="table table-bordered">
          <tr>
            <th>출금계좌번호</th>
            <td>
              <select name="account_num_from" id="account_num_from" class="form-control" aria-describedby="inputGroupSuccess1Status">
                <option value="a" selected disabled>- 외화 출금 할 계좌를 선택하세요 -</option>
                <c:forEach items="${accountCurList}" var="account" varStatus="loop">
                  <option value="${account.account_num}" id="${account.bank_name}">외화계좌번호 : ${account.account_num}</option>
                </c:forEach>
            </select>
            </td>
          </tr>
          <tr>
            <th>계좌비밀번호</th>
            <td>
              <input type="password" id="reg_date" name="reg_date" class="form-control" aria-describedby="inputGroupSuccess1Status" placeholder="출금 계좌의 비밀번호를 입력하세요" /> 
              <!-- <input type="hidden" id="pwd" name="pwd"> -->
            </td>
          </tr>
        </table>
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
                <input type="submit" class="btn btn-success btn-md" value="확인" disabled="disabled">
              </div>
            </div>
          </div>
        </div>
      </div>
      <br> <br> <br>
      <header class="section_title mb-50 major">
        <h5>입금정보</h5>
      </header>
      <div class="table-wrapper">
        <table border="1" class="table table-bordered">
          <tr>
            <th>입금계좌번호</th>
            <td>
            <select name="account_num_to" id="account_num_to" class="form-control" aria-describedby="inputGroupSuccess1Status">
                <option value="a" selected disabled>- 입금 계좌를 선택하세요 -</option>
                <c:forEach items="${accountList}" var="account" varStatus="loop">
                  <option value="${account.account_num}">계좌번호 : ${account.account_num}, 잔액 : ${account.balance}</option>
                </c:forEach>
            </select>
            </td>
          </tr>
        </table>
        <button class="btn btn-outline-dark" id="subm" name="subm" data-toggle="modal" data-target="#myModal">환전하기</button>
      </div>
    </form>
  </div>
</section>
<br><br><br><br><br>
<!-- 수정할부분 끝 -->















<%-- <%@ include file="/foot.jsp"%> --%>
<%@ include file="/WEB-INF/jsp/include/foot.jsp"%>