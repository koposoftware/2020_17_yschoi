<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>



<%@ include file="/WEB-INF/jsp/include/head.jsp"%>

<script type="text/javascript">
  function goWriteForm() {
    location.href = "${ pageContext.request.contextPath }/board/write"
  }
  function doAction(boardNo) {
    //location.href="${ pageContext.request.contextPath }/board/detail?no="+boardNo;
    location.href = "${ pageContext.request.contextPath }/board/" + boardNo; //REST방식
  }
</script>




<!-- 수정할부분 시작 -->
<section>

  <div class="container class="col-xl-12"">
    <div class="row">
      <div class="col-xl-12">
        <!-- <div class="section_title text-center mb-50"> -->
        <header class="section_title mb-50 major" >
          <h3> Q & A </h3>
        </header>
      </div>
    </div>
    

    
    <div class="table-wrapper">
            <table border="1" class="table table-bordered">
                <tr>
                    <th width="6%">번호</th>
                    <th>제목</th>
                    <th width="16%">글쓴이</th>
                    <th width="15%">등록일</th>
                    <th width="8%">조회수</th>
                </tr>
                <c:forEach items="${ boardList }" var="board" varStatus="loop">
                    <tr <c:if test="${ loop.count mod 2 eq 0}"> class="even" </c:if>>
                        <td>${board.no}</td>
                        <c:choose>
                            <c:when test="${ not empty resultVO  }">
                                <td>
                                    <%-- <a href="viewCnt.jsp?no=${ board.no }"> --%> <a href="datail.jsp?type=list&no=${ board.no }"> <c:out value="${ board.title }" />
                                </a>
                                </td>
                            </c:when>
                            <c:otherwise>
                                <td><a href="javascript:doAction(${ board.no })"> <c:out value="${ board.title }" />
                                </a></td>
                            </c:otherwise>
                        </c:choose>
                        <td>${ board.writer }</td>
                        <td>${ board.regDate }</td>
                        <td>${ board.viewCnt }</td>
                    </tr>
                </c:forEach>
            </table>
            <br>
            <c:if test="${ not empty loginVO }">
                <button onclick="goWriteForm()">새글등록</button>
                <!--인라인 방식의 이벤트 처리-->
                <!--  button 등으로 이벤트 넣으려면 js나 jquery 필요!! -->
            </c:if>
    </div>
    
    
    
    

    

  </div>

</section><br><br><br><br><br>
<!-- 수정할부분 끝 -->




<%@ include file="/WEB-INF/jsp/include/foot.jsp"%>


