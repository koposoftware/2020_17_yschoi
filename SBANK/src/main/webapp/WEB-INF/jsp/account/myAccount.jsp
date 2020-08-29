<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- <%@ include file="/WEB-INF/jsp/include/head.jsp"%> --%>
<%@ include file="/head.jsp"%>


								<section>
										<header class="major">
												<h2>내계좌</h2>
										</header>
										<div class="table-wrapper">
												<c:forEach items="${accountList}" var="account" varStatus="loop">
														<table border="1" style="width: 80%">
																<tr>
																		<th width="25%">보유은행</th>
																		<td width="25%">${account.bank_name}</td>
																		<th width="25%">개설일자</th>
																		<td width="25%">${account.reg_date}</td>
																</tr>
																<tr>
																		<th>계좌번호</th>
																		<td>${account.account_num}</td>
																		<th>별칭</th>
																		<td>${account.nick_name}</td>
																</tr>
																<tr>
																		<th>잔액</th>
																		<td>${account.balance}</td>
																		<td colspan="2">
																				<button style="width: 32.5%;" onclick="updateNcik(${account.account_num})">별칭수정하기</button>
																				<button style="width: 32.5%;" onclick="deleteAccount(${account.account_num})">계좌삭제하기</button>
																				<button style="width: 32.5%;" onclick="transferAcount(${account.account_num})">계좌이체하기</button>
																		</td>
																</tr>
														</table>
														<br>
														<%-- </c:if> --%>
												</c:forEach>
										</div>
								</section>
								<!-- 수정할부분 끝 -->

								
<%@ include file="/foot.jsp"%>								
<%-- <%@ include file="/WEB-INF/jsp/include/foot.jsp"%> --%>