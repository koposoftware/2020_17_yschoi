package kr.ac.kopo.exchange.controller;

import java.util.List;

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

	
	@GetMapping("/exchange/doReserve")
	public String dodoReserveForm() {
		return "exchange/doReserve";
	}
	
	
	

}
