<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>



<%@ include file="/WEB-INF/jsp/include/head.jsp"%>

<style>
th {
  background-color: #f4f8f9;
  font-size: 15px !important;
  font-weight: 600 !important;
}
</style>


<!-- 수정할부분 시작 -->
<section>

  <div class="container class="col-xl-12"">
    <div class="row">
      <div class="col-xl-12">
        <!-- <div class="section_title text-center mb-50"> -->
        <header class="section_title mb-50 major" >
          <h3>보유 외화 조회</h3>
        </header>
      </div>
    </div>
    

    
    <div class="table-wrapper">
      <c:forEach items="${curlist}" var="account" varStatus="loop">
        <form action="${pageContext.request.contextPath }/" method="post" id="formm">
          <table border="1" class="table table-bordered">
            <thead>
            <tr>
              <th>계좌번호</th>
              <th>별명</th>
              <th>개설일자</th>
            </tr>
            </thead>
            <tbody>
              <td>${account.account_num}</td>
              <td>${account.currencycode}</td>
              <td>${account.balance}</td>
            </tbody>

          </table>
        </form>
        <br>
      </c:forEach>
    </div>
    
    

  </div>

</section><br><br><br><br><br>
<!-- 수정할부분 끝 -->




<%@ include file="/WEB-INF/jsp/include/foot.jsp"%>