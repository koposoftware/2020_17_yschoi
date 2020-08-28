package kr.ac.kopo.board.service;



import java.util.List;

import kr.ac.kopo.board.vo.BoardVO;

public interface BoardService {
	/**
	 * 전체게시글 조회
	 */
	List<BoardVO> selectAllBoard();
	
	
	/**
	 * 상세게시글조회
	 */
	BoardVO selectBoardByNo(int no);
	
	/**
	 * 게시글입력
	 * @param board
	 */
	public void insertPost(BoardVO board);
}
