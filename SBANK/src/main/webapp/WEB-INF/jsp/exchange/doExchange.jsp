<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<%@ include file="/WEB-INF/jsp/include/head.jsp"%>

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
/* function chageCurrencySelect(){
  var currencySelect = document.getElementById("currency");
  
  // select element에서 선택된 option의 value가 저장된다. 
  var currencyCode = currencySelect.options[currencySelect.selectedIndex].value; 
  alert(currencyCode)
 } */
 
$(document).ready(function() {
	
	
  $('#currency').change(function() {   //통화를 선택하면에 대한 function 시작
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
		
		var exchangeCharge = document.getElementById("exchangeCharge").value; //환전금액(외화)
		var commrate = document.getElementById("commrate").innerHTML;  //우대적용환율
		
		//alert(exchangeCharge)
		//alert(commrate)
		
		exchangeChargeKRW = exchangeCharge * commrate
		exchangeChargeKRW=exchangeChargeKRW.toFixed(2)
		
		document.getElementById("exchangeChargeKRW").innerHTML=exchangeChargeKRW; //환전금액(원) 값 띄어주기
		
		var commrate = document.getElementById("commrate").innerHTML;
		
		document.getElementById('commrateHidden').value = commrate;
		document.getElementById('exchangeChargeKRWHidden').value = exchangeChargeKRW; // hidden필드에 값 넣어주기
		
		
		
		exchangeChargeKRW="";
		commrate="";
	  
	}
</script>


<!-- 수정할부분 시작 -->
<section>

	<div class="container class="col-xl-12"">
		<div class="row">
			<div class="col-xl-12">
				<!-- <div class="section_title text-center mb-50"> -->
				<header class="section_title mb-50 major">
					<h3>환전하기</h3>
				</header>
			</div>
		</div>
		<header class="section_title mb-50 major">
			<h5>환전신청내역</h5>		
		</header>
		
		<div class="table-wrapper">
			<form method="post" action="${pageContext.request.contextPath }/exchange/doExchange">
				<table border="1" class="table table-bordered">
					<tr>
						<th>통화종류</th>
						<td><select name="currency" id="currency"
							onchange="chageCurrencySelect()">
								<option value="a" selected disabled  >- 통화를 선택하세요 -</option>
								<option value="USD">미국달러(USD)</option>
								<option value="EUR">유럽유로(EUR)</option>
								<option value="JPY">일본엔(JPY)</option>
								<option value="GBP">영국파운드(GBP)</option>
						</select></td>
					</tr>
					<tr>
						<th>환전금액(외화)</th>
						<td><input type="text" id="exchangeCharge" name="exchangeCharge" onkeyup="keyevent(this);" /></td>
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
							<input type="hidden" id="commrateHidden" name="commrateHidden" value="" >
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
							<input type="hidden" id="exchangeChargeKRWHidden" name="exchangeChargeKRWHidden" value="" />
						</td>
					</tr>
				</table>
					<button class="btn btn-outline-dark">환전하기</button>
			</form>
		</div>

	</div>

</section>
<br><br><br><br><br>
<!-- 수정할부분 끝 -->




<%@ include file="/WEB-INF/jsp/include/foot.jsp"%>


