package kr.ac.kopo.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.kopo.board.service.BoardService;
import kr.ac.kopo.board.vo.BoardVO;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/board")
	public ModelAndView list() {
		
		List<BoardVO> boardList = boardService.selectAllBoard();
		
		ModelAndView mav = new ModelAndView("board/list");
		mav.addObject("boardList", boardList);
		
		return mav;
		
	}
	
//   :9999/Mission-Spring/board/13  이렇게 수정하자  -- REST방식
	@RequestMapping("/board/{no}")   //{no} 표현은 값이 no이름으로 들어올꺼다 이런거.
	public ModelAndView detail(@PathVariable("no") int boardNo) {  
		// @RequestMapping에 {no}값을 가져오자. pathvariable anno쓰자. path에 값이 날라오니까.
		
		System.out.println("boardno : "+boardNo);
		
		BoardVO board = boardService.selectBoardByNo(boardNo);
		
		ModelAndView mav = new ModelAndView("board/detail");
		mav.addObject("board",board);
		
		return mav;
	}
	
	
	
	@GetMapping("/board/write")  
	public String writeForm(Model model, HttpSession session) {
		
		

		model.addAttribute("boardVO",new BoardVO()); // REQUEST영역에 boardVO이름으로 올린다.
		
		return "board/write";
	}
	
	
	@PostMapping("/board/write")
	public String write(@Validated BoardVO boardVO, BindingResult result) { //validation check의 결과 = result가 가지고있음
		
		System.out.println(boardVO);
		//System.out.println("result : "+result.hasErrors());
		
		if(result.hasErrors()) {
			System.out.println("오류발생");
			return "board/write";
		}
		boardService.insertPost(boardVO);
		return "redirect:/board";
	}
	

}















