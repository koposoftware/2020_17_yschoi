<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>



<%@ include file="/WEB-INF/jsp/include/head.jsp"%>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<script type="text/javascript">
  function goWriteForm() {
    location.href = "${ pageContext.request.contextPath }/board/write"
  }
  function doAction(boardNo) {
    //location.href="${ pageContext.request.contextPath }/board/detail?no="+boardNo;
    location.href = "${ pageContext.request.contextPath }/board/" + boardNo; //REST방식
  }
  
  $(document).ready(function() {
    
    
    $(".modal_show").click(function() {
      var idd =$(this).attr('id');
      //alert(idd); 
      
      $(".modal-title").append("활성화여부 수정하기");
      /* var str = '<input type="hidden" id="no" name="no" value="'+name+'" >'; */
      var str = '활성화 여부를 수정하시겠습니까?<br>';
      $(".modal-body").append(str);
      $("#exampleModal").modal("show");
      

      $("#close_submit").click(function() {
        /* alert(idd); */
            $("#exampleModal").modal("hide");
            $(".modal-title").empty();
            $(".modal-body").empty();
            location.href = '/SBANK/board/changeStatus?no=' + idd;
      });

      no = "";
      name = "";
      str = "";
    });

    $("#close_cancel").click(function() {
      $("#exampleModal").modal("hide");
      $(".modal-title").empty();
      $(".modal-body").empty();
    });

  });
</script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
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
          <h3> 공지업로드 </h3>
        </header>
      </div>
    </div>
    

    
    <div class="table-wrapper">
      <c:if test="${ loginVO.type == 'M' }">
                <button class="btn btn-outline-dark" onclick="goWriteForm()">공지 등록</button><br><br>
                <!--인라인 방식의 이벤트 처리-->
                <!--  button 등으로 이벤트 넣으려면 js나 jquery 필요!! -->
      </c:if>
    
    
    
            <%-- <form method="post" action="${pageContext.request.contextPath }/board/changeStatus"> --%>
            <table border="1" class="table table-bordered ">
                <tr>
                    <th width="6%">번호</th>
                    <th>제목</th>
                    <th width="11%">글쓴이</th>
                    <th width="11%">등록일</th>
                    <th width="9%">공지기간</th>
                    <th width="9%">활성화</th>
                    <th width="9%">공지여부</th>
                    <th width="16%">활성화토글버튼</th>
                </tr>
                <c:forEach items="${ boardList }" var="board">
                  <tr>
                    <td>${board.no}</td>
                    <c:choose>
                      <c:when test="${ not empty resultVO  }">
                        <td>
                          <a href="datail.jsp?type=list&no=${ board.no }"> <c:out value="${ board.title }" /></a>
                        </td>
                      </c:when>
                      <c:otherwise>
                        <td>
                          <a href="javascript:doAction(${ board.no })"> <c:out value="${ board.title }" /></a>
                        </td>
                      </c:otherwise>
                    </c:choose>
                    <td>${ board.writer }</td>
                    <td>${ board.regDate }</td>
                    <c:choose>
                      <c:when test="${ board.viewCnt== '1' }">
                        <td>Y</td>
                      </c:when>
                      <c:otherwise>
                        <td>N</td>
                      </c:otherwise>
                    </c:choose>
                    <c:choose>
                      <c:when test="${ board.reply_cnt== '1' }">
                        <td>Y</td>
                      </c:when>
                      <c:otherwise>
                        <td>N</td>
                      </c:otherwise>
                    </c:choose>
                    <c:choose>
                      <c:when test="${ board.reply_cnt== '1'  and board.viewCnt== '1' }">
                        <td><img src="${pageContext.request.contextPath }/resources/img/board/green-light-small.png" /></td>
                      </c:when>
                      <c:otherwise>
                        <td><img src="${pageContext.request.contextPath }/resources/img/board/red-light-small.png" /></td>
                      </c:otherwise>
                    </c:choose>
                    <td>
                      <button class="btn btn-outline-dark modal_show" id="${board.no}" name="${board.no}" value="${board.no}" data-toggle="modal" data-target="#myModal">활성화여부 토글</button>
                      
                    </td>
                  </tr>
                </c:forEach>
            </table>
                
                
                <%-- <form action="${ pageContext.request.contextPath }/board/changeStatus" method="post"> --%>
                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                  <div class="modal-dialog" role="document">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"></h5>
                        <!-- 여기에 제목넣기 -->
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body"></div>
                      <!-- 여기에 내용 넣기 -->
                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="close_cancel" onclick="return false">취소</button>
                        <input type="submit" class="btn btn-success btn-md" id="close_submit" value="확인" >
                      </div>
                    </div>
                  </div>
                </div>
                <%-- </form> --%>
        
        
        
      <%-- </form> --%>
            <br>
            <c:if test="${ loginVO.type == 'M' }">
                <button class="btn btn-outline-dark" onclick="goWriteForm()">공지 등록</button>
                <!--인라인 방식의 이벤트 처리-->
                <!--  button 등으로 이벤트 넣으려면 js나 jquery 필요!! -->
            </c:if>
    </div>
    
    
    
    

    

  </div>

</section><br><br><br><br><br>
<!-- 수정할부분 끝 -->




<%@ include file="/WEB-INF/jsp/include/foot.jsp"%>


