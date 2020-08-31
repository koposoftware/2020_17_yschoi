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
        let basicrate=list.basicrate
        let commission = list.commission
        let commrate = ((rate-basicrate)*commission)+basicrate



        let ori = '현찰 살때 가격';
        let str = ori + rate
        document.getElementById('rateHidden').value += str;
        document.getElementById('rateHidden').value += str;
        document.getElementById('basicrate').value += basicrate;
        document.getElementById('commission').value += commission;
        /* $("#commrate").text(commrate.toFixed(2)); */
        $("#commission2").text(commission2);
        $("#rate").text((list.cashbuyrate).toFixed(2));

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

    let exchangeCharge = document.getElementById("exchangeprice").value; //환전금액(외화)
    let reserverate = document.getElementById("reserverate").value; //목표환율
    let basicrate = document.getElementById("basicrate").value; //매매기준율
    let comm = document.getElementById("commission").value; //수수료1
    
/*     console.log(typeof exchangeCharge)
    console.log(typeof reserverate)
    console.log(typeof basicrate)
    console.log(typeof comm) */

/*     alert(exchangeCharge)
    alert(reserverate)
    alert(basicrate) 
    alert(comm) */
    
    if(exchangeCharge=='' || reserverate==''){
      return false
    }
    //alert('after return')
    
    let re1 = (reserverate-basicrate).toFixed(2)

    
    let re2 = (re1 * comm).toFixed(2)
    re2 = 1 * re2
    basicrate = 1 * basicrate

    
    let re3 = (re2 + basicrate).toFixed(2) // re3 = 우대환율
    
    

    

    
    

    exchangeChargeKRW = exchangeCharge * commrate
    exchangeChargeKRW = exchangeChargeKRW.toFixed(2)

    document.getElementById("exchangeChargeKRW").innerHTML = ((re3*exchangeCharge).toFixed(2)); //환전금액(원) 값 띄어주기
    document.getElementById("commrate").innerHTML = re3; //우대환율(원) 값 띄어주기
    
    



    document.getElementById('exchangecharge').value = ((re3*exchangeCharge).toFixed(2)); // hidden필드에 값 넣어주기 환전금액(원)
    document.getElementById('exchangerate').value = re3; // hidden필드에 값 넣어주기 우대환율(원)

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
						<form method="post" action="${pageContext.request.contextPath }/exchange/doReserve">
								<table border="1">
										<tr>
												<td colspan="3">
												    환전을 원하는 통화를 선택 및 금액을 입력하세요<br> 
												    오늘의 현찰살때가격 : <span id="rate" name="rate"></span>
												    <input type="hidden" id="rateHidden" name="rateHidden" value="">
												    <input type="hidden" id="basicrate" name="basicrate" value="">
												    
												</td>
												<td rowspan="4">그래프으</td>
										</tr>
										<tr>
												<td><select name="currencycode" id="currencycode">
																<option value="a" selected disabled>- 통화를 선택하세요 -</option>
																<option value="USD">미국달러(USD)</option>
																<option value="EUR">유럽유로(EUR)</option>
																<option value="JPY">일본엔(JPY)</option>
																<option value="GBP">영국파운드(GBP)</option>
												</select></td>
												<td colspan="2">
												  <input type="text" id="exchangeprice" name="exchangeprice" onkeyup="keyevent(this);" placeholder ="환전 원하는 금액을 입력하세요" >
												</td>
										</tr>
										<tr>
										  <td colspan="3">
										        목표환율 : <input type="text" id="reserverate" name="reserverate" onkeyup="keyevent(this);" placeholder ="목표환율을 입력하세요" >
										  </td>
										</tr>
										<tr>
												<td colspan="2">
												    우대율 : <span id="commission2" name="commission2"></span>
												    <input type="hidden" id="commission" name="commission" value="">
												</td>
										</tr>
								</table>
								<br>
								<br>
								<table border="1">
										<tr>
												<td>
												    결제금액(원) : 
												  <span id="exchangeChargeKRW" name="exchangeChargeKRW"></span> 
												  <input type="hidden" id="exchangecharge" name="exchangecharge" value="" />
												</td>
												<td>
												    적용 우대환율:
                          <span id = "commrate" name = "commrate"></span>
                           <input type="hidden" id="exchangerate" name="exchangerate" value="" >
												</td>
										</tr>
										<tr>
										  <td>마지막 환전일</td>
										  <td>
										    <input type="date" id="max_date" name="max_date" /><br>
										          값을 비워주시면 자동적으로 1년이 설정됩니다.
										  </td>
										</tr>
										<tr>
            <th>출금계좌번호</th>
            <td>
              <select name="account_num" id="account_num" >
                <option value="a" selected disabled  >- 출금 계좌를 선택하세요 -</option>
              </select>
            </td>
          </tr>
          <tr>
            <th>계좌비밀번호</th>
            <td><input type="password" id="password" name="password" /></td>
          </tr>
								</table>
										<button class="btn btn-outline-dark">목표 환전 예약하기</button>
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