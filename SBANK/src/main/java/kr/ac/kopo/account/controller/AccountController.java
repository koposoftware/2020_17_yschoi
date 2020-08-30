package kr.ac.kopo.account.controller;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.kopo.account.service.AccountService;
import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.member.vo.MemberVO;

@Controller
public class AccountController {

	@Autowired
	private AccountService accountService;
	
	/**
	 * 계좌 생성 폼 띄어주기
	 * @param model
	 * @param session
	 * @return
	 */
	@GetMapping("/account/create")
	public String writeForm(Model model, HttpSession session) {
		
		
		
		model.addAttribute("accountVO", new AccountVO()); // REQUEST영역에 boardVO이름으로 올린다.

		return "account/create";
	}
	
	/**
	 * 계좌생성 process
	 * @param account
	 * @return
	 */
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
	
	/**
	 * 나의 전체  계좌 조회
	 * @param session
	 * @return
	 */
	@GetMapping("/account/myAccount")
	public ModelAndView myAccount(HttpSession session) {

		MemberVO userVO = (MemberVO) session.getAttribute("loginVO"); //자바에서로그인아이디가져오기

		String id = userVO.getId();

		List<AccountVO> accountList = accountService.selectAccount(id);

		ModelAndView mav = new ModelAndView("account/myAccount");
		mav.addObject("accountList", accountList);
		
//		for(AccountVO account : accountList) {
//			System.out.println(account);
//		}
		
		
		return mav;

	}
	
	
	@GetMapping("/account/myAccount2")
	public ModelAndView myAccount2(HttpSession session) {

		MemberVO userVO = (MemberVO) session.getAttribute("loginVO");

		String id = userVO.getId();

		List<AccountVO> accountList = accountService.selectAccount(id);

		ModelAndView mav = new ModelAndView("account/myAccount2");
		mav.addObject("accountList", accountList);
		
//		for(AccountVO account : accountList) {
//			System.out.println(account);
//		}
		
		
		return mav;

	}
	
	
	
	@PostMapping("/account/accountTransfer")
	public String accountTransfer(Model model, @RequestParam("account_num") String account_num) {
		//System.out.println("account_num : "+account_num);
		
		AccountVO accountVO = new AccountVO();
		accountVO.setAccount_num(account_num);
		
		model.addAttribute("accountVO", accountVO); // REQUEST영역에 boardVO이름으로 올린다.
		return "account/accountTransfer";
	}
	
	@PostMapping("/account/accountTransferProcess")
	public String accountTransferProcess(@RequestParam("account_num") String account_num, @RequestParam("bank_name") String bank_name, @RequestParam("balance") int balance ) {

		
		AccountVO accountVO = new AccountVO();
		accountVO.setAccount_num(account_num);  //돈 빠질 계좌
		accountVO.setBank_name(bank_name);      //돈 들어갈 계좌
		accountVO.setBalance(balance);          //입금 & 출금액
		
		System.out.println(accountVO);
		
		accountService.transfer(accountVO);
		
	
		return "redirect:/account/myAccount";
	}
	

}
