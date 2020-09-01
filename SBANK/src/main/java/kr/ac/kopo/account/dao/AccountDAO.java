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
	public void doExchange(ExchangeVO exchangeVO);
	
	
}
