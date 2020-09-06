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



  function getTimeStamp() {

    var d = new Date();
    var s = leadingZeros(d.getFullYear(), 4) + leadingZeros(d.getMonth() + 1, 2) + leadingZeros(d.getDate(), 2);

    return s;
  }

  function leadingZeros(n, digits) {

    var zero = '';
    n = n.toString();

    if (n.length < digits) {
      for (i = 0; i < digits - n.length; i++)
        zero += '0';
    }
    return zero + n;
  }

  $(document).ready(function() {
    //통화 코드 바꿀때마다 그래프 보여주기!
    
    var today = getTimeStamp();
    //alert(today);
    
    var firstsrc ='https://ssl.pstatic.net/imgfinance/chart/marketindex/area/month3/FX_USDKRW.png?sidcode=';
    firstsrc += today;
    $("#style-img").attr("src", firstsrc);

    $("#currencycode").change(function() {
      var cur_value = $('option:selected', this).text();
      cur_value = cur_value.slice(-4, -1);
      console.log(cur_value);

      var src = 'https://ssl.pstatic.net/imgfinance/chart/marketindex/area/month3/FX_'
      src += cur_value;
      src += 'KRW.png?sidcode=';
      src +=today;

      //console.log(image_src);
      $("#style-img").attr("src", src);
    });

  });

  $(document).ready(function() {

    $.ajax({ //페이지 로드 시 로그인한 사람의 계좌 확인하기
    url : '${ pageContext.request.contextPath }/exchange/getAccount_num',
    type : 'get',
    success : function(data) {
      let list = JSON.parse(data);
      console.log(list)

      $(list).each(function() {

        let str = '';

        str += '<option class="acc" name='+this.bank_name+' value='+this.account_num+' id='+this.balance+'>' + '[계좌번호 : ' + this.account_num + ', 잔액:' + this.balance + '원]</option>';

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
        let basicrate = list.basicrate
        let commission = list.commission
        let commrate = ((rate - basicrate) * commission) + basicrate

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

    ////

    $(document).on('click', '#subm', function() {
      //alert('!')
      //let bal = $(this).attr('id');
      //console.log(bal);

      let realid = $("#account_num option:selected").attr('id'); // 선택한 계좌의 잔액임
      realid = 1 * realid
      console.log(typeof (realid));
      console.log(realid);

      var chargeKRW = $('#exchangecharge').val(); //환전시 필요한 잔액
      chargeKRW = 1 * chargeKRW
      console.log(typeof (chargeKRW));
      console.log(chargeKRW);

      if (!(realid >= chargeKRW)) {
        $(".modal-title").append("환전예약하기");
        $(".modal-body").append('선택하신 계좌의 잔액을 확인해주세요. 잔액이 부족합니다.');
        $("#exampleModal").modal("show");
        return false;

      }

      var bank_name = $('#bank_name').val(); // 사용자가 써준 해싱전의 pwd
      /* alert(bank_name); */
      var realpwd = $("input[type=hidden][name=pwd]").val() // db에 저장되어있는 해싱후의 진짜 pwd

      var afterHashIpt = '';

      $.ajax({
      url : '${ pageContext.request.contextPath }/exchange/returnHash/' + bank_name,
      type : 'get',
      async : false,
      success : function(data) {
        var list = JSON.parse(data);
        afterHashIpt = list;
        afterHashIpt2 = data;
        /* alert(typeof(list)) */
      },
      error : function() {
        alert('실패')

        return false;
      },
      complete : function() {
      }
      });

      alert('afterHashIpt : ' + afterHashIpt);
      alert('realpwd : ' + realpwd);

      if (afterHashIpt == realpwd) {
        $(".modal-title").append("환전예약하기");
        $(".modal-body").append('환전예약을 진행하시겠습니까?');
        $("input[type=submit]").prop('disabled', false);
        let aa = $("#exampleModal").modal("show");
        return false;
        if (aa) {
          return true;
        }
      } else {
        $(".modal-title").append("환전예약하기");
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

    if (exchangeCharge == '' || reserverate == '') {
      return false
    }
    //alert('after return')

    let re1 = (reserverate - basicrate).toFixed(2)

    let re2 = (re1 * comm).toFixed(2)
    re2 = 1 * re2
    basicrate = 1 * basicrate

    let re3 = (re2 + basicrate).toFixed(2) // re3 = 우대환율

    exchangeChargeKRW = exchangeCharge * commrate
    exchangeChargeKRW = exchangeChargeKRW.toFixed(2)

    document.getElementById("exchangeChargeKRW").innerHTML = ((re3 * exchangeCharge).toFixed(2)); //환전금액(원) 값 띄어주기
    document.getElementById("commrate").innerHTML = re3; //우대환율(원) 값 띄어주기

    document.getElementById('exchangecharge').value = ((re3 * exchangeCharge).toFixed(2)); // hidden필드에 값 넣어주기 환전금액(원)
    document.getElementById('exchangerate').value = re3; // hidden필드에 값 넣어주기 우대환율(원)

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
<style>
#chart {
	width: 300px;
	height: 500px;
}
</style>







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
								<table border="1" class="table table-bordered">
                    <tr>
                      <td colspan="3">
                        <img id="style-img" class="centered " crossorigin="anonymous" src="" height=256></img>
                      </td>
                    </tr>
										<tr>
												<td colspan="3">
												    환전을 원하는 통화를 선택 및 금액을 입력하세요<br> 
												    오늘의 현찰살때가격 : <span id="rate" name="rate"></span>
												    <input type="hidden" id="rateHidden" name="rateHidden" value="">
												    <input type="hidden" id="basicrate" name="basicrate" value="">
												    
												</td>
												<!-- <td rowspan="4">그래프으</td> -->
										</tr>
										<tr>
												<td><select name="currencycode" id="currencycode" class="form-control" aria-describedby="inputGroupSuccess1Status">
																<option value="a" selected disabled>- 통화를 선택하세요 -</option>
																<option value="USD" selected="selected">미국달러(USD)</option>
																<option value="EUR">유럽유로(EUR)</option>
																<option value="JPY">일본엔(JPY)</option>
																<option value="GBP">영국파운드(GBP)</option>
												</select></td>
												<td colspan="2">
												  <input type="text" id="exchangeprice" name="exchangeprice" onkeyup="keyevent(this);" placeholder ="환전 원하는 금액을 입력하세요" class="form-control" aria-describedby="inputGroupSuccess1Status" >
												</td>
										</tr>
										<tr>
										  <td colspan="3">
										        목표환율 : <input type="text" id="reserverate" name="reserverate" onkeyup="keyevent(this);" placeholder ="목표환율을 입력하세요" class="form-control" aria-describedby="inputGroupSuccess1Status" >
										  </td>
										</tr>
										<tr>
												<td colspan="2">
												    우대율 : <span id="commission2" name="commission2"></span>
												    <input type="hidden" id="commission" name="commission" value="">
												</td>
										</tr>
								</table>
                
        <header class="section_title mb-50 major">
          <h5>환전신청내역</h5>
        </header>
        <br>
								<br>
								<table border="1" class="table table-bordered">
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
										    <input type="date" id="max_date" name="max_date" class="form-control" aria-describedby="inputGroupSuccess1Status" /><br>
										          값을 비워주시면 자동적으로 1년이 설정됩니다.
										  </td>
										</tr>
										<tr>
            <th>출금계좌번호</th>
            <td>
              <select name="account_num" id="account_num" class="account_num" class="form-control" aria-describedby="inputGroupSuccess1Status" >
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
										<button class="btn btn-outline-dark" id="subm" name="subm" >환전하기</button>
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

</section>
<br>
<br>
<br>
<br>
<br>
<!-- 수정할부분 끝 -->




<%@ include file="/WEB-INF/jsp/include/foot.jsp"%>