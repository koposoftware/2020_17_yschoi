package kr.ac.kopo.util;


import java.util.Arrays;
import java.util.Random;
 



 
import org.apache.commons.codec.binary.Base32;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class OtpServlet  {
    
    @GetMapping("/otp/gen")
    public ModelAndView genotppp(){
      ModelAndView mav = new ModelAndView("exchange/otpTestjsp");
             
         
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
        String url = getQRBarcodeURL("hj", "company.com", encodedKey); // 생성된 바코드 주소!
        System.out.println("URL : " + url);
        
        String return_str = encodedKey+url;
        
        System.out.println(return_str);
         
        
         
//        req.setAttribute("encodedKey", encodedKey);
        mav.addObject("encodedKey", encodedKey);
        mav.addObject("url", url);
//        req.setAttribute("url", url);
         
        return mav;
         
    }
     
    public static String getQRBarcodeURL(String user, String host, String secret) {
        String format = "http://chart.apis.google.com/chart?cht=qr&amp;chs=300x300&amp;chl=otpauth://totp/%s@%s%%3Fsecret%%3D%s&amp;chld=H|0";
         
        return String.format(format, user, host, secret);
    }
     
}