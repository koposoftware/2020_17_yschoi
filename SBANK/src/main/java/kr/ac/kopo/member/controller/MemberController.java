package kr.ac.kopo.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.kopo.member.service.MemberService;

import kr.ac.kopo.member.vo.MemberVO;

//이거가 원본. string 버전!

@SessionAttributes({"loginVO"}) //modelAndView에 객체가 등록될 때 이름이 loginVO이면 session영역에 올려라. 배열로 들어올수 있는데 지금은 1개만 등록함.
@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;

	@GetMapping("/login")
	public String loginForm() {
		return "/member/login";
	}
	
	@PostMapping("/login")
	public ModelAndView login(MemberVO member, HttpSession session) {

		MemberVO loginVO = memberService.login(member);

		ModelAndView mav = new ModelAndView();

		if (loginVO == null) {  //로그인 실패
			mav.setViewName("redirect:/login");

		} else { //로그인 성공 시
		  
		  System.out.println("aaaaaaaaaa 인터셉터 지나가나여???");

			String dest = (String) session.getAttribute("dest");
			memberService.setCntPlusNormal();

			if (dest == null) {
				mav.setViewName("redirect:/");
			} else {
				mav.setViewName("redirect:" + dest);
				session.removeAttribute("dest");
			}
			mav.addObject("loginVO", loginVO);

		}
		System.out.println(loginVO);

		return mav;
	}
	
	
	@GetMapping("/kakaologin/{kid}")
  public String kakaologin(@PathVariable("kid") String kid, HttpSession session) {
	  
	  MemberVO loginVO = new MemberVO();
	  
	  loginVO.setId(kid);
	  loginVO.setType("K");
	  loginVO.setPassword(kid);
	  memberService.setCntPlusKakao();
	  
	  System.out.println("kid in controller "+kid);

    /* MemberVO loginVO = memberService.login(processVO); */

    
    session.setAttribute("loginVO", loginVO);


    

    return "redirect:/";
  }
	

	
	
	
	@RequestMapping("/logout")
	public String logout(SessionStatus status) { // 세션의 상태 확인 세션에 등록된 객체가 있는지?
		status.setComplete(); //세션에 등록된거 다 지워. 
		return "redirect:/";
	}
	
	
	
	
	@PostMapping("/otp/save")
	public String otpCodeSave(String encodedKey,HttpSession session) {
	  MemberVO member = new MemberVO();
	  member.setOtpcode(encodedKey);
	  MemberVO userVO = (MemberVO) session.getAttribute("loginVO"); //자바에서로그인아이디가져오기
    String id = userVO.getId();
	  member.setId(id);
	  memberService.otpCodeSave(member);
	  return "redirect:/";
	}
	
	
	
	
	
	
	@ExceptionHandler(Exception.class)
  public String handleNotFoundException5() {
    System.out.println("member  모든 에러????????"); ///////이거 먹음
    return "error/404";
  }
	
	
	
	
	
	
	
	
	
	
	
	
}

