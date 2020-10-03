package kr.ac.kopo.board.service;



import java.util.List;

import kr.ac.kopo.board.vo.BoardFileVO;
import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.board.vo.ControlVO;
import kr.ac.kopo.exchange.vo.CurrencyVO;

public interface BoardService {
  
  
  /**
   * 활성화된 공지와 관련된 파일의 savename에 대한 list를 select
   * @return
   */
  List<BoardFileVO> selectSaveNameList();
  
  
  
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
	
	/**
	 * 게시글 insert시 시퀀스 가져오기
	 * @return
	 */
	public int selectBoardSeq();
	
	/**
	 * 첨부파일
	 * @param fileVO
	 */
	public void insertFile(BoardFileVO fileVO);
	
	
	/**
	 * 해당하는 첨부파일 select하기
	 * @param boardNo
	 * @return
	 */
	public BoardFileVO selectFileByNo(int boardNo);
	
	
	/**
	 * 수수료 조정
	 * @param currencyVO
	 */
	public void changeCommission(CurrencyVO currencyVO);
	
	
	/**
	 * 공지 활성화 상태 토글
	 * @param boardNo
	 */
	public void changeStatus(int boardNo);
	
	
	/**
	 * dashboard에서 ip 차단 리스트
	 * @return
	 */
	public List<ControlVO> getControlList();
	
	
	
}
