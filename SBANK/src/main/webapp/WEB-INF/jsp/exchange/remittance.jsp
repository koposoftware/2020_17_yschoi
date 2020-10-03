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
<script type="text/javascript">





  $(document).ready(function() {

    // 외화보유내역 리스트 가져오기
    $.ajax({
    url : '${ pageContext.request.contextPath }/account/returnmyCurrency/${loginVO.id}',
    type : 'get',
    success : function(data) {
      console.log(data)
      let list = JSON.parse(data);
      console.log(list)

      $(list).each(function() {

        let str = '';

        str += '<option value='+this.currencycode+' id='+this.currencycode+' name='+this.balance + '>[ 통화명 : ' + this.currencycode + ', 잔액:' + this.balance + '원]</option>';

        $('#currencycode').append(str);

      })

    },
    error : function() {
      alert('실패')
    },
    complete : function() {
      /* 뭘해줘야할까 */
    }
    })

  })

  
  
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
    $(document).on('click', '#subm', function() {
      //alert('!')
      //let bal = $(this).attr('id');
      //console.log(bal);

      let balance = $("#currencycode option:selected").attr('name'); // 선택한 계좌의 잔액임
      balance = 1 * balance  // balance는 DB에 있는 지금 내가 보유하고 있는 외화. 선택한 외화에 대한 잔액임
/*       alert(typeof (balance));
      alert(balance); */
      
      
      let iptnum = $("#balance").val(); // 선물하려는 금액
      
      
      if(iptnum>balance){
        $(".modal-title").append("외화 선물하기");
        $(".modal-body").append('선물하려는 금액이 보유 금액보다 큽니다. 확인해주세요.');
        $("input[type=submit]").prop('disabled', true);
        $("#exampleModal").modal("show");
        return false;
      }
      
      let account_num_to = $("#account_num_to").val();
      let name =  $("#name").val();
      

      
      $.ajax({
      url : '${ pageContext.request.contextPath }/account/chkIfAccountAndNameExist/' + account_num_to+'/'+name,
      type : 'get',
      async : false,
      success : function(data) { // 1이면 선물 0이면 앙댐
       
        var list = JSON.parse(data);
        /* alert(list); */
        afterHashIpt = list;

      },
      error : function() {
        return false;
        alert('실패')

        
      },
      complete : function() {
      }
      });
      
      
      /* alert(afterHashIpt) */

      if (afterHashIpt == 1) {
        $(".modal-title").append("외화 송금하기");
        $(".modal-body").append('외화를 송금하시겠습니까?');
        $("input[type=submit]").prop('disabled', false);
        let aa = $("#exampleModal").modal("show");
        return false;
        if (aa) {
          return true;
        }
      } else {
        $(".modal-title").append("외화 송금하기");
        $(".modal-body").append('송금 받으시는 분의 계좌번호와 이름을 다시 확인해주세요');
        $("input[type=submit]").prop('disabled', true);
        $("#exampleModal").modal("show");
        return false;
      } 

    });
  });
</script>
<style>
th {
  background-color: #f4f8f9;
}

.table th {
  font-size: 15px !important;
  font-weight: 600 !important;
}
.form-control{
  font-size: 17px !important;
  height: calc(2.25rem + 10px) !important;
}
</style>
<!-- 수정할부분 시작 -->
<section>

  <div class="container class="col-xl-12"">
    <div class="row">
      <div class="col-xl-12">
        <!-- <div class="section_title text-center mb-50"> -->
        <header class="section_title mb-50 major" >
          <h3>외화 당행 송금하기</h3>
        </header>
      </div>
    </div>
    

    
    <div class="table-wrapper">
      
        <form action="${pageContext.request.contextPath }/exchange/exchangeTransfer" method="post" >
          <table style="width: 90%;" class="table">
            <tr>
              <th>통화 선택</th>
              <td>
                <select name="currencycode" id="currencycode" class="form-control"  >
                  <option value="a" selected disabled  >- 선물할 통화를 선택하세요 -</option>
                </select>
              </td>
            </tr>
            <tr>
              <th>송금액</th>
              <td>
                <input type="number" class="form-control" aria-describedby="inputGroupSuccess1Status" id="balance" name="balance" >
              </td>
            </tr>
            <tr>
              <th>송금받을 분 계좌</th>
              <td>
                <input type="text" class="form-control" aria-describedby="inputGroupSuccess1Status" id="account_num_to" name="account_num_to">
              </td>
            </tr>
            <tr>
              <th>송금받을 분 이름</th>
              <td>
                <input type="text" id="name" name="name" class="form-control" aria-describedby="inputGroupSuccess1Status" >
              </td>
            </tr>
          </table>
          <button class="btn btn-outline-dark pull-right" id="subm" name="subm" data-toggle="modal" data-target="#myModal">송금하기</button>
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
						</form>
        <br>
      
    </div>
    
    
    
    

    
    

  </div>

</section><br><br><br><br><br>
<!-- 수정할부분 끝 -->




<%@ include file="/WEB-INF/jsp/include/foot.jsp"%>