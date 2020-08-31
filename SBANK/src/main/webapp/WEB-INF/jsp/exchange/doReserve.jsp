<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>

  $(document).ready(function() {

    $.ajax({ //페이지 로드 시 로그인한 사람의 계좌 확인하기
    url : '${ pageContext.request.contextPath }/exchange/getAccount_num',
    type : 'get',
    success : function(data) {
      let list = JSON.parse(data);
      console.log(list)

      $(list).each(function() {

        let str = '';
        str += '<option value='+this.account_num+'>' + '[계좌번호 : ' + this.account_num + ', 잔액:' + this.balance + '원]</option>';

        $('#account_num').append(str);
      })


    },
    error : function() {
      alert('실패')
    },
    complete : function() {
      /* 뭘해줘야할까 */
    }
    })

    
    
    
    $('#currencycode').change(function() { //통화를 선택하면에 대한 function 시작
      let currency = $(this).val(); // 통화코드추출
      //alert(currency)
      $.ajax({
      url : '${ pageContext.request.contextPath }/exchange/getRateCommission/' + currency,
      type : 'get',
      success : function(data) {
        let list = JSON.parse(data);
        console.log(list)

        let rate = list.cashbuyrate; 
        let commission2 = list.commission2;


        $("#rate").text((list.cashbuyrate).toFixed(2));
        $("#commission2").text(commission2);

        let ori = '현찰 살때 가격';
        let str = ori + rate
        document.getElementById('rateHidden').value += str;
        document.getElementById('rateHidden').value += str;

        rate = "";

      },
      error : function() {
        alert('실패')
      },
      complete : function() {
        /* 뭘해줘야할까 */
      }
      })
    }) //통화를 선택하면에 대한 function 끝.

    
    
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
<style>
#chart {
	width: 300px;
	height: 500px;
}
</style>


<%@ include file="/WEB-INF/jsp/include/head.jsp"%>




<!-- 수정할부분 시작 -->
<section>

	<div class="container class="col-xl-12"">
		<div class="row">
			<div class="col-xl-12">
				<!-- <div class="section_title text-center mb-50"> -->
				<header class="section_title mb-50 major">
					<h3>목표 환전 예약하기</h3>
				</header>
			</div>
		</div>
		
		
		<header class="section_title mb-50 major">
      <h5>환전신청내역</h5>   
    </header>
		
		
		<div class="table-wrapper">
		  
			<!-- highcharts 해보기 -->
						<form action="">
								<table border="1">
<!-- 								    <tr>
								      <td colspan="2">
								        <span>현찰 사실 때</span><br>
								        <span id = "rate" name = "rate"></span>
                        <input type="hidden" id="rateHidden" name="rateHidden" value="" >
								      </td>
								    </tr> -->
								    <tr>
								      <td colspan="3">환전을 원하는 통화를 선택 및 금액을 입력하세요<br>
								                  현찰살때가격 :  <span id = "rate" name = "rate"></span><input type="hidden" id="rateHidden" name="rateHidden" value="" ></td>
								      <td rowspan="3">그래프으</td>
								    </tr>
										<tr>
												<td>
												  <select name="currencycode" id="currencycode">
																<option value="a" selected disabled>- 통화를 선택하세요 -</option>
																<option value="USD">미국달러(USD)</option>
																<option value="EUR">유럽유로(EUR)</option>
																<option value="JPY">일본엔(JPY)</option>
																<option value="GBP">영국파운드(GBP)</option>
												  </select>
												</td>
												<td>
												  <input type="text" id="" name="" onkeyup="keyevent(this);">
												  
												</td>
												<td><button>계산하기</button></td>
												
										</tr>
										<tr>
										  <td colspan="3">우대율 : <span id = "commission2" name = "commission2"></span></td>
										</tr>
								</table>
						</form>
				</div>

	</div>

</section>
<br>
<br>
<br>
<br>
<br>
<!-- 수정할부분 끝 -->




<%@ include file="/WEB-INF/jsp/include/foot.jsp"%>