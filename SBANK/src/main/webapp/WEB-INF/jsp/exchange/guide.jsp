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
				<header class="section_title mb-50 major" >
					<h3>계좌 개설</h3>
				</header>
			</div>
		</div>
		<div class="table-wrapper">
		<h3>환전 수수료 우대율</h3>
										<div class="table-wrapper">
												<table>
														<thead>
																<tr>
																		<th>Name</th>
																		<th>Description</th>
																		<th>Price</th>
																</tr>
														</thead>
														<tbody>
																<tr>
																		<td>Item1</td>
																		<td>Ante turpis integer aliquet porttitor.</td>
																		<td>29.99</td>
																</tr>
																<tr>
																		<td>Item2</td>
																		<td>Vis ac commodo adipiscing arcu aliquet.</td>
																		<td>19.99</td>
																</tr>
																<tr>
																		<td>Item3</td>
																		<td>Morbi faucibus arcu accumsan lorem.</td>
																		<td>29.99</td>
																</tr>
																<tr>
																		<td>Item4</td>
																		<td>Vitae integer tempus condimentum.</td>
																		<td>19.99</td>
																</tr>
																<tr>
																		<td>Item5</td>
																		<td>Ante turpis integer aliquet porttitor.</td>
																		<td>29.99</td>
																</tr>
														</tbody>
												</table>
										</div>
										<hr class="major" />
										<h3>안내 및 유의사항</h3>
										<ul>
												<li>환전 가능 금액 : 환전가능금액 합이 USD 100 ~ USD20,000 상당액 이하.<br> (PHP, TWD ,IDR, AED, VND 통화는 건당 USD100~USD5,000 상당액 이하만 환전이 가능하며 인천국제, 김포, 김해국제 영업점에서만 수령 가능합니다.)
												</li>
												<li>환전신청 후 취소는 불가하며 지정한 수령일로부터 7영업일까지 고객 재환전 신청이 가능하며, 고객 재환전 신청 시점의 현찰 파실 때 환율이 적용됩니다.</li>
												<li>외화현잘을 미수령하였을 경우 지정한 수령일로부터 7영업일까지 고객 재환전 신청이 가능하며, 고객 재환전 신청 시점의 현찰 파실 때 환율이 적용됩니다.</li>
												<li>외국환거래법규에 따라 1일 USD 10,000 초과 환전 시 국세청 자동 통보됩니다.</li>
												<li>환전신청인과 실물수령인은 동일인이어야 합니다. (대리수령불가): 개정 개인정보보호법 시행('14.8.7)으로 대리인 주민번호 처리 불가.</li>
										</ul>
										<hr class="major" />
										<h3>환전범위</h3>
										<div class="table-wrapper">
												<table>
														<thead>
																<tr>
																		<th>Name</th>
																		<th>Description</th>
																		<th>Price</th>
																</tr>
														</thead>
														<tbody>
																<tr>
																		<td>Item1</td>
																		<td>Ante turpis integer aliquet porttitor.</td>
																		<td>29.99</td>
																</tr>
																<tr>
																		<td>Item2</td>
																		<td>Vis ac commodo adipiscing arcu aliquet.</td>
																		<td>19.99</td>
																</tr>
																<tr>
																		<td>Item3</td>
																		<td>Morbi faucibus arcu accumsan lorem.</td>
																		<td>29.99</td>
																</tr>
																<tr>
																		<td>Item4</td>
																		<td>Vitae integer tempus condimentum.</td>
																		<td>19.99</td>
																</tr>
																<tr>
																		<td>Item5</td>
																		<td>Ante turpis integer aliquet porttitor.</td>
																		<td>29.99</td>
																</tr>
														</tbody>
												</table>
										</div>
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





