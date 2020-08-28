package kr.ac.kopo.account.service;

import java.util.List;

import kr.ac.kopo.account.vo.AccountVO;


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
	 * 
	 */
}
