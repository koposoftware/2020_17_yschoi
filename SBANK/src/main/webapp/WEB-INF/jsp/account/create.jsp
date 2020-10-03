<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%-- <jsp:include page="/head.jsp" />  --%>
<%@ include file="/WEB-INF/jsp/include/head.jsp"%>
<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
$(document).ready(function(){
  
  // 라디오버튼 클릭시 이벤트 발생
  $("input:radio[name=type]").click(function(){

      if($("input[name=type]:checked").val() == "K"){
          $("input:text[name=balance]").attr("disabled",false);
          // radio 버튼의 value 값이 1이라면 활성화

      }else if($("input[name=type]:checked").val() == "C"){
            $("input:text[name=balance]").attr("disabled",true);
          // radio 버튼의 value 값이 0이라면 비활성화
      }
  });
});




  $(document).ready(function(){
    $.ajax({
    url : '${ pageContext.request.contextPath }/exchange/getCurAccount_num',
    type : 'get',
    success : function(data) {
      let list = JSON.parse(data);
      console.log(data)

      if (data.length > 3) {
        console.log(data)
        $("input[value='C']").attr('disabled', "true");
        $("#alarm").html(" &nbsp;&nbsp;&nbsp;(외화 계좌는 1개만 생성이 가능합니다.)");
      }

    },
    error : function() {
      alert('실패')
    },
    complete : function() {
      /* 뭘해줘야할까 */
    }
    })
  });
  
  
  
  
  $(document).ready(function(){
    $("input[value='C']").click(function(){
      $("#alarm2").html(" &nbsp;&nbsp;&nbsp;(외화계좌 개설 시 첫입금액은 필요하지 않습니다.)");
    })
    $("input[value='K']").click(function(){
      $("#alarm2").html("");
    })
  })
  
  
  
  
</script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<style>
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
					<h3>계좌 개설</h3>
				</header>
			</div>
		</div>
		<div class="table-wrapper">
									<form:form commandName="accountVO" method="post">
				<!-- commandName과 관련이 있는 form이다. 명시해주자 -->
				<table style="width: 90%;" class="table">
					<tr>
						<th>아이디</th>
						<td>
							<%-- <form:input path="id"/>   --%> ${loginVO.id } <form:hidden
								path="id" value="${loginVO.id }" />
						</td>
					</tr>
					<tr>
					 <th>계좌 구분</th>
					 <td>
					   <INPUT TYPE=RADIO name="type" id="type" VALUE='K'  CHECKED> 원화계좌
             <INPUT TYPE=RADIO name="type" id="type" VALUE='C'> 외화계좌
             <span id="alarm" name="alarm" ></span>
					 </td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><form:input type="password" path="bank_name" class="form-control" aria-describedby="inputGroupSuccess1Status" /> <form:errors
								path="bank_name" cssStyle="color :red;" /></td>
					</tr>
					<tr>
						<th>첫입금액</th>
						<td>
              <form:input path="balance" class="form-control" aria-describedby="inputGroupSuccess1Status" /> <form:errors path="balance" cssStyle="color :red;" /> 
              <span id="alarm2" name="alarm2" ></span>
            </td>
					</tr>
					<tr>
						<th>계좌별칭</th>
						<td><form:input path="nick_name" class="form-control" aria-describedby="inputGroupSuccess1Status" /> <form:errors
								path="nick_name" cssStyle="color :red;" /></td>
					</tr>
				</table>
				<button class="btn btn-outline-dark">등록</button>
			</form:form>
		</div>

	</div>

</section><br><br><br><br><br>
<!-- 수정할부분 끝 -->











<script src="${ pageContext.request.contextPath }/resources/js/vendor/modernizr-3.5.0.min.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/popper.min.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/owl.carousel.min.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/isotope.pkgd.min.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/ajax-form.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/waypoints.min.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/jquery.counterup.min.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/imagesloaded.pkgd.min.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/scrollIt.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/jquery.scrollUp.min.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/wow.min.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/nice-select.min.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/jquery.slicknav.min.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/jquery.magnific-popup.min.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/plugins.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/gijgo.min.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/slick.min.js"></script>
    <!--contact js-->
    <script src="${ pageContext.request.contextPath }/resources/js/contact.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/jquery.ajaxchimp.min.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/jquery.form.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/jquery.validate.min.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/mail-script.js"></script>

    <script src="${ pageContext.request.contextPath }/resources/js/main.js"></script>





<%-- <%@ include file="/foot.jsp"%> --%>
<%@ include file="/WEB-INF/jsp/include/foot.jsp"%>