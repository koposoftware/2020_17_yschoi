<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<%@ include file="/WEB-INF/jsp/include/head.jsp"%>

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script type="text/javascript">
/* function chageCurrencySelect(){
  var currencySelect = document.getElementById("currency");
  
  // select element에서 선택된 option의 value가 저장된다. 
  var currencyCode = currencySelect.options[currencySelect.selectedIndex].value; 
  alert(currencyCode)
 } */

 
 
 $(document).ready(function(){
   
   // 소유하기 클릭하면
  $("#exchange_place").click(function(){
    var state = jQuery('#exchange_place option:selected').val();
    //alert(state)
    if (state == "own"){
      $( "#exchange_date" ).prop( "disabled", true );
      $("#alarm").html(" &nbsp;&nbsp;&nbsp;(외화 개인 소유 시 외화수령일은 입력하지 않으셔도 됩니다.)");
    } else{
      $( "#exchange_date" ).prop( "disabled", false );
      $("#alarm").html("");
    }
   });
 });
 
 
 
 
$(document).ready(function() {
	
	
	$.ajax({
	      url : '${ pageContext.request.contextPath }/exchange/getAccount_num',
	      type : 'get',
	      success : function(data) {
	    	  let list = JSON.parse(data);
	    	  console.log(list)
	    	  

	    	  $(list).each(function() {
					
					
					let str = '';

					str  +='<option class="acc" name='+this.bank_name+' value='+this.account_num+' id='+this.balance+'>'+'[계좌번호 : '+this.account_num+', 잔액:'+this.balance+'원]</option>';

					$('#account_num').append(str);

				})


	      }, 
	      error : function() {
	        alert('실패')
	      }, complete : function() {
	           		/* 뭘해줘야할까 */
	      }
	    })
	    
	    

	    
	    
	    
	    
	    
	 $.ajax({
        url : '${ pageContext.request.contextPath }/exchange/getCurAccount_num',
        type : 'get',
        success : function(data) {
          let list = JSON.parse(data);
          console.log(data)
          
          if (data.length >3) {
            console.log(data)
          } else{
            $("select option[value*='own']").prop('disabled',true);
            $("#alarm").html("&nbsp;&nbsp;&nbsp;(외화계좌 미보유자는 개인소유가 불가능합니다.)");
          }
          


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
      
      if(!(realid>=chargeKRW)){
        $(".modal-title").append("환전하기");
        $(".modal-body").append('선택하신 계좌의 잔액을 확인해주세요. 잔액이 부족합니다.');
        $("#exampleModal").modal("show");
        return false;
      }
      
      
      var bank_name = $('#bank_name').val(); // 사용자가 써준 해싱전의 pwd
      /* alert(bank_name); */
      var realpwd =$("input[type=hidden][name=pwd]").val() // db에 저장되어있는 해싱후의 진짜 pwd
      
      
      var afterHashIpt='';
      
      

      
      $.ajax({
        url : '${ pageContext.request.contextPath }/exchange/returnHash/'+bank_name,
        type : 'get',
        async:false,
        success : function(data) {
          var list = JSON.parse(data);
          afterHashIpt=list;
          afterHashIpt2=data;
          /* alert(typeof(list)) */
        }, 
        error : function() {
          alert('실패')
        
          return false;
        }, complete : function() {
        }
      });
      

      
      if(afterHashIpt == realpwd){
        $(".modal-title").append("환전하기");
        $(".modal-body").append('환전을 진행하시겠습니까?');
        $("input[type=submit]").prop('disabled',false);
        let aa =$("#exampleModal").modal("show");
        return false;
        if(aa){
          return true;
        }
      } else{
        $(".modal-title").append("환전하기");
        $(".modal-body").append('선택하신 계좌의 비밀번호를 확인해주세요.');
        $("#exampleModal").modal("show");
        return false;
      }
      
      
      
      
      


      
      
    });







  $('#account_num').change(function() {
    /* alert($("#account_num > option:selected").attr('name'));  */
    let realpwd = $("#account_num > option:selected").attr('name'); // 선택된 옵션의 name의 값을 가져오기
    $("input[type=hidden][name=pwd]").val(realpwd); // hidden에 방금 선택한 계좌의 비밀번호 값 저장
    /* alert($("input[type=hidden][name=pwd]").val()); //hidden에 있는 값 확인하기 */


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
    
    <div class="box box-primary">
      <div class="box-header with-border">
        <h3 class="box-title">Quick Example 테스트중!!</h3>
      </div>
      <div class="box-body">
        <div class="form-group">
          <label for="exampleInputEmail1">Email address</label> <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email">
        </div>
      </div>
    </div>
    
    
    <br><br><br>
    
    <header class="section_title mb-50 major">
			<h5>환전신청내역</h5>		
		</header>
		
		<div class="table-wrapper">
		
			<form method="post" action="${pageContext.request.contextPath }/exchange/doExchange">
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
						</select></td>
					</tr>
					<tr>
						<th>환전금액(외화)</th>
						<td><input type="text" id="exchangeprice" name="exchangeprice" onkeyup="keyevent(this);" class="form-control" aria-describedby="inputGroupSuccess1Status" /></td>
					</tr>
					<tr>
						<th>현재 고시환율(원)</th>
						<td>
							<span id = "rate" name = "rate" ></span>
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
							<select name="exchange_place" id="exchange_place" class="accountnum" onchange="categoryChange(this)" class="form-control" aria-describedby="inputGroupSuccess1Status" >
								<option value="a" selected disabled  >- 수령지점 / 개인 소유 여부를 선택하세요 -</option>
								<option value="own">개인소유</option>
								<option value="인천국제공항">인천국제공항</option>
								<option value="김포공항">김포공항</option>
								<option value="김해공항">김해공항</option>
							</select>
							<span id="alarm" name="alarm" ></span>
						</td>
					</tr>
					<tr>
						<th>외화수령일</th>
						<td><input type="date" id="exchange_date" name="exchange_date" value="" class="form-control" aria-describedby="inputGroupSuccess1Status"  /></td>
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
							<select name="account_num" id="account_num" class="form-control" aria-describedby="inputGroupSuccess1Status" >
								<option value="a" selected disabled  >- 출금 계좌를 선택하세요 -</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>계좌비밀번호</th>
						<td>
						  <input type="password" id="bank_name" name="bank_name" class="form-control" aria-describedby="inputGroupSuccess1Status" />
						  <input type="hidden" id="pwd" name="pwd" >
						</td>
					</tr>
				</table>
					<input type="hidden" id="" name="" value="${loginVO.id}" >
					<button class="btn btn-outline-dark" id="subm" name="subm" data-toggle="modal" data-target="#myModal" >환전하기</button>
					<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"></h5>  <!-- 여기에 제목넣기 -->
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body"></div> <!-- 여기에 내용 넣기 -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" id="close_cancel" onclick="return false" >취소</button>
                    <input type="submit"  class="btn btn-success btn-md"  value="확인" disabled="disabled"  >
              </div>
            </div>
          </div>
    </div>
			</form>
		</div>
		
		
		
		

	</div>
	
	
	
	
	
	
	
	
	
	







    <!-- Button trigger modal -->
    
 
    <!-- Modal -->















	
	

	
	
	
	

</section>
<br><br><br><br><br>
<!-- 수정할부분 끝 -->




<%@ include file="/WEB-INF/jsp/include/foot.jsp"%>


