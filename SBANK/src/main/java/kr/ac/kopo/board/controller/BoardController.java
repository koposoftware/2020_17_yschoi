package kr.ac.kopo.board.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.kopo.board.service.BoardService;
import kr.ac.kopo.board.vo.BoardFileVO;
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
		
		
	
		return "board/write";
	}
	
	/**
	 * 글작성
	 * @param boardVO
	 * @return
	 */
	@PostMapping("/board/write")
	public String write(BoardVO boardVO) { //validation check의 결과 = result가 가지고있음
		
		System.out.println(boardVO);
		//System.out.println("result : "+result.hasErrors());
		
//		if(result.hasErrors()) {
//			System.out.println("오류발생");
//			return "board/write";
//		}
		boardService.insertPost(boardVO);
		return "redirect:/board";
	}
	
	
	@PostMapping("/board/writeIncludeFile")
	public String writeIncludeFile(BoardVO boardVO, @RequestParam("attachfile1") MultipartFile bfile) { //validation check의 결과 = result가 가지고있음
	  

	  BoardFileVO fileVO = new BoardFileVO();
	  
	  
	  //파일이름 수정하기
  	if (bfile.getSize() > 0 ) {
  	  String name = bfile.getOriginalFilename();
//  	  System.out.println("name"+name);
  	  
  	  fileVO.setFileOriName(name); // 파일 원래이름 set
  	  fileVO.setFileSize(bfile.getSize()); // 파일크기 set
  	  
  	  
  	  System.out.println("파일saveName 구하기 시작");
  	  String ext = "";
  	  int dot = name.lastIndexOf(".");
  	  if (dot != -1) {
        ext = name.substring(dot); 
      } else {
        ext = "";
      }
  	  String str = "SBANK-" + UUID.randomUUID();
  	  fileVO.setFileSaveName(str);
	  }
	  
	  System.out.println(fileVO);
	  System.out.println(boardVO);

	  

	  
	  //board시퀀스 가져오기 
	  //boardVO에 위에서 가져온 시퀀스 set
	  //fileVO에 boardNo변수에도 set
	  boardService.insertPost(boardVO);
	  return "redirect:/board";
	}
	
	
	@GetMapping("/board/changeCommission")
	public String changeCommissionForm(Model model, HttpSession session) {

    return "board/changeCommission";
  }
	

}















