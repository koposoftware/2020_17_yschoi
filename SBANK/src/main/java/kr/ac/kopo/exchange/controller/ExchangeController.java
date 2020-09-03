package kr.ac.kopo.exchange.controller;

import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.kopo.account.service.AccountService;
import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.exchange.service.ExchangeService;
import kr.ac.kopo.exchange.vo.CurlistVO;
import kr.ac.kopo.exchange.vo.CurrencyVO;
import kr.ac.kopo.exchange.vo.ExchangeVO;
import kr.ac.kopo.exchange.vo.ReserveVO;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.reply.vo.ReplyVO;


@Controller
public class ExchangeController {
	
	
	
	@Autowired
	private ExchangeService exchangeService;
	
	@Autowired
	private AccountService accountService;
	
	
	/**
	 * 환율정보 보여주기
	 * 
	 * @return 환율정보들
	 */
	@RequestMapping("/rate/rateInfo")
	public ModelAndView selectAll() {
		System.out.println("ExchangeController - selectAll 진입");
		List<CurrencyVO> currencyList = exchangeService.selectAllCurrency();

		ModelAndView mav = new ModelAndView("rate/rateInfo");
		mav.addObject("currencyList", currencyList);

		return mav;
	}

	/**
	 * 환전가이드 보여주기
	 * 
	 * @return
	 */
	@GetMapping("/exchange/guide")
	public String guide() {
		return "exchange/guide";
	}

	/**
	 * 환전하기폼 보여주기
	 * 
	 * @return
	 */
	@GetMapping("/exchange/doExchange")
	public String doExchangeForm() {
		return "exchange/doExchange";
	}	
	
	/**
	 * 환전하기
	 * @param exchangeVO
	 * @param session
	 * @return
	 */
	@PostMapping("/exchange/doExchange")
	public String doExchange(ExchangeVO exchangeVO, HttpSession session,@RequestParam("bank_name") String bank_name) {
	  
	  System.out.println("비밀번호 : "+bank_name);
	  AccountVO chkVO = new AccountVO();
	  chkVO.setAccount_num(exchangeVO.getAccount_num());
	  chkVO.setBank_name(bank_name);
	  System.out.println(chkVO);
	  
	  int result = accountService.chkPassword(chkVO);
	  //System.out.println("비번 확인 후 record 수 : " + result);
	  
/*	  if(result == 0 ) { //비밀번호가 틀리면
	    System.out.println("비밀번호를 확인하세요.");
	    return "exchange/guide";
	  }*/
	  //else {  // 비밀번호가 맞으면
	  
	  
		MemberVO userVO = (MemberVO) session.getAttribute("loginVO"); //자바에서로그인아이디가져오기
		String id = userVO.getId();
		exchangeVO.setId(id);
		
		
		exchangeService.doExchange(exchangeVO); // 환전하기
		
	  //}
		return "exchange/guide";
	  
	}

	/**
	 * 환전예약하기 폼 보여주기
	 * @return
	 */
	@GetMapping("/exchange/doReserve")
	public String doReserveForm() {
		return "exchange/doReserve";
	}
	
	
	/**
	 * 환전예약하기 기능
	 */
	@PostMapping("/exchange/doReserve")
	public String doReserve(ReserveVO reserveVO, HttpSession session,@RequestParam("bank_name") String bank_name) {
	  
	  System.out.println("비밀번호 : "+bank_name);
    AccountVO chkVO = new AccountVO();
    chkVO.setAccount_num(reserveVO.getAccount_num());
    chkVO.setBank_name(bank_name);
    System.out.println(chkVO);
    int result = accountService.chkPassword(chkVO);
    System.out.println("비번 확인 후 record 수 : " + result);
    
    
//    if(result == 0 ) {
//      System.out.println("비밀번호를 확인하세요.");
//      return "exchange/guide";
//    }else {
	  
	  
	  MemberVO userVO = (MemberVO) session.getAttribute("loginVO"); //자바에서로그인아이디가져오기
    String id = userVO.getId();
    reserveVO.setId(id);
    
	  System.out.println(reserveVO);
	  exchangeService.doReserve(reserveVO);
//    }
	  return "exchange/guide";
	}
	
	
	/**
	 * 비회원환전하기 홈페이지 띄어주기
	 * @return
	 */
	@GetMapping("/exchange/doExchangeKakao")
	public String doExchangeKakaoForm() {
    return "exchange/doExchangeKakao";
  } 
	
	/**
	 * 비회원환전하기 폼 입력창 -> 카카오페이.jsp로 보내는 로직
	 * @param exchangeVO
	 * @return
	 */
	@PostMapping("/exchange/doExchangeKakao")
	public ModelAndView doExchangeKakao(ExchangeVO exchangeVO) {
	  
	  Random r = new Random();
	  
	  String uid ="";
	  
	  for(int i=0; i<4 ; i++) {
	    uid += Integer.toString(r.nextInt(10));
	  }
	  
	  uid += "_";
	  
	  uid += new Date().getTime();
	  
	  String charge_str = exchangeVO.getExchangecharge();
	  
	  double charge = Math.round(Double.parseDouble(charge_str));
	  
	  String final_charge = Double.toString(charge);
	  
	  exchangeVO.setExchangecharge(final_charge); // 카카오페이는 소숫점 이하에 대한 값 에러띄움

	  
	  exchangeVO.setAccount_num(uid); //계좌번호에 결제 시 필요한 uid값 담아서 보내기
	  
	  System.out.println(exchangeVO);

	  ModelAndView mav = new ModelAndView("exchange/kakaoPay");
	  mav.addObject("exchangeVO", exchangeVO);
	  
    return mav;
  } 
	
	
	
	 /**
   * 환전 & 환전 내역 보기
   * @param session
   * @return
   */
  @GetMapping("/exchange/myExchange")
  public ModelAndView myExchange(HttpSession session) {

    MemberVO userVO = (MemberVO) session.getAttribute("loginVO"); //자바에서로그인아이디가져오기
    String id = userVO.getId();

    List<ExchangeVO> exchangeList = exchangeService.selectExchange(id); // 환전내역 가져오기
    List<ReserveVO> reserveList = exchangeService.selectReserve(id); //환전 예약 내역 가져오기

    ModelAndView mav = new ModelAndView("account/myExchange");
    mav.addObject("exchangeList", exchangeList);
    mav.addObject("reserveList", reserveList);
    
//  for(ReserveVO account : reserveList) {
//    System.out.println(account);
//  }
    

    return mav;
  }
  
  
  /**
   * 보유외화 보기
   * @param session
   * @return
   */
  @GetMapping("/account/myCurrency")
  public ModelAndView myCurrency(HttpSession session) {
    
    MemberVO userVO = (MemberVO) session.getAttribute("loginVO"); //자바에서로그인아이디가져오기
    String id = userVO.getId();
    
    List<CurlistVO> curlist =  exchangeService.selectCurrency(id);
    
    ModelAndView mav = new ModelAndView("account/myCurrency");
    mav.addObject("curlist", curlist);
    
    /*
     * for(CurlistVO account : curlist) { System.out.println(account); }
     */
    
    return mav;
  }
  
  
	
	
	
	

}
