package kr.ac.kopo.board.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.board.vo.BoardFileVO;
import kr.ac.kopo.board.vo.BoardVO;


@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<BoardVO> selectAll() {
		
		List<BoardVO> boardList = sqlSession.selectList("board.dao.BoardDAO.selectAll");
		
		return boardList;
	}
	
	@Override
	public void insert(BoardVO board) {
		sqlSession.insert("board.dao.BoardDAO.insert", board);
	}


	@Override
	public BoardVO selectByNo(int no) {
		BoardVO board = sqlSession.selectOne("board.dao.BoardDAO.selectByNo",no);
		return board;
	}
	
	
	@Override
	public void incrementReplyCnt(int no) {
		System.out.println("BoardDAOImpl-1증가");
		sqlSession.update("board.dao.BoardDAO.incrementReplyCnt", no);
	}

	@Override
	public void reduceReplyCnt(int no) {
		sqlSession.update("board.dao.BoardDAO.reduceReplyCnt", no);
		
	}
	
  /**
   * board insert시 시퀀스 가져오기
   */
  @Override
  public int selectBoardSeq() {
    int seq = sqlSession.selectOne("board.dao.BoardDAO.selectBoardSeq");
    return seq;
  }
  
  
  /**
   * 첨부파일 insert
   * @param fileVO
   */
  @Override
  public void insertFile(BoardFileVO fileVO) {
    sqlSession.insert("board.dao.BoardDAO.insertFile", fileVO);
  }
  
  
	


	
	
	
	
	
}
