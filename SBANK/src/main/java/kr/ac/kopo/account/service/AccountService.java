package kr.ac.kopo.account.service;

import java.util.List;

import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.board.vo.BoardVO;


public interface AccountService {
	/**
	 * 원화계좌개설
	 * @param account
	 */
	public void insert(AccountVO account);
	
	
	/**
	 * 원화계좌조회
	 */
	List<AccountVO> selectAccount(String id);
	
	
	
	
	/**
	 * 계좌이체 
	 */
	public void transfer(AccountVO account);
	
	

}
