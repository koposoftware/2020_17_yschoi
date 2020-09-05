package kr.ac.kopo.account.dao;

import java.util.List;

import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.exchange.vo.ExchangeVO;
import kr.ac.kopo.exchange.vo.PresentVO;

public interface AccountDAO {
	/**
	 * 원화계좌개설
	 * @param account
	 */
	public void insert(AccountVO account);
	
	
	/**
	 * 원화계좌조회
	 */
	public List<AccountVO> selectAccount(String id);
	
	/**
	 * 외화계좌조회
	 */
	public List<AccountVO>  selectCurAccount(String id);
	
	
	/**
	 * 계좌이체 출금
	 * @param account
	 */
	public void transfer1(AccountVO account);
	
	
	/**
	 * 계좌이체 입금
	 * @param account
	 */
	public void transfer2(AccountVO account);
	
	/**
	 * 환전하기 기능. 원화계좌에서 환전시 필요한만큼의 돈 빼기!
	 * @param exchangeVO
	 */
	public void doExchangeKrw(ExchangeVO exchangeVO);
	
	
	/**
	 * 외화계좌 번호 가져오기
	 * @param account
	 * @return
	 */
	public String chkCurAccount_num (String id);
	
	
	/**
	 * 외화계좌에 해당 통화와 관련된 record 수 구하기
	 * @param CurAccount_num
	 * @param currencyCode
	 * @return
	 */
	public int chkRecordCurrencyCode(ExchangeVO exchangeVO);
	public int chkRecordS_CURLIST(PresentVO presentVO);
	
	
	/**
	 * 환전하기 기능. 외화계좌에 돈 insert
	 * @param exchangeVO
	 */
	public void doExchangeCurInsert(ExchangeVO exchangeVO);
	
	
	/**
	 * 환전하기 기능. 외화계좌에 돈 update
	 * @param exchangeVO
	 */
	public void doExchangeCurUpdate(ExchangeVO exchangeVO);
	
	
	/**
	 * 계좌 비밀번호 확인
	 * @param account
	 * @return 계좌의 잔액
	 */
	public int chkPassword(AccountVO account);
	
	
	/**
	 * 계좌의 소유 id확인
	 * @param account_num
	 * @return
	 */
	public String chkIfAccountExist(String account_num);
	
	
	
	
}
