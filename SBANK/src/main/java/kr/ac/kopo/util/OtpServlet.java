package kr.ac.kopo.util;


import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.apache.commons.codec.binary.Base32;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

@Controller
public class OtpServlet  {
  
    @ResponseBody
    @GetMapping("/otp/genn")
    public List<String> genotpppp() throws WriterException, IOException{
      
      
      
      // Allocating the buffer
//    byte[] buffer = new byte[secretSize + numOfScratchCodes * scratchCodeSize];
      byte[] buffer = new byte[5 + 5 * 5];
       
      // Filling the buffer with random numbers.
      // Notice: you want to reuse the same random generator
      // while generating larger random number sequences.
      new Random().nextBytes(buffer);

      // Getting the key and converting it to Base32
      Base32 codec = new Base32();
//    byte[] secretKey = Arrays.copyOf(buffer, secretSize);
      byte[] secretKey = Arrays.copyOf(buffer, 5);
      byte[] bEncodedKey = codec.encode(secretKey);
       
      // 생성된 Key!
      String encodedKey = new String(bEncodedKey);
       
      System.out.println("encodedKey : " + encodedKey);
//      System.out.println("len(encodedKey) : " + encodedKey.length());
       
//    String url = getQRBarcodeURL(userName, hostName, secretKeyStr);
      // userName과 hostName은 변수로 받아서 넣어야 하지만, 여기선 테스트를 위해 하드코딩 해줬다.
      String url = getQRBarcodeURL("cysun31", "SBANK", encodedKey); // 생성된 바코드 주소!
      System.out.println("URL : " + url);
      
      
      
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
          System.out.println("savedFileName : qr  : "+savedFileName);
      }  
       
      List<String> list = new ArrayList<String>();
      list.add(encodedKey);
      list.add(url);
      list.add(savedFileName);
      
//      mav.addObject("encodedKey", encodedKey);
//      mav.addObject("url", url);
//      mav.addObject("savedFileName", savedFileName);

       
      return list;
       
  
    }
  
    
  
    
    @GetMapping("/otp/gen")
    public ModelAndView genotppp() throws WriterException, IOException{
      ModelAndView mav = new ModelAndView("otp/otpTestjsp");
             
         
        // Allocating the buffer
//      byte[] buffer = new byte[secretSize + numOfScratchCodes * scratchCodeSize];
        byte[] buffer = new byte[5 + 5 * 5];
         
        // Filling the buffer with random numbers.
        // Notice: you want to reuse the same random generator
        // while generating larger random number sequences.
        new Random().nextBytes(buffer);
 
        // Getting the key and converting it to Base32
        Base32 codec = new Base32();
//      byte[] secretKey = Arrays.copyOf(buffer, secretSize);
        byte[] secretKey = Arrays.copyOf(buffer, 5);
        byte[] bEncodedKey = codec.encode(secretKey);
         
        // 생성된 Key!
        String encodedKey = new String(bEncodedKey);
         
        System.out.println("encodedKey : " + encodedKey);
        System.out.println("len(encodedKey) : " + encodedKey.length());
         
//      String url = getQRBarcodeURL(userName, hostName, secretKeyStr);
        // userName과 hostName은 변수로 받아서 넣어야 하지만, 여기선 테스트를 위해 하드코딩 해줬다.
        String url = getQRBarcodeURL("cysun31", "SBANK", encodedKey); // 생성된 바코드 주소!
        System.out.println("URL : " + url);
        
        
        
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
            System.out.println("savedFileName : qr  : "+savedFileName);
        }  
         
        
        mav.addObject("encodedKey", encodedKey);
        mav.addObject("url", url);
        mav.addObject("savedFileName", savedFileName);

         
        return mav;
         
    }
     
    public static String getQRBarcodeURL(String user, String host, String secret) {
        String format = "http://chart.apis.google.com/chart?cht=qr&amp;chs=300x300&amp;chl=otpauth://totp/%s@%s%%3Fsecret%%3D%s&amp;chld=H|0";
         
        return String.format(format, user, host, secret);
    }
     
}