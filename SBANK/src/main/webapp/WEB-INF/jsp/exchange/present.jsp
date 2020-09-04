<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/include/head.jsp"%>
<script>


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

        str += '<option value='+this.currencycode+' id='+this.currencycode+'>' + '[ 통화명 : ' + this.currencycode + ', 잔액:' + this.balance + '원]</option>';

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
</script>
<!-- 수정할부분 시작 -->
<section>

  <div class="container class="col-xl-12"">
    <div class="row">
      <div class="col-xl-12">
        <!-- <div class="section_title text-center mb-50"> -->
        <header class="section_title mb-50 major" >
          <h3>외화 선물하기</h3>
        </header>
      </div>
    </div>
    

    
    <div class="table-wrapper">
      
        <form action="${pageContext.request.contextPath }/exchange/exchangeTransfer" method="post" >
          <table border="1" class="table table-bordered">
            <tr>
              <th>통화 선택</th>
              <td>
                <select name="currencycode" id="currencycode" class="form-control"  >
                  <option value="a" selected disabled  >- 선물할 통화를 선택하세요 -</option>
                </select>
              </td>
            </tr>
            <tr>
              <th>선물할 금액</th>
              <td>
                <input type="number" class="form-control" aria-describedby="inputGroupSuccess1Status" id="balance" name="balance" >
              </td>
            </tr>
            <tr>
              <th>선물받을 분 계좌</th>
              <td>
                <input type="text" class="form-control" aria-describedby="inputGroupSuccess1Status" id="account_num_to" name="account_num_to">
              </td>
            </tr>
            <tr>
              <th>선물받을 분 이름</th>
              <td>
                <input type="text" id="name" name="name" class="form-control" aria-describedby="inputGroupSuccess1Status" >
              </td>
            </tr>
          </table>
          <button class="btn btn-outline-dark">선물하기</button>
        </form>
        <br>
      
    </div>
    
    
    
    

    
    

  </div>

</section><br><br><br><br><br>
<!-- 수정할부분 끝 -->




<%@ include file="/WEB-INF/jsp/include/foot.jsp"%>