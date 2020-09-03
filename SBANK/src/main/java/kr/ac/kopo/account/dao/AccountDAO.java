package kr.ac.kopo.account.dao;

import java.util.List;

import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.board.vo.BoardVO;
import kr.ac.kopo.exchange.vo.ExchangeVO;

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
	 * 환전 시 외화에 돈 insert할때 환전하려는 통화와 관련된 record있는지 확인하기
	 * @param account
	 * @return
	 */
	public String chkCur (ExchangeVO account);
	
	
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
	
	
	
	
}
