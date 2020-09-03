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
	 * 외화 계좌 조회
	 * @param id
	 * @return
	 */
	List<AccountVO> selectCurAccount(String id);
	
	
	
	
	/**
	 * 계좌이체 
	 */
	public void transfer(AccountVO account);
	
	
	/**
	 * 계좌 비밀번호 확인
	 * @param account
	 * @return
	 */
	public int chkPassword(AccountVO account);
	
	

}
