<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%-- <jsp:include page="/head.jsp" />  --%>
<%@ include file="/WEB-INF/jsp/include/head.jsp"%>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
  function doWrite() {
    let f = document.wForm;
    if(f.title.value == ''){
      alert('제목을 입력하세요');
      f.title.focus();
      return false;
    }
    if(f.content.value == ''){
      alert('내용을 입력하세요');
      f.content.focus();
      return false;
    }
    
    
    //파일 확장자 체크
    if(checkExt(f.attachfile1)){
      return false;
    }
    

    
    
    return true;
  }
  
  function checkExt(obj){
    let forbidName=['exe','bat','js','class','jsp','php','sh','dll'];
    let fileName = obj.value;
    let searchIdx = fileName.lastIndexOf('.'); //인덱스 0부터 시작
    let ext = fileName.substring(searchIdx+1); // 파일의 확장자 = ext로 뽑아냄
    
    for(let i = 0 ; i <forbidName.length; i++ ){
      
      if(forbidName[i] == ext){
        alert('['+ext+'] 확장자는 파일 업로드 정책에 위배됩니다');
        obj.value='';
        return true;
      }
    }
    
    return false;
  }
  
  
  function doList() {
    location.href="list.jsp"
  }
  
  window.onload = function() {
    let btn = document.getElementById("btnList");
    btn.onclick=function(){
      location.href="list.jsp"
    }
  }
</script>


<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">



<!-- 수정할부분 시작 -->
<section>

  <div class="container class="col-xl-12"">
    <div class="row">
      <div class="col-xl-12">
        <!-- <div class="section_title text-center mb-50"> -->
        <header class="section_title mb-50 major" >
          <h3>공지 등록</h3>
        </header>
      </div>
    </div>
    
    <div class="table-wrapper">
    
      <form method="post" action="${ pageContext.request.contextPath }/board/writeIncludeFile" onsubmit="return doWrite()" 
        enctype="multipart/form-data"  name="wForm">
        <!-- commandName과 관련이 있는 form이다. 명시해주자 -->
        <table border="1" class="table table-bordered">
          <tr>
            <th width="23%">제목</th>
            <td><input type="text" id="title" name="title" class="form-control" aria-describedby="inputGroupSuccess1Status" /> 

            </td>
          </tr>
          <tr>
            <th width="23%">글쓴이</th>
            <td>${ loginVO.id }
              <input type="hidden" id="writer" name="writer" value="${ loginVO.id }"  /> 
            </td>
          </tr>
          <tr>
            <th width="23%">내용</th>
            <td>
              <textarea id="content" name="content" rows="4" cols="100" required="required" class="form-control" aria-describedby="inputGroupSuccess1Status" ></textarea> 
            </td>
          </tr>
          <tr>
            <th>공지 시작일</th>
            <td><input type="date" id="start_date" name="start_date"  required="required" class="form-control" aria-describedby="inputGroupSuccess1Status"  ></td>
          </tr>
          <tr>
            <th>공지 마감일</th>
            <td><input type="date" id="end_date" name="end_date"  required="required" class="form-control" aria-describedby="inputGroupSuccess1Status" ></td>
          </tr>
          <tr>
            <th>포스터 첨부</th>
            <td>
              <input type="file" name="attachfile1" enctype="multipart/form-data"><br>
            </td>
          </tr>
        </table>
        <button class="btn btn-outline-dark">공지 등록</button>
      </form>
    </div>
  </div>

</section><br><br><br><br><br>
<!-- 수정할부분 끝 -->





<%-- <%@ include file="/foot.jsp"%> --%>
<%@ include file="/WEB-INF/jsp/include/foot.jsp"%>









