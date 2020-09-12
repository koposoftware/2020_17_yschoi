package kr.ac.kopo.util;


import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
 
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import javax.servlet.http.HttpServlet;

 
import org.apache.commons.codec.binary.Base32;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class OtpResultServlet extends HttpServlet {
  
  
  @ResponseBody
  @PostMapping("/otp/chkk")
  public String otpchkk(String user_code, String encodedKey) {
      System.out.println("==================컨트롤러진입함=====================");
      System.out.println(user_code);
      System.out.println(encodedKey);
      
      String user_codeStr="";
      
      long user_code2 = Integer.parseInt(user_code);
      
      long l = new Date().getTime();
      long ll =  l / 30000;
       
      boolean check_code = false;
      try {
          // 키, 코드, 시간으로 일회용 비밀번호가 맞는지 일치 여부 확인.
          check_code = check_code(encodedKey, user_code2, ll);
      } catch (InvalidKeyException e) {
          e.printStackTrace();
      } catch (NoSuchAlgorithmException e) {
          e.printStackTrace();
      }
       
      // 일치한다면 true.
      System.out.println("결과쓰 check_code : " + check_code);
      
      if ( check_code == true ) {
        return "true"; 
      }
      else {
        return "false";
      }
  }
  
  
  
    
  
    @PostMapping("/otp/chk")
    public String otpchk(String user_code, String encodedKey) {
        System.out.println("==================컨트롤러진입함=====================");
        System.out.println(user_code);
        System.out.println(encodedKey);
        
        String user_codeStr="";
        
        long user_code2 = Integer.parseInt(user_code);
        
        long l = new Date().getTime();
        long ll =  l / 30000;
         
        boolean check_code = false;
        try {
            // 키, 코드, 시간으로 일회용 비밀번호가 맞는지 일치 여부 확인.
            check_code = check_code(encodedKey, user_code2, ll);
        } catch (InvalidKeyException e) {
            e.printStackTrace();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
         
        // 일치한다면 true.
        System.out.println("결과쓰 check_code : " + check_code);
        
        if ( check_code == true ) {
          return "redirect:/otp/gen/a"; 
        }
        else {
          return "redirect:/otp/gen";
        }
    }
 
    private static boolean check_code(String secret, long code, long t) throws NoSuchAlgorithmException, InvalidKeyException {
        Base32 codec = new Base32();
        byte[] decodedKey = codec.decode(secret);
 
        // Window is used to check codes generated in the near past.
        // You can use this value to tune how far you're willing to go.
        int window = 3;
        for (int i = -window; i <= window; ++i) {
            long hash = verify_code(decodedKey, t + i);
 
            if (hash == code) {
                return true;
            }
        }
 
        // The validation code is invalid.
        return false;
    }
     
    private static int verify_code(byte[] key, long t)
            throws NoSuchAlgorithmException, InvalidKeyException {
        byte[] data = new byte[8];
        long value = t;
        for (int i = 8; i-- > 0; value >>>= 8) {
            data[i] = (byte) value;
        }
 
        SecretKeySpec signKey = new SecretKeySpec(key, "HmacSHA1");
        Mac mac = Mac.getInstance("HmacSHA1");
        mac.init(signKey);
        byte[] hash = mac.doFinal(data);
 
        int offset = hash[20 - 1] & 0xF;
 
        // We're using a long because Java hasn't got unsigned int.
        long truncatedHash = 0;
        for (int i = 0; i < 4; ++i) {
            truncatedHash <<= 8;
            // We are dealing with signed bytes:
            // we just keep the first byte.
            truncatedHash |= (hash[offset + i] & 0xFF);
        }
 
        truncatedHash &= 0x7FFFFFFF;
        truncatedHash %= 1000000;
 
        return (int) truncatedHash;
    }
     
}
