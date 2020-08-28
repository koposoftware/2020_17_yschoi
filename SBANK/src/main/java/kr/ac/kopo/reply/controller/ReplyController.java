package kr.ac.kopo.reply.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.ac.kopo.reply.service.ReplyService;
import kr.ac.kopo.reply.vo.ReplyVO;


@RestController   // 컨트롤러가 갖고 있는 값을 forward나 sendRedirect 하지 않고 정보를 그대로 넘겨주는것 -> 클래스에 붙이는 것임. ReplyController의 모든 메소드는 ResponseBody역할을 하게 하겠다?
public class ReplyController {
	
	@Autowired
	private ReplyService replyService;

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
   
   
   
   
   
}