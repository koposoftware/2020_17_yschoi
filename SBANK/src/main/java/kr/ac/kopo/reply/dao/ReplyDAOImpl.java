package kr.ac.kopo.reply.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.reply.vo.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public void insert(ReplyVO replyVO) {
		// TODO Auto-generated method stub
		System.out.println("replyDAO-댓글삽입");
		System.out.println(replyVO);
		sqlSession.insert("reply.dao.ReplyDAO.insert",replyVO);
		
	}

	@Override
	public List<ReplyVO> selectAll(int boardNo) {
		
		
		
		List<ReplyVO> list =  sqlSession.selectList("reply.dao.ReplyDAO.selectAll",boardNo);
		
		return list;
	}

	@Override
	public void delete(int replyNo) {

		sqlSession.delete("reply.dao.ReplyDAO.delete", replyNo);

	}
	
	/**
	 * 댓글번호에 대한 원글번호 select하기
	 */
	@Override
	public int selectBoardNo(int replyNo) {
		int boardNo = sqlSession.selectOne("reply.dao.ReplyDAO.selectBoardNo", replyNo);
		return boardNo;
	}
	

}
