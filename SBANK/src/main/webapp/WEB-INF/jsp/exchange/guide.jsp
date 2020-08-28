<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
  Editorial by HTML5 UP
  html5up.net | @ajlkn
  Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>SBANK</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/${pageContext.request.contextPath }/resources/${pageContext.request.contextPath }/resources/css/main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/${pageContext.request.contextPath }/resources/${pageContext.request.contextPath }/resources/css/rate-info-table.css" />
</head>
<body class="is-preload">
		<!-- Wrapper -->
		<div id="wrapper">
				<!-- Main -->
				<div id="main">
						<div class="inner">
								<!-- Header -->
								<%@ include file="/WEB-INF/jsp/include/header.jsp"%>
								<!-- 수정할부분시작 -->
								<!-- Section -->
								<section>
										<header class="major">
												<h2>환전 가이드</h2>
										</header>
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
								</section>
								<!-- 수정할부분 끝 -->
						</div>
						<!-- end of class="inner" -->
				</div>
				<!-- end of id="main" -->
				<!--  sidebar -->
				<%@ include file="/WEB-INF/jsp/include/sidebar.jsp"%>
		</div>
		<!-- end of id="wrapper" -->
</body>
</html>