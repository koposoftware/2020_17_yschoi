<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%-- <jsp:include page="/head.jsp" />  --%>
<%@ include file="/WEB-INF/jsp/include/head.jsp"%>






<!-- 수정할부분 시작 -->
<section>

	<div class="container class="col-xl-12"">
		<div class="row">
			<div class="col-xl-12">
				<!-- <div class="section_title text-center mb-50"> -->
				<div class="section_title mb-50">
					<h3>계좌 개설</h3>
				</div>
			</div>
		</div>
		<div class="table-wrapper">
									<form:form commandName="accountVO" method="post">
				<!-- commandName과 관련이 있는 form이다. 명시해주자 -->
				<table border="1" style="width: 80%">
					<tr>
						<th width="23%">아이디</th>
						<td>
							<%-- <form:input path="id"/>   --%> ${loginVO.id } <form:hidden
								path="id" value="${loginVO.id }" />
						</td>
					</tr>
					<tr>
						<th width="23%">개설은행</th>
						<td><form:input path="bank_name" /> <form:errors
								path="bank_name" cssStyle="color :red;" /></td>
					</tr>
					<tr>
						<th width="23%">첫입금액</th>
						<td><form:input path="balance" /> <form:errors
								path="balance" cssStyle="color :red;" /></td>
					</tr>
					<tr>
						<th width="23%">계좌별칭</th>
						<td><form:input path="nick_name" /> <form:errors
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