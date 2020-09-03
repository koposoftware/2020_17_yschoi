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
	
	
	$.ajax({
	      url : '${ pageContext.request.contextPath }/exchange/getAccount_num',
	      type : 'get',
	      success : function(data) {
	    	  let list = JSON.parse(data);
	    	  console.log(list)
	    	  

	    	  $(list).each(function() {
					
					
					let str = '';

					str  +='<option class="acc" name="acc" value='+this.account_num+' id='+this.balance+'>'+'[계좌번호 : '+this.account_num+', 잔액:'+this.balance+'원]</option>';

					$('#account_num').append(str);

				})


	      }, 
	      error : function() {
	        alert('실패')
	      }, complete : function() {
	           		/* 뭘해줘야할까 */
	      }
	    })
	
	
	
	
	
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
  
  
  
  
  
  
  
  
  
  
  
  
  /////////////여기여기//////////////
/*   $(document).on('change', '#account_num', function() { */
  $(document).on('click', '#subm', function() {
      //alert('!')
      //let bal = $(this).attr('id');
      //console.log(bal);
      
      let realid = $("#account_num option:selected").attr('id'); // 선택한 계좌의 잔액임
      realid = 1 * realid
      console.log(typeof(realid));
      console.log(realid);
      
      var chargeKRW = $('#exchangecharge').val(); //환전시 필요한 잔액
      chargeKRW = 1 * chargeKRW
      console.log(typeof(chargeKRW));
      console.log(chargeKRW);
      
      if(realid>=chargeKRW){
        console.log('good')
      }else{
        console.log('bad')
        alert('선택하신 계좌의 잔액을 확인해주세요. 잔액이 부족합니다.')
        return false;
        
      }
      


      
      
    }); 
  

  
  
  
  
  
  
  
  
  
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
	
	
	
	
	
	

	
	
	$(document).ready(function(){
	  $("#exchange_place").change(function(){
	     let nowtime = new Date();
	  

	      if($("#exchange_place option:selected").val() == "own"){
	        $('input[type="date"]').attr("disabled",true);// 비활성화
	        
	      }else{
	        $("input:date[name=exchange_date]").attr("disabled",flase);
	        $("input:date[name=exchange_date]").attr("value",'2020/01/01');
	      }
	  });
	});
	
	
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
						<td><select name="currencycode" id="currencycode"
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
						<td><input type="text" id="exchangeprice" name="exchangeprice" onkeyup="keyevent(this);" /></td>
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
						<td>${loginVO.name }
							<input type="hidden" id="name" name="name" value="${loginVO.name }" />
						</td>
					</tr>
					<tr>
						<th>수령지점 / 소유여부</th>
						<td>
							<select name="exchange_place" id="exchange_place" class="accountnum" onchange="categoryChange(this)" >
								<option value="a" selected disabled  >- 수령지점 / 개인 소유 여부를 선택하세요 -</option>
								<option value="own">개인소유</option>
								<option value="인천국제공항">인천국제공항</option>
								<option value="김포공항">김포공항</option>
								<option value="김해공항">김해공항</option>
							</select>
							개인 소유를 선택하신다면, 외화수령일은 입력하지 않으셔도 됩니다.
						</td>
					</tr>
					<tr>
						<th>외화수령일</th>
						<td><input type="date" id="exchange_date" name="exchange_date" value=""  /></td>
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
						<th>출금계좌번호</th>
						<td>
						
						<div id="make" name="make" class="name"></div>
						
							<select name="account_num" id="account_num" >
								<option value="a" selected disabled  >- 출금 계좌를 선택하세요 -</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>계좌비밀번호</th>
						<td><input type="password" id="bank_name" name="bank_name" /></td>
					</tr>
				</table>
					<input type="hidden" id="" name="" value="${loginVO.id}" >
					<button class="btn btn-outline-dark" id="subm" name="subm" >환전하기</button>
			</form>
		</div>
		
		
		
		

	</div>

</section>
<br><br><br><br><br>
<!-- 수정할부분 끝 -->




<%@ include file="/WEB-INF/jsp/include/foot.jsp"%>


