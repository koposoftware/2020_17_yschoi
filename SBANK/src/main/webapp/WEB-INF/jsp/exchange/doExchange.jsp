<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE HTML>
<!--
  Editorial by HTML5 UP
  html5up.net | @ajlkn
  Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>SBANK</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
/* function chageCurrencySelect(){
  var currencySelect = document.getElementById("currency");
  
  // select element에서 선택된 option의 value가 저장된다. 
  var currencyCode = currencySelect.options[currencySelect.selectedIndex].value; 
  alert(currencyCode)
 } */
 
 $(document).ready(function() {
  $('#currency').change(function() {
    let currency = $(this).val(); // 통화
    alert(currency)
    $.ajax({
      url : '${ pageContext.request.contextPath }/exchange/getRateCommission',
      type : 'post',
      data : {
        currency : currency
      }, 
      success : function() {
        
        getReplyList();
      }, 
      error : function() {
        alert('실패')
      }, complete : function() {
        document.rform.writer.value = '';
        document.rform.content.value = '';
      }
    })
  })
})




</script>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/${pageContext.request.contextPath }/resources/${pageContext.request.contextPath }/resources/css/main.css" />
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
												<h2>환전하기</h2>
										</header>

										
										
										
										<form method="post" action="#">
										<table>
										  <tr>
										    <th>통화종류</th>
										      <td><select name="currency" id="currency" onchange="chageCurrencySelect()">
																		<option value="" selected disabled>- Category -</option>
																		<option value="USD" selected>미국달러(USD)</option>
																		<option value="EUR">유럽유로(EUR)</option>
																		<option value="JPY">일본엔(JPY)</option>
																		<option value="GBP">영국파운드(GBP)</option>
														</select>
												</td>
										  </tr>
										  <tr>
										    <th>환전금액(외화)</th>
										    <td><input type="text" id="a" name="a" value="5,000"></td>
										  </tr>
										  <tr>
										    <th>현재 고시환율(원)</th>
										    <td>1,206.75</td>
										  </tr>
										  <tr>
										    <th>우대 적용환율(원)</th>
										    <td>1,192.22</td>
										  </tr>
										  <tr>
										    <th>우대율(%)</th>
										    <td>70%</td>
										  </tr>
										  <tr>
										    <th>환전금액(원)</th>
										    <td>5,961,100</td>
										  </tr>
										  <tfoot>
										    <tr>
										      <td colspan="2">gfgf</td>
										    </tr>
										  </tfoot>
										</table>
										</form>
										
										
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