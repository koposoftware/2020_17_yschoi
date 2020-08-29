package kr.ac.kopo.account.dao;

import java.util.List;

import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.board.vo.BoardVO;

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
	
}
