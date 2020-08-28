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
	
}
