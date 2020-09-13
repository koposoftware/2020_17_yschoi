package kr.ac.kopo.board.dao;

import java.util.List;

import kr.ac.kopo.board.vo.BoardFileVO;
import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.exchange.vo.CurrencyVO;

public interface BoardDAO {
  
  
  /**
   * 활성화된 공지와 관련된 파일의 savename에 대한 list를 select
   * @return
   */
  List<BoardFileVO> selectSaveNameList();
  
	
	/**
	 * 전체 게시글 조회 서비스
	 */
	public List<BoardVO> selectAll();
	
	
	
	
	
	/**
	 * 새글 등록 서비스
	 */
	public void insert(BoardVO board);
	
	
	
	
	
	/**
	 * 게시글 상세 조회 서비스
	 * @param no 게시글 번호
	 */
	public BoardVO selectByNo(int no);
	
	
	
	
	
	/**
	 * 해당 게시물의 댓글 카운트 증가
	 * @param no 증가시킬 게시물 번호
	 */
	public void incrementReplyCnt(int no);
	
	/**
	 * 해당 게시물의 댓글 카운트 감소
	 * @param no 감소시킬 게시물 번호
	 */
	public void reduceReplyCnt(int no);
	
	
	/**
   * 게시글 insert시 시퀀스 가져오기
   * @return
   */
  public int selectBoardSeq();
  
  /**
   * 첨부파일 insert
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
  
  
  
  
  
  
	
	
}
