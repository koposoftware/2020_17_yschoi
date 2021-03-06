package kr.ac.kopo.util;


import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
 
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base32;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.member.service.MemberService;
import kr.ac.kopo.member.vo.MemberVO;

@Controller
public class OtpResultServlet extends HttpServlet {
  
  
  @Autowired
  private MemberService memberService;
  
//구글 otp연동에서 거침
  @ResponseBody
  @PostMapping("/otp/chkk")
  public String otpchkk(String user_code, String encodedKey,HttpSession session) {
      System.out.println("==================컨트롤러진입함=====================");
      System.out.println("user_code : "+user_code);
      System.out.println("encodedKey : "+encodedKey);
      
      
//      MemberVO userVO = (MemberVO) session.getAttribute("loginVO"); //자바에서로그인아이디가져오기
//      String id = userVO.getId(); // id와 같은 record에 저장된 otpcode이제 가져오자~
//      encodedKey = memberService.getOtpCodeById(id);
      
      
//      String user_codeStr="";
      
      long user_code2 = Integer.parseInt(user_code);
      System.out.println("user_code2 : "+ user_code2);
      
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
  
  
  
    
  //환전하기 재환전하기 예약하기에서 거침
    @ResponseBody
    @PostMapping("/otp/chk")
    public String otpchk(String user_code, String encodedKey,HttpSession session) {
        System.out.println("==================/otp/chk=============/otp/chk========");
        
        MemberVO userVO = (MemberVO) session.getAttribute("loginVO"); //자바에서로그인아이디가져오기
        String id = userVO.getId(); // id와 같은 record에 저장된 otpcode이제 가져오자~
        encodedKey = memberService.getOtpCodeById(id);
        
        System.out.println(user_code);
        System.out.println(encodedKey);
//        String user_codeStr="";
        
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
 
    private static boolean check_code(String secret, long code, long t) throws NoSuchAlgorithmException, InvalidKeyException {
        Base32 codec = new Base32();
        byte[] decodedKey = codec.decode(secret);
        
        System.out.println("check_code 진입 ---------------------");
        System.out.println(secret);
        System.out.println(code);
        System.out.println(t);
 
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
        
        System.out.println("key :: "+key);
 
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
