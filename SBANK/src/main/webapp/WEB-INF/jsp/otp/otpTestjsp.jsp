<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.File, java.util.UUID" %>  
<%@ page import="java.awt.image.BufferedImage, javax.imageio.ImageIO" %>  
<%@ page import="com.google.zxing.qrcode.QRCodeWriter, com.google.zxing.common.BitMatrix, com.google.zxing.BarcodeFormat, com.google.zxing.client.j2se.MatrixToImageWriter" %>  

<%@ include file="/WEB-INF/jsp/include/head.jsp"%>
<script>
$(document).ready(function() {
  
  
  
  $(document).on("keyup","#user_code",function(){  // 구글 OTP인증코드 적으면 함수
    var ipt = $(this).val()
    console.log(ipt);
    var keyofgoogle = $('#encodedKey').val();
    
    if(ipt.length == 6){
      console.log('6');
      console.log(keyofgoogle);
      
      $.ajax({
        url : '${ pageContext.request.contextPath }/otp/chkk',
        type : 'post',
        data : {
          encodedKey : keyofgoogle,
          user_code : ipt
        },
        async:false,
        success : function(data) {
          result = JSON.parse(data);
          console.log(result);
          
          if(result=='true'){
            $("#setresult").text('');
            $("input[type=submit]").prop('disabled',false);
            $("#setresult").text('인증에 성공하였습니다. OTP코드저장버튼을 눌려주세요.');
            $("#setresult").css("fontSize","20px");
          } else{
            $("#setresult").text('');
            $("#setresult").text('인증코드를 확인하여주세요');
            $("#setresult").css("fontSize","20px");
          }

          return false;
        }, 
        error : function() {
          alert('실패nnnn')
        }
      });
    }
    
  });// 구글 OTP인증코드 적으면 함수 끝
});
</script>
<style>

</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<%  
   /*  String url = request.getParameter("url");  
    int nCheck = 1;  
    String savedFileName = "";  
  
    // url 확인  
    if (url == null || url.equals("") || !url.startsWith("http")) {  
        nCheck = 0;  
    }  
    else {  
        // 파일 설정  
        File path = new File("C:\\Users\\cysun31\\git\\2020_17_yschoi\\SBANK\\src\\main\\webapp\\resources\\upload");  
        savedFileName = UUID.randomUUID().toString().replace("-", "");  
        if (!path.exists()) path.mkdirs();  
          
        // QRCode 생성  
        QRCodeWriter writer = new QRCodeWriter();  
        BitMatrix qrCode = writer.encode(url, BarcodeFormat.QR_CODE, 200, 200);  
          
        BufferedImage qrImage = MatrixToImageWriter.toBufferedImage(qrCode);  
          
        ImageIO.write(qrImage, "PNG", new File(path, savedFileName+".png"));  
    } */
%> 


<section>
  <div class="container class="col-xl-12">
    <div class="row">
      <div class="col-xl-12">
        <!-- <div class="section_title text-center mb-50"> -->
        <header class="section_title mb-50 major">
          <h3>Google OTP 연동</h3>
        </header>
      </div>
    </div>
    
    
   <span style="font-size: 20px;">인증키 입력 혹은 QR코드를 인식하여 인증을 진행하여주세요.</span><br><br>
    
        인증키 : ${encodedKey } <br>
       <%--  당신의 바코드 주소는 → <a href="${url }" target="_blank"> QR코드로 확인하기 </a> 입니다. <br><br>  --%>
   <%-- <img src="${pageContext.request.contextPath }/resources/upload/${savedFileName}"> --%>
   <img src="${url}">
   <br>

<%  
    /* if (nCheck == 1) {  
        String qrcode = request.getContextPath() + "/qrcode/images/" + savedFileName + ".png";  
        out.print("<img src='" + qrcode + "'/><p/>");  
    }  
    else {  
        out.print("잘못된 URL 입니다.<p/>");  
    }  */ 
%> 
   
   <br><br>
       인증코드 입력  <input id="user_code" name="user_code" type="text" autocomplete=off class="form-control" aria-describedby="inputGroupSuccess1Status" style="width: 30%;">
   <form action="<%=request.getContextPath() %>/otp/save" method="post">
      <input name="encodedKey" id="encodedKey" type="hidden" readonly="readonly" value="${encodedKey }" ><br><br>
      <input type="submit" value="OTP코드저장" disabled="disabled" class="btn btn-outline-dark pull-right" >
   </form>
   
   <span id="setresult" name="setresult" ></span><br>
    
    
    
    
    
    
    
    
    
    
    
    
    
  </div>
</section><br><br><br><br><br>
<!-- 수정할부분 끝 -->




<%@ include file="/WEB-INF/jsp/include/foot.jsp"%>








