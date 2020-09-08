package kr.ac.kopo.account.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.exchange.vo.ExchangeVO;
import kr.ac.kopo.exchange.vo.PresentVO;

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
   * 계좌 개설시 계좌번호 중복 방지 차 있는 번호인지 확인함.
   * @param account_num
   * @return
   */
	@Override
  public int chkAccountNumIsExistAlready(String account_num) {
    int cnt = sqlSession.selectOne("account.dao.AccountDAO.chkAccountNumIsExistAlready", account_num);
    return cnt;
  }




  /**
	 * 원화계좌조회
	 */
	@Override
	public List<AccountVO> selectAccount(String id) {
		List<AccountVO> accountList = sqlSession.selectList("account.dao.AccountDAO.selectKrwAll",id);
		
		return accountList;
	}
	
	
	
	/**
	 * 회화 계좌 조회
	 */
	@Override
  public List<AccountVO> selectCurAccount(String id) {
	  List<AccountVO> accountCurList = sqlSession.selectList("account.dao.AccountDAO.selectCurAll",id);
    return accountCurList;
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
  public void doExchangeKrw(ExchangeVO exchangeVO) {
    // TODO Auto-generated method stub
    sqlSession.update("account.dao.AccountDAO.doExchange", exchangeVO);
    
  }
  
  
  
  /**
   * 외화계좌 번호 가져오기
   */
  @Override
  public String chkCurAccount_num(String id) {
    String result = sqlSession.selectOne("account.dao.AccountDAO.chkCurAccount_num", id);
    return result;
  }
  
  
  
  
  /**
   * 외화계좌에 해당 통화와 관련된 record 수 구하기
   */
  @Override
  public int chkRecordCurrencyCode(ExchangeVO exchangeVO) {
    /* where account_num = #{reg_date} and currencycode=#{currencycode} */
    int result = sqlSession.selectOne("account.dao.AccountDAO.chkRecordCurrencyCode", exchangeVO);
    return result;
  }
  @Override
  public int chkRecordS_CURLIST(PresentVO presentVO) {
    int result = sqlSession.selectOne("account.dao.AccountDAO.chkRecordS_CURLIST", presentVO);
    return result;
  }


  /**
   * 환전하기 기능에서 외화계좌에 돈 insert
   */
  @Override
  public void doExchangeCurInsert(ExchangeVO exchangeVO) {
    // TODO Auto-generated method stub
    sqlSession.insert("account.dao.AccountDAO.doExchangeCurInsert", exchangeVO);
  }
  
  

  /**
   * 환전하기 기능에서 외화계좌에 돈 update
   */
  @Override
  public void doExchangeCurUpdate(ExchangeVO exchangeVO) {
    // TODO Auto-generated method stub
    sqlSession.update("account.dao.AccountDAO.doExchangeCurUpdate", exchangeVO);
    
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

  /**
   * 계좌의 소유 id 검사
   */
  @Override
  public String chkIfAccountExist(String account_num) {
    String id = sqlSession.selectOne("account.dao.AccountDAO.chkIfAccountExist", account_num);
    return id;
  }
	
	
	
  
	
	
	
	

}
