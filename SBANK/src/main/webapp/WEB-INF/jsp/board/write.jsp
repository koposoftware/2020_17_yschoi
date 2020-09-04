<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%-- <jsp:include page="/head.jsp" />  --%>
<%@ include file="/WEB-INF/jsp/include/head.jsp"%>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>



<!-- 수정할부분 시작 -->
<section>

  <div class="container class="col-xl-12"">
    <div class="row">
      <div class="col-xl-12">
        <!-- <div class="section_title text-center mb-50"> -->
        <header class="section_title mb-50 major" >
          <h3>글 등록</h3>
        </header>
      </div>
    </div>
    <div class="table-wrapper">
            <form:form commandName="boardVO" method="post">
                <!-- commandName과 관련이 있는 form이다. 명시해주자 -->
                <table border="1" class="table table-bordered">
                    <tr>
                        <th width="23%">제목</th>
                        <td><form:input path="title" /> <form:errors path="title" cssStyle="color :red;" /></td>
                    </tr>
                    <tr>
                        <th width="23%">글쓴이</th>
                        <td><form:input path="writer" /> <form:errors path="writer" cssStyle="color :red;" /></td>
                    </tr>
                    <tr>
                        <th width="23%">내용</th>
                        <td><form:textarea path="content" rows="4" cols="100" /> <form:errors path="content" cssStyle="color :red;" /></td>
                    </tr>
                </table>
                <button class="btn btn-outline-dark">등록</button>
            </form:form>
    </div>

  </div>

</section><br><br><br><br><br>
<!-- 수정할부분 끝 -->





<%-- <%@ include file="/foot.jsp"%> --%>
<%@ include file="/WEB-INF/jsp/include/foot.jsp"%>









