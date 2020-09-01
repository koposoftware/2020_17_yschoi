package kr.ac.kopo.reply.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.ac.kopo.account.service.AccountService;
import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.exchange.service.ExchangeService;
import kr.ac.kopo.exchange.vo.CurrencyVO;
import kr.ac.kopo.exchange.vo.ExchangeVO;
import kr.ac.kopo.member.vo.MemberVO;
import kr.ac.kopo.reply.service.ReplyService;
import kr.ac.kopo.reply.vo.ReplyVO;


@RestController   // 컨트롤러가 갖고 있는 값을 forward나 sendRedirect 하지 않고 정보를 그대로 넘겨주는것 -> 클래스에 붙이는 것임. ReplyController의 모든 메소드는 ResponseBody역할을 하게 하겠다?
public class ReplyController {
	
	@Autowired
	private ReplyService replyService;
	
	@Autowired
	private ExchangeService exchangeService;
	
	@Autowired
	private AccountService accountService;
	

   @PostMapping("/reply")
   public void addReply(ReplyVO replyVO) {
      System.out.println(replyVO);
      System.out.println("controller진입");
      replyService.insertReply(replyVO);
      
   }
   
   
   @GetMapping("/reply/{boardNo}")
   public List<ReplyVO> getList(@PathVariable("boardNo") int boardNo) {
	   
	   //System.out.println("번호 : "+boardNo);
	   List<ReplyVO> list = replyService.selectAllByBoardNo(boardNo);
	   
	   return list;
   }
   
   
   
//	@RequestMapping(value="/reply/{replyNo}", method=RequestMethod.DELETE)
	@DeleteMapping("/reply/{replyNo}")
	public void delteteReply(@PathVariable("replyNo") int replyNo) {
//		System.out.println("삭제할 댓글 번호 : " + replyNo);
		replyService.removeReply(replyNo);
	}
   
   
   
   @DeleteMapping("/reply/{replyNo}/{boardNo}")
	public void deleteReply(@PathVariable("replyNo") int replyNo
							, @PathVariable("boardNo") int boardNo) {
		ReplyVO replyVO = new ReplyVO();
		replyVO.setNo(replyNo);
		replyVO.setBoardNo(boardNo);
		
		replyService.removeReply(replyVO);
	}
   
   
   
   
   
   /**
	 * 환전하기에서 통화 선택하면 그에대한 환율정보들 조회하는 것
	 * @param currency
	 * @return
	 */
	@GetMapping("/exchange/getRateCommission/{currency}")
	public CurrencyVO getRateCommission(@PathVariable("currency") String currency) {
		System.out.println("ExchangeController - getRateCommission 진입");
		System.out.println("선택한 통화: "+currency);
		
		CurrencyVO currencyVO = exchangeService.getRateCommission(currency);
		System.out.println(currencyVO);
		return currencyVO;
	}
   
	/**
	 * 로그인한 사람의 계좌 리스트 가져오기
	 * @param session
	 * @return
	 */
   @GetMapping("/exchange/getAccount_num")
   public List<AccountVO> getAccount_num(HttpSession session) {
	   MemberVO userVO = (MemberVO) session.getAttribute("loginVO"); //자바에서로그인아이디가져오기
	   String id = userVO.getId();
	   List<AccountVO> accountList = accountService.selectAccount(id);
	   
	   return accountList;
   }
   
   
   @PostMapping("/exchange/kakaoPayInsert")
   public void kakaoPayInsert(ExchangeVO exchangeVO) {
     System.out.println("===============kakaoPayInsert=================");
     System.out.println(exchangeVO);
     
     exchangeService.doKakaoExchange(exchangeVO);
     
   }
   
   
   
   
   
   
   
}