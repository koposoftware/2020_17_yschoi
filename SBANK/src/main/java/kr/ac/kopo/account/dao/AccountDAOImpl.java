package kr.ac.kopo.account.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.exchange.vo.ExchangeVO;

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

	
	
	
	/**
	 * 계좌이체 출금
	 */
	@Override
	public void transfer1(AccountVO account) {
		// TODO Auto-generated method stub
		sqlSession.update("account.dao.AccountDAO.transfer1", account);
	}
	
	
	/**
	 * 계좌이체 입금
	 */
	@Override
	public void transfer2(AccountVO account) {
		// TODO Auto-generated method stub
		sqlSession.update("account.dao.AccountDAO.transfer2", account);
	}

	/**
	 * 환전하기 기능. 원화계좌에서 환전시 필요한만큼의 돈 빼기!
	 */
  @Override
  public void doExchange(ExchangeVO exchangeVO) {
    // TODO Auto-generated method stub
    sqlSession.update("account.dao.AccountDAO.doExchange", exchangeVO);
    
  }

  /**
   * 계좌 비밀번호 확인
   * return : 계좌의 잔액
   */
  @Override
  public int chkPassword(AccountVO account) {
    int result = sqlSession.selectOne("account.dao.AccountDAO.chkPassword", account);
    return result;
  }
	
	
	
	
	
	
	

}
