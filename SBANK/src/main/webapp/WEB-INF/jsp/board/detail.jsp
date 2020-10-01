<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>



<%@ include file="/WEB-INF/jsp/include/head.jsp"%>

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
  function getReplyList() {
    // 해당게시물의 댓글리스트 조회 => <div id="replyList"></div> 조회데이터 업데이트
    $.ajax({
      url : '${ pageContext.request.contextPath }/reply/${ board.no }',
      type : 'get',
      success : function(data) {
        
        $('#replyList').empty();
        
        console.log(typeof data)
        let list = JSON.parse(data);
        
        $(list).each(function() {
          //console.log(this)
          
          let str = '';
          str += '<hr>';
          str += '<div>';
          str += '<strong>' + this.content + '</strong>';
          str += '(' + this.writer + ')'
          str += '&nbsp;&nbsp;&nbsp;' + this.regDate + '&nbsp;&nbsp;&nbsp;'
          str += '<button class="btn btn-outline-dark" id=' + this.no + '>삭제</button>'
          str += '</div>'
          
          $('#replyList').append(str);
        })
      }, 
      error : function() {
        alert('실패')
      }
    })
  }

  $(document).ready(function() {
    $('#replyAddBtn').click(function() {
      let content = document.rform.content.value;
      let writer = document.rform.writer.value;
      
      // /reply/insert?boardNo=12&content=aaa&writer=bbb
      $.ajax({
        url : '${ pageContext.request.contextPath }/reply',
        type : 'post',
        data : {
          boardNo : ${ board.no },
          content : content,
          writer : writer
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
  
  $(document).ready(function() {
    getReplyList();
  })
  
  $(document).ready(function() {
    $(document).on('click', '.delBtn', function() {
      
      if(!confirm('댓글을 삭제하시겠습니까?')) return;
      
      let replyNo = $(this).attr('id');
      
      $.ajax({
        url: '${ pageContext.request.contextPath }/reply/' + replyNo + '/${board.no}',
        type: 'delete',
        success : function() {
          getReplyList()
        }, error: function() {
          alert('실패')
        }
      });
      /*
      $.ajax({
        url: '${ pageContext.request.contextPath }/reply/' + replyNo,
        type: 'delete',
        success : function() {
          getReplyList()
        }, error: function() {
          alert('실패')
        }
      });
      */
    })
  })
</script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">


<!-- 수정할부분 시작 -->
<section>

  <div class="container class="col-xl-12">
    <div class="row">
      <div class="col-xl-12">
        <!-- <div class="section_title text-center mb-50"> -->
        <header class="section_title mb-50 major" >
          <h3>공지 내용 조회</h3>
        </header>
      </div>
    </div>
    

    
    <div class="table-wrapper">
            <table border="1" class="table table-bordered">
                <tr>
                    <th width="25%">번호</th>
                    <td>${ board.no }</td>
                </tr>
                <tr>
                    <th width="25%">제목</th>
                    <td><c:out value="${ board.title }" /></td>
                </tr>
                <tr>
                    <th width="25%">글쓴이</th>
                    <td><c:out value="${ board.writer }" /></td>
                </tr>
                <tr>
                    <th width="25%">내용</th>
                    <td>${ board.content }</td>
                </tr>
                <tr>
                    <th width="25%">공지 시작일</th>
                    <td>${ board.start_date }</td>
                </tr>
                <tr>
                    <th width="25%">공지 마감일</th>
                    <td>${ board.end_date }</td>
                </tr>
                <tr>
                    <th width="25%">등록일</th>
                    <td>${ board.regDate }</td>
                </tr>
                <tr>
                    <th>첨부파일</th>
                    <td><c:if test="${ not empty file }" >
                            <a href="/SBANK/resources/upload/${ file.fileSaveName }"> ${ file.fileOriName } </a>
                              (${ file.fileSize } bytes)<br>
                        </c:if></td>
                </tr>
            </table>
            <br> <input type="button" value="수정" onclick="doAction('U')" class="btn btn-outline-dark">&nbsp;&nbsp; 
                 <input type="button" value="삭제" onclick="doAction('D')" class="btn btn-outline-dark">&nbsp;&nbsp; 
                 <input type="button" value="목록" onclick="doAction('L')" class="btn btn-outline-dark">&nbsp;&nbsp; 
            <br><br>
            
            <br><br>
            
    </div>
    
    
    

    
    

  </div>

</section><br><br><br><br><br>
<!-- 수정할부분 끝 -->




<%@ include file="/WEB-INF/jsp/include/foot.jsp"%>






