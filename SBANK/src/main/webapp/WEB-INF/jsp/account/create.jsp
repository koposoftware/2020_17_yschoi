<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<%@ include file="/head.jsp"%>


								<!-- Section -->
								<section>
										<header class="major">
												<h2>계좌 개설</h2>
										</header>
										<form:form commandName="accountVO" method="post">
												<!-- commandName과 관련이 있는 form이다. 명시해주자 -->
												<table border="1" style="width: 80%">
														<tr>
																<th width="23%">아이디</th>
																<td>
																		<%-- <form:input path="id"/>   --%> ${loginVO.id } <form:hidden path="id" value="${loginVO.id }" />
																</td>
														</tr>
														<tr>
																<th width="23%">개설은행</th>
																<td><form:input path="bank_name" /> <form:errors path="bank_name" cssStyle="color :red;" /></td>
														</tr>
														<tr>
																<th width="23%">첫입금액</th>
																<td><form:input path="balance" /> <form:errors path="balance" cssStyle="color :red;" /></td>
														</tr>
														<tr>
																<th width="23%">계좌별칭</th>
																<td><form:input path="nick_name" /> <form:errors path="nick_name" cssStyle="color :red;" /></td>
														</tr>
												</table>
												<button>등록</button>
										</form:form>
										<br> <br> <br>
										<form method="post" action="#">
												<div class="row gtr-uniform">
														<div class="col-6 col-12-xsmall">
																<input type="text" name="demo-name" id="demo-name" value="" placeholder="Name" />
														</div>
														<div class="col-6 col-12-xsmall">
																<input type="email" name="demo-email" id="demo-email" value="" placeholder="Email" />
														</div>
														<!-- Break -->
														<div class="col-12">
																<select name="demo-category" id="demo-category">
																		<option value="">- Category -</option>
																		<option value="1">Manufacturing</option>
																		<option value="1">Shipping</option>
																		<option value="1">Administration</option>
																		<option value="1">Human Resources</option>
																</select>
														</div>
														<!-- Break -->
														<div class="col-4 col-12-small">
																<input type="radio" id="demo-priority-low" name="demo-priority" checked> <label for="demo-priority-low">Low</label>
														</div>
														<div class="col-4 col-12-small">
																<input type="radio" id="demo-priority-normal" name="demo-priority"> <label for="demo-priority-normal">Normal</label>
														</div>
														<div class="col-4 col-12-small">
																<input type="radio" id="demo-priority-high" name="demo-priority"> <label for="demo-priority-high">High</label>
														</div>
														<!-- Break -->
														<div class="col-6 col-12-small">
																<input type="checkbox" id="demo-copy" name="demo-copy"> <label for="demo-copy">Email me a copy</label>
														</div>
														<div class="col-6 col-12-small">
																<input type="checkbox" id="demo-human" name="demo-human" checked> <label for="demo-human">I am a human</label>
														</div>
														<!-- Break -->
														<div class="col-12">
																<textarea name="demo-message" id="demo-message" placeholder="Enter your message" rows="6"></textarea>
														</div>
														<!-- Break -->
														<div class="col-12">
																<ul class="actions">
																		<li><input type="submit" value="Send Message" class="primary" /></li>
																		<li><input type="reset" value="Reset" /></li>
																</ul>
														</div>
												</div>
										</form>
								</section>
								
<%@ include file="/foot.jsp"%>					