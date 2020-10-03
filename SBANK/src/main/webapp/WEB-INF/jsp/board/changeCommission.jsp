<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>



<%@ include file="/WEB-INF/jsp/include/head.jsp"%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script>
  $(document).ready(function() {
    

    
    
    
    
    
    
    
    
    
    
    $(document).on("click", ".modal_show", function() {

      var currency = $(this).attr('id');
      var commission2 = $(this).val();
      commission2=commission2.slice(0,2);
      commission2 = 1*commission2;
      var commission4 = $(this).attr('name');
      commission4=commission4.slice(0,2)
      commission4 = 1 * commission4;
      
      /* alert(currency);
      alert(commission2);
      alert(commission4); */
      
      $(".modal-title").append("수수료 조정하기");
      var str = '<input type="hidden" id="currency" name="currency" value="'+currency+'" >';
      str += '현찰 살 때 수수료<br>';
      str += '<input type="text" id="commission2" name="commission2" min="0" max="100" step="5" class="form-control" aria-describedby="inputGroupSuccess1Status" value="'+commission2+'"" >%<br><br>';
      str += '송금 받을 때 수수료<br>'
      str += '<input type="text" id="commission4" name="commission4" min="0" max="100" step="5" class="form-control" aria-describedby="inputGroupSuccess1Status" value="'+commission4+'"" >%<br><br>';
      $(".modal-body").append(str);
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
.card{
  width: 185px !important ;
  height: 233px !important ;
}
.card-header{
  font-size: 20px !important ;
}
.card-body{
  font-size: 17px !important ; 
}
</style>


<!-- 수정할부분 시작 -->
<section>
  <div class="container class="col-xl-12"">
    <div class="row">
      <div class="col-xl-12">
        <!-- <div class="section_title text-center mb-50"> -->
        <header class="section_title mb-50 major">
          <h3>수수료 조정</h3>
        </header>
      </div>
    </div>
    
    
    
    
    <%-- <table class="table table-bordered table-striped table-condensed">
        <thead>
          <tr>
            <th class="leftNone">통화</th>
            <th class="leftNone">현찰살때 수수료</th>
            <th class="leftNone">송금받을때 수수료</th>
        </thead>
        <tbody>
          <c:forEach items="${ currencyList }" var="cur">
            <tr>
              <td>${cur.currency}</td>
              <td>${cur.commission2}</td>
              <td>${cur.commission4}</td>

            </tr>
          </c:forEach>
        </tbody>
      </table> --%>
      
      
      
      
    <div class="row grid">
      <c:forEach items="${ currencyList }" var="cur">
        <div class="card bg-light   grid-item ">
          <div class="card-header">
            <strong>${cur.currency}</strong>
          </div>
          <div class="card-body">
                               현찰 살때 : <strong>${cur.commission2}</strong> <br>
            <br> 송금 받을 때 : <strong>${cur.commission4}</strong>
          </div>
          <div class="card-footer">
            <button id="${cur.currency}" value="${cur.commission2}" name="${cur.commission4}" class="btn btn-outline-dark modal_show">수수료 조정하기</button>
          </div>
        </div>
      </c:forEach>
    </div>
    
    
    
    
    
    <!-- 모달창 시작 -->
    <form action="${pageContext.request.contextPath }/board/changeCommission" method="post" id="formmm">
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
              <input type="submit" class="btn btn-success btn-md" value="확인">
            </div>
          </div>
        </div>
      </div>
    </form>
    <!-- 모달창 끝 -->
    
    
    
    
  </div>
</section>
<br><br><br><br><br>
<!-- 수정할부분 끝 -->




<%@ include file="/WEB-INF/jsp/include/foot.jsp"%>


