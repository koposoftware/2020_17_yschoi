package kr.ac.kopo.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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

		if (loginVO == null) {
			mav.setViewName("redirect:/login");

		} else {

			String dest = (String) session.getAttribute("dest");

			if (dest == null) {
				mav.setViewName("redirect:/");
			} else {
				mav.setViewName("redirect:" + dest);
				session.removeAttribute("dest");
			}
			mav.addObject("loginVO", loginVO);

		}

		return mav;
	}
	
	
	@GetMapping("/kakaologin/{kid}")
  public String kakaologin(@PathVariable("kid") String kid, HttpSession session) {
	  
	  MemberVO loginVO = new MemberVO();
	  
	  loginVO.setId(kid);
	  loginVO.setType("U");
	  loginVO.setPassword(kid);
	  
	  System.out.println("kid in controller "+kid);

    /* MemberVO loginVO = memberService.login(processVO); */

    
    session.setAttribute("loginVO", loginVO);


    

    return "redirect:/";
  }
	
	@GetMapping("/kakao")
  public String kakao() {


    return "member/kakao";
  }
	
	
	
	@RequestMapping("/logout")
	public String logout(SessionStatus status) { // 세션의 상태 확인 세션에 등록된 객체가 있는지?
		status.setComplete(); //세션에 등록된거 다 지워. 
		return "redirect:/";
	}
}

