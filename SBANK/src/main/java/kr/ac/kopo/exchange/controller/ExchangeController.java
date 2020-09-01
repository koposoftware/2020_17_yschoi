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

import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.exchange.service.ExchangeService;
import kr.ac.kopo.exchange.vo.CurrencyVO;
import kr.ac.kopo.exchange.vo.ExchangeVO;
import kr.ac.kopo.exchange.vo.ReserveVO;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.reply.vo.ReplyVO;


@Controller
public class ExchangeController {
	
	
	
	@Autowired
	private ExchangeService exchangeService;
	
	
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
	public String doExchange(ExchangeVO exchangeVO, HttpSession session) {
		
		MemberVO userVO = (MemberVO) session.getAttribute("loginVO"); //자바에서로그인아이디가져오기
		String id = userVO.getId();
		
		exchangeVO.setId(id);
		
		//System.out.println("환전하기 컨트롤러");
		//System.out.println(exchangeVO);
		
		exchangeService.doExchange(exchangeVO);
		
		
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
	public void doReserve(ReserveVO reserveVO, HttpSession session, @RequestParam("password") String password) {
	  MemberVO userVO = (MemberVO) session.getAttribute("loginVO"); //자바에서로그인아이디가져오기
    String id = userVO.getId();
    
    reserveVO.setId(id);
    
    System.out.println("password : "+password);
	  System.out.println(reserveVO);
	  
	  exchangeService.doReserve(reserveVO);
	  
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
	

}
