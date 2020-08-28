package kr.ac.kopo.reply.dao;

import java.util.List;

import kr.ac.kopo.reply.vo.ReplyVO;

public interface ReplyDAO {
	
	/**
	 * 댓글등록
	 * @param replyVO
	 */
	void insert(ReplyVO replyVO);
	
	
	
	/**
	 * 해당게시물의 댓글 조회하는 기능
	 * @param boardNo 15번게시물 댓글조회
	 * @return 15번게시물에대한 댓글형 리스트
	 */
	List<ReplyVO> selectAll(int boardNo);
	
	
	
	/**
	 * 댓글삭제
	 */
	void delete(int replyNo);
	
	/**
	 * 댓글번호에 해당 게시물번호 조회
	 * @param replyNo 댓글번호
	 * @return 댓글번호에 해당 게시물번호
	 */
	int selectBoardNo(int replyNo);
	
	
	
}
