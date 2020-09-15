package kr.ac.kopo.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
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
import kr.ac.kopo.exchange.service.ExchangeService;
import kr.ac.kopo.exchange.vo.CurrencyVO;
import kr.ac.kopo.exchange.vo.ExchangeVO;
import kr.ac.kopo.exchange.vo.ReserveVO;
import kr.ac.kopo.exchange.vo.RevExchangeVO;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@Autowired
	private ExchangeService exchangeService;
	
	
	@Resource(name = "uploadPath")
	String uploadPath;
	
	
	
	@GetMapping("/")
  public ModelAndView index() {
    ModelAndView mav = new ModelAndView("index");
    
    List<BoardFileVO> nameList = boardService.selectSaveNameList();
    
    mav.addObject("nameList", nameList);
//    mav.addObject("a", "aaaaaaaaaaa");
    
    /*for(BoardFileVO a : nameList) {
      a.setBoardNo(0);
      a.setFileOriName("");
      a.setFileSize(0);
      a.setNo(0);
      System.out.println(a);
    }*/
    
    return mav;
  }
	
	
	
	
	
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
		BoardFileVO file = boardService.selectFileByNo(boardNo);
		
		ModelAndView mav = new ModelAndView("board/detail");
		mav.addObject("board",board);
		mav.addObject("file",file);
		
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
	
	/**
	 * 글작성 - 첨부파일 포함
	 * @param boardVO
	 * @param bfile
	 * @return
	 */
	@PostMapping("/board/writeIncludeFile")
	public String writeIncludeFile(BoardVO boardVO, @RequestParam("attachfile1") MultipartFile bfile) { //validation check의 결과 = result가 가지고있음
	  

	  BoardFileVO fileVO = new BoardFileVO();
	  
	  int seq =boardService.selectBoardSeq();//board시퀀스 가져오기 
	  boardVO.setNo(seq); //boardVO에 위에서 가져온 시퀀스 set
	  boardService.insertPost(boardVO);
	  
	  
	  
	  //파일이름 수정하기
  	if (bfile.getSize() > 0 ) {
  	  String name = bfile.getOriginalFilename(); // 파일 원래이름
  	  
  	  fileVO.setFileOriName(name); // 파일 원래이름 set
  	  fileVO.setFileSize(bfile.getSize()); // 파일크기 set
  	  fileVO.setBoardNo(seq); //fileVO에 boardNo변수에도 set
  	  
  	  System.out.println("파일saveName 구하기 시작");
  	  String ext = "";
  	  int dot = name.lastIndexOf(".");
  	  if (dot != -1) {
        ext = name.substring(dot); 
      } else {
        ext = "";
      }
  	  String str = "SBANK-" + UUID.randomUUID();
  	  fileVO.setFileSaveName(str);  // 저장될 파일 이름
  	  File targetFile = new File(uploadPath,str);
  	  
  	  try {
        InputStream fileStream = bfile.getInputStream();
        FileUtils.copyInputStreamToFile(fileStream, targetFile);
        boardService.insertFile(fileVO);
        
      } catch (IOException e) {
        FileUtils.deleteQuietly(targetFile);
        e.printStackTrace();
      }
	  }
	  
	  return "redirect:/board";
	}
	

	
	
	/**
	 * 수수료 조정 폼 보여주기
	 * @param model
	 * @param session
	 * @return
	 */
	@GetMapping("/board/changeCommission")
	public ModelAndView changeCommissionForm(Model model, HttpSession session) {
	  
	  List<CurrencyVO> currencyList = exchangeService.selectAllCurrency();
	  ModelAndView mav = new ModelAndView("board/changeCommission");
	  mav.addObject("currencyList", currencyList);
    return mav;
  }
	
	
	
	@PostMapping("/board/changeCommission")
	public String changeCommission(CurrencyVO currencyVO) {
	  
	  String com2_str = "0.";
	  String com4_str = "0.";


	  
	  
	  com2_str += currencyVO.getCommission2();
//	  int com2 = Integer.parseInt(com2_str);
//	  double com2 = Double.parseDouble(com2_str);
	  
	  com4_str += currencyVO.getCommission4();
//	  int com4 = Integer.parseInt(com4_str);
//	  double com4 =Double.parseDouble(com4_str);
	  
	  /*
	  double com = (1.0- (com2/100.0));
	  double com3 = (1.0- (com4/100.0));
	  
	  System.out.println("com , com3 : "+com+" , "+com3);
	  
	  String str_com = Double.toString(com);
	  String str_com3 = Double.toString(com3);
	  
	  str_com = str_com.substring(0, 3);
	  str_com3 = str_com3.substring(0, 3);
	  
	  double realcom = Double.parseDouble(str_com);
	  double realcom3 = Double.parseDouble(str_com3);
	  
	  System.out.println(str_com);
	  System.out.println(str_com3); */
	  
	   double com2 = Double.parseDouble(com2_str);
	   double com4 = Double.parseDouble(com4_str);
	   
	   double realcom = Math.round((1.0 - com2)*10)/10.0;
	   double realcom3 =Math.round((1.0 - com4)*10)/10.0;
	  
	  
	  currencyVO.setCommission(realcom);
	  currencyVO.setCommission3(realcom3);
	  
	  com2_str += "%";
	  com4_str += "%";
	  
	  currencyVO.setCommission2(com2_str.substring(2));
	  currencyVO.setCommission4(com4_str.substring(2));
    

	  System.out.println(currencyVO);
	  
	  boardService.changeCommission(currencyVO);
    
    return "redirect:/board/changeCommission";
  }
	
	@GetMapping("/board/changeStatus")
	public String changeStatus(int no) {
	  
	  System.out.println(no);
	  System.out.println(no);

	  boardService.changeStatus(no);
	  
	  return "redirect:/board";
	}
	
	/**
	 * 통계 - 1주일치(List) & 그날것(int)
	 * @return
	 */
	@GetMapping("/board/dashBoard")
	public ModelAndView dashBoard(){
	  
	  List<ExchangeVO> exchangeCntSeven = exchangeService.exchangeCntSeven();
	  List<ReserveVO> reserveCntSeven = exchangeService.reserveCntSeven();
	  List<RevExchangeVO> revExchangeCntSeven = exchangeService.revExchangeCntSeven();
	  int exchangeCntOne = exchangeService.exchangeCntOne();
	  int reserveCntOne = exchangeService.reserveCntOne();
	  int revExchangeCntOne = exchangeService.revExchangeCntOne();
	
	  ModelAndView mav = new ModelAndView("board/dashBoard");
	  mav.addObject("exchangeCntSeven",exchangeCntSeven );
	  mav.addObject("reserveCntSeven",reserveCntSeven );
	  mav.addObject("revExchangeCntSeven",revExchangeCntSeven );
	  mav.addObject("exchangeCntOne",exchangeCntOne );
	  mav.addObject("reserveCntOne",reserveCntOne );
	  mav.addObject("revExchangeCntOne",revExchangeCntOne );
	  
//	  for(ExchangeVO a : exchangeCntSeven) {
//	    System.out.println(a);
//	  }
//	  System.out.println("----------------------------------------");
//	  for(ReserveVO a : reserveCntSeven) {
//      System.out.println(a);
//    }
//	  System.out.println("----------------------------------------");
//	  for(RevExchangeVO a : revExchangeCntSeven) {
//      System.out.println(a);
//    }
	  
	  return mav;
	}

   

}















