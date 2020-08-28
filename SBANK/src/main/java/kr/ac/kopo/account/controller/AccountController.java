package kr.ac.kopo.account.controller;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.kopo.account.service.AccountService;
import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.member.vo.MemberVO;

@Controller
public class AccountController {

	@Autowired
	private AccountService accountService;

	@GetMapping("/account/create")
	public String writeForm(Model model, HttpSession session) {
		
		
		
		model.addAttribute("accountVO", new AccountVO()); // REQUEST영역에 boardVO이름으로 올린다.

		return "account/create";
	}

	@PostMapping("/account/create")
	public String addReply(AccountVO account) {
		
		String account_num="";
		Random r = new Random();
		for(int i=0; i<6 ; i++) {  /////여기여기여기 수정!
			account_num += Integer.toString(r.nextInt(10));
		}
		account.setAccount_num(account_num);
		System.out.println("accountVO" + account);
		System.out.println("controller진입");
		
		accountService.insert(account);
		return "redirect:/account/myAccount";
	}
	
	
	@GetMapping("/account/myAccount")
	public ModelAndView myAccount(HttpSession session) {

		MemberVO userVO = (MemberVO) session.getAttribute("loginVO");

		String id = userVO.getId();

		List<AccountVO> accountList = accountService.selectAccount(id);

		ModelAndView mav = new ModelAndView("account/myAccount");
		mav.addObject("accountList", accountList);
		
		for(AccountVO account : accountList) {
			System.out.println(account);
		}
		
		
		return mav;

	}

}
