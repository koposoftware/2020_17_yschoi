package kr.ac.kopo.board.service;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.board.dao.BoardDAO;
import kr.ac.kopo.board.vo.BoardFileVO;
import kr.ac.kopo.board.vo.BoardVO;


@Service
public class BoardServiceImpl implements  BoardService {
	
	@Autowired
	private BoardDAO boardDAO;

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
  
  
	
	
	
	

	
}
