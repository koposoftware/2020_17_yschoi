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
	 * 계좌 개설시 계좌번호 중복 방지 차 있는 번호인지 확인함.
	 * @param account_num
	 * @return
	 */
	public int chkAccountNumIsExistAlready(String account_num);
	
	
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
	
	
	/**
	 * 계좌를 소유하고 있는 id 확인
	 * @param account_num
	 * @return id
	 */
	public String chkIfAccountExist(String account_num);
	
	

}
