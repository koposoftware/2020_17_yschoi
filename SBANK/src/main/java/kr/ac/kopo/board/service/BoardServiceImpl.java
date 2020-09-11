package kr.ac.kopo.board.service;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.board.dao.BoardDAO;
import kr.ac.kopo.board.vo.BoardFileVO;
import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.exchange.vo.CurrencyVO;


@Service
public class BoardServiceImpl implements  BoardService {
	
	@Autowired
	private BoardDAO boardDAO;
	

	/**
   * 활성화된 공지와 관련된 파일의 savename에 대한 list를 select
   * @return
   */
	@Override
  public List<BoardFileVO> selectSaveNameList() {
	  List<BoardFileVO> namelist = boardDAO.selectSaveNameList();
    return namelist;
  }
	

  @Override
	public List<BoardVO> selectAllBoard() {
		List<BoardVO> boardList = boardDAO.selectAll();
		
		return boardList;
	}

	@Override
	public BoardVO selectBoardByNo(int no) {
		BoardVO board = boardDAO.selectByNo(no);
		return board;
	}
	
	@Override
	public void insertPost(BoardVO board) {
		boardDAO.insert(board);
	}
	
	/**
	 * board insert시 시퀀스 가져오기
	 */
  @Override
  public int selectBoardSeq() {
    int seq = boardDAO.selectBoardSeq();
    return seq;
  }
  
  /**
   * 첨부파일 record insert
   */
  @Override
  public void insertFile(BoardFileVO fileVO) {
    boardDAO.insertFile(fileVO);
  }
  
  /**
   * 해당하는 첨부파일 select하기
   * @param boardNo
   * @return
   */
  @Override
  public BoardFileVO selectFileByNo(int boardNo) {
    BoardFileVO file = boardDAO.selectFileByNo(boardNo);
    return file;
  }
  
  /**
   * 수수료 조정
   */
  @Override
  public void changeCommission(CurrencyVO currencyVO) {
    // TODO Auto-generated method stub
    boardDAO.changeCommission(currencyVO);
    
  }
  
  
	
	
	
	

	
}
