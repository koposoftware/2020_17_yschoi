<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>



<%@ include file="/WEB-INF/jsp/include/head.jsp"%>

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
/* function chageCurrencySelect(){
  var currencySelect = document.getElementById("currency");
  
  // select element에서 선택된 option의 value가 저장된다. 
  var currencyCode = currencySelect.options[currencySelect.selectedIndex].value; 
  alert(currencyCode)
 } */
 
$(document).ready(function() {
  

  
  $('#currencycode').change(function() {   //통화를 선택하면에 대한 function 시작
    let currency = $(this).val(); // 통화코드추출
    //alert(currency)
    $.ajax({
      url : '${ pageContext.request.contextPath }/exchange/getRateCommission/'+currency,
      type : 'get',
      success : function(data) {
        let list = JSON.parse(data);
        console.log(list)
        
        let rate =list.cashbuyrate /* 현찰살때환율 */
        let basicrate=list.basicrate /* 매매기준율 */
        let commission = list.commission
        let commrate = ((rate-basicrate)*commission)+basicrate
        
        $("#rate").text((list.cashbuyrate).toFixed(2));
        $("#commrate").text(commrate.toFixed(2));
        $("#commission").text(list.commission2);
        
        document.getElementById('rateHidden').value = list.commission2;
        
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
  })   //통화를 선택하면에 대한 function 끝.
  
  
  
  
  
})



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
 
 
 
 
 
 
 
</script>


<!-- 수정할부분 시작 -->
<section>

  <div class="container class="col-xl-12"">
    <div class="row">
      <div class="col-xl-12">
        <!-- <div class="section_title text-center mb-50"> -->
        <header class="section_title mb-50 major">
          <h3>비회원 환전하기</h3>
        </header>
      </div>
    </div>
    
    
    
    <header class="section_title mb-50 major">
      <h5>환전신청내역</h5>   
    </header>
    
    <div class="table-wrapper">
      <form method="post" action="${pageContext.request.contextPath }/exchange/doExchangeKakao">
        <table border="1" class="table table-bordered">
          <tr>
            <th>통화종류</th>
            <td><select name="currencycode" id="currencycode"
              onchange="chageCurrencySelect()" class="form-control" aria-describedby="inputGroupSuccess1Status">
                <option value="a" selected disabled  >- 통화를 선택하세요 -</option>
                <option value="USD">미국달러(USD)</option>
                <option value="EUR">유럽유로(EUR)</option>
                <option value="JPY">일본엔(JPY)</option>
                <option value="GBP">영국파운드(GBP)</option>
                <option value="CAD">캐나다달러(CAD)</option>
                <option value="CHF">스위스프랑(CHF)</option>
                <option value="HKD">홍콩달러(HKD)</option>
                <option value="AUD">호주달러(AUD)</option>
                <option value="SGD">싱가폴달러(SGD)</option>
                <option value="NZD">뉴질랜드달러(NZD)</option>
                <option value="CNY">중국위안(CNY)</option>
                <option value="THB">태국바트(THB)</option>
                <option value="MYR">말레이지아링기트(MYR)</option>
                <option value="TWD">대만달러(TWD)</option>
                <option value="PHP">필리핀페소(PHP)</option>
                <option value="IDR">인도네시아루피아(IDR)</option>
                <option value="AED">U.A.D디히람(AED)</option>
                <option value="VND">베트남동(VND)</option>
            </select></td>
          </tr>
          <tr>
            <th>환전금액(외화)</th>
            <td><input type="text" id="exchangeprice" name="exchangeprice" onkeyup="keyevent(this);" class="form-control" aria-describedby="inputGroupSuccess1Status" /></td>
          </tr>
          <tr>
            <th>현재 고시환율(원)</th>
            <td>
              <span id = "rate" name = "rate"></span>
              <input type="hidden" id="rateHidden" name="rateHidden" value="" >
            </td>
          </tr>
          <tr>
            <th>우대 적용환율(원)</th>
            <td>
              <span id = "commrate" name = "commrate"></span>
              <input type="hidden" id="exchangerate" name="exchangerate" value="" >
            </td>
          </tr>
          <tr>
            <th>우대율(%)</th>
            <td>
              <span id = "commission" name = "commission"></span>
            </td>
          </tr>
          <tr>
            <th>환전금액(원)</th>
            <td>
              <span id = "exchangeChargeKRW" name = "exchangeChargeKRW"></span>
              <input type="hidden" id="exchangecharge" name="exchangecharge" value="" />
            </td>
          </tr>
        </table>
          
      
    </div>
    
    
    
    <br><br><br>
    <header class="section_title mb-50 major">
      <h5>외화수령정보</h5>   
    </header>
    
    <div class="table-wrapper">
      
        <table border="1" class="table table-bordered">
          <tr>
            <th>수령인</th>
            <td>
              <input type="text" id="name" name="name" class="form-control" aria-describedby="inputGroupSuccess1Status" />
            </td>
          </tr>
          <tr>
            <th>외화수령일</th>
            <td><input type="date" id="exchange_date" name="exchange_date" class="form-control" aria-describedby="inputGroupSuccess1Status" /></td>
          </tr>
          <tr>
            <th>수령지점</th>
            <td>
              <select name="exchange_place" id="exchange_place" class="form-control" aria-describedby="inputGroupSuccess1Status" >
                <option value="a" selected disabled  >- 수령지점을 선택하세요 -</option>
                <option value="인천국제공항">인천국제공항</option>
                <option value="김포공항">김포공항</option>
                <option value="김해공항">김해공항</option>
                <option value="제주공항">제주공항</option>
                <option value="서울역점">서울역점</option>
              </select>
            </td>
          </tr>
        </table>
    </div>
    
    
    <br><br><br>
    <header class="section_title mb-50 major">
      <h5>출금정보</h5>   
    </header>
    
    <div class="table-wrapper">
      
        <table border="1" class="table table-bordered">
          <tr>
            <th>결제방식</th>
            <td>
                                     비회원고객은 카카오페이 결제만 가능합니다.<br>
                <input type="hidden" id="id" name="id" value="${loginVO.id}" >
                <button class="btn"><img src="${pageContext.request.contextPath }/resources/img/pay.png" /></button>
            </td>
          </tr>
        </table>
      </form>
    </div>
    
    
    
    

  </div>

</section><br><br><br><br><br>
<!-- 수정할부분 끝 -->




<%@ include file="/WEB-INF/jsp/include/foot.jsp"%>