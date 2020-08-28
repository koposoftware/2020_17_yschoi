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
												<h2>환율 정보</h2>
										</header>
										<div class="table-wrapper">
												<table class="tblBasic leftNone">
														<thead>
																<tr>
																		<th class="leftNone" scope="col" rowspan="3">통화</th>
																		<th class="leftLine" scope="col" colspan="4">현찰</th>
																		<th class="leftLine" scope="col" colspan="2">송금</th>
																		<th class="leftLine" scope="col" rowspan="3">T/C<br>사실때
																		</th>
																		<th class="leftLine" scope="col" rowspan="3">외화<br>수표<br>파실때
																		</th>
																		<th class="leftLine" scope="col" rowspan="3">매매<br>기준율
																		</th>
																		<th class="leftLine" scope="col" rowspan="3">환가<br>료율
																		</th>
																		<th class="leftLine" scope="col" rowspan="3">미화<br>환산율
																		</th>
																</tr>
																<tr>
																		<th class="leftLine" scope="col" colspan="2">사실 때</th>
																		<th class="leftLine" scope="col" colspan="2">파실 때</th>
																		<th class="leftLine" scope="col" rowspan="2">보낼 때</th>
																		<th class="leftLine" scope="col" rowspan="2">받을 때</th>
																</tr>
																<tr>
																		<th class="leftLine" scope="col">환율</th>
																		<th class="leftLine" scope="col">Spread</th>
																		<th class="leftLine" scope="col">환율</th>
																		<th class="leftLine" scope="col">Spread</th>
																</tr>
														</thead>
														<tbody>
																<c:forEach items="${ currencyList }" var="cur">
																		<tr>
																				<td>${cur.currency}</td>
																				<td>${cur.cashbuyrate}</td>
																				<td>${cur.cashbuyspread}</td>
																				<td>${cur.cashsellrate}</td>
																				<td>${cur.cashsellspread}</td>
																				<td>${cur.remittance}</td>
																				<td>${cur.receive}</td>
																				<td>${cur.tcbuy}</td>
																				<td>${cur.fcsell}</td>
																				<td>${cur.basicrate}</td>
																				<td>${cur.conversion}</td>
																				<td>${cur.usdrate}</td>
																		</tr>
																</c:forEach>
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