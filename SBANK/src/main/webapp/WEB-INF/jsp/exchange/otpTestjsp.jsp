<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.File, java.util.UUID" %>  
<%@ page import="java.awt.image.BufferedImage, javax.imageio.ImageIO" %>  
<%@ page import="com.google.zxing.qrcode.QRCodeWriter, com.google.zxing.common.BitMatrix, com.google.zxing.BarcodeFormat, com.google.zxing.client.j2se.MatrixToImageWriter" %>  

<%  
    String url = request.getParameter("url");  
    int nCheck = 1;  
    String savedFileName = "";  
  
    // url 확인  
    if (url == null || url.equals("") || !url.startsWith("http")) {  
        nCheck = 0;  
    }  
    else {  
        // 파일 설정  
        File path = new File(application.getRealPath("/") + "/resources/upload/qrcode/images/");  
        savedFileName = UUID.randomUUID().toString().replace("-", "");  
        if (!path.exists()) path.mkdirs();  
          
        // QRCode 생성  
        QRCodeWriter writer = new QRCodeWriter();  
        BitMatrix qrCode = writer.encode(url, BarcodeFormat.QR_CODE, 200, 200);  
          
        BufferedImage qrImage = MatrixToImageWriter.toBufferedImage(qrCode);  
          
        ImageIO.write(qrImage, "PNG", new File(path, savedFileName+".png"));  
    }  
%> 
당신의 키는 → ${encodedKey } 입니다. <br>
당신의 바코드 주소는 → ${url} 입니다. <br><br>

<%  
    if (nCheck == 1) {  
        String qrcode = request.getContextPath() + "/qrcode/images/" + savedFileName + ".png";  
        out.print("<img src='" + qrcode + "'/><p/>");  
    }  
    else {  
        out.print("잘못된 URL 입니다.<p/>");  
    }  
%> 
 
<form action="<%=request.getContextPath() %>/otp/chk" method="post">
    code : <input name="user_code" type="text"><br><br>
     
    <input name="encodedKey" type="hidden" readonly="readonly" value="${encodedKey }"><br><br>
    <input type="submit" value="전송!">
     
</form>