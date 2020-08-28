package kr.ac.kopo.account.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.board.vo.BoardVO;

@Repository
public class AccountDAOImpl implements AccountDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	
	/**
	 * 원화계좌개설
	 */
	@Override
	public void insert(AccountVO account) {
		sqlSession.insert("account.dao.AccountDAO.insert",account);
	}


	/**
	 * 원화계좌조회
	 */
	@Override
	public List<AccountVO> selectAccount(String id) {
		List<AccountVO> accountList = sqlSession.selectList("account.dao.AccountDAO.selectAll",id);
		
		return accountList;
	}
	
	
	
	
	
	

}
