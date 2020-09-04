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

        str += '<option class="acc" name="acc" value='+this.currencycode+' id='+this.balance+'>' + '[ 통화명 : ' + this.currencycode + ', 잔액:' + this.balance + '원]</option>';

        $('#CURRENCYCODE').append(str);

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
      
        <form
          action="${pageContext.request.contextPath }/account/accountTransfer"
          method="post" id="formm">
          <table border="1" class="table table-bordered">
          <input type="hidden" id="account_num" name="account_num" value="abv">
            <tr>
              <th>통화 선택</th>
              <td>
                <select name="CURRENCYCODE" id="CURRENCYCODE" >
                  <option value="a" selected disabled  >- 선물할 통화를 선택하세요 -</option>
                </select>
              </td>
            </tr>
            <tr>
              <th>잔액</th>
              <td>${account.balance}</td>
            </tr>
          </table>
          <button>선물하기</button>
        </form>
        <br>
      
    </div>
    
    
    
    

    
    

  </div>

</section><br><br><br><br><br>
<!-- 수정할부분 끝 -->




<%@ include file="/WEB-INF/jsp/include/foot.jsp"%>