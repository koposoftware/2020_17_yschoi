package kr.ac.kopo.account.service;

import java.util.List;

import org.apache.ibatis.logging.LogException;
import org.springframework.beans.TypeMismatchException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindException;
import org.springframework.web.bind.annotation.ExceptionHandler;

import kr.ac.kopo.account.dao.AccountDAO;
import kr.ac.kopo.account.vo.AccountVO;


@Service
public class AccountServiceImpl implements AccountService {
	
	@Autowired
	private AccountDAO accountdao;
	
	/**
	 * 원화계좌개설
	 */
	@Override
	public void insert(AccountVO account) {
		accountdao.insert(account);
	}
	
	
	
	
	
	/**
   * 계좌 개설시 계좌번호 중복 방지 차 있는 번호인지 확인함.
   * @param account_num
   * @return
   */
	@Override
  public int chkAccountNumIsExistAlready(String account_num) {
    int cnt = accountdao.chkAccountNumIsExistAlready(account_num);
    return cnt;
  }






  /**
	 * 원화계좌조회
	 */
	@Override
	public List<AccountVO> selectAccount(String id) {
		
		List<AccountVO> accountList = accountdao.selectAccount(id);
		return accountList;
	}
	
	
	
	
	
	
	


	/**
	 * 외화 계좌 조회
	 */
	@Override
  public List<AccountVO> selectCurAccount(String id) {
	  List<AccountVO> accountCurList = accountdao.selectCurAccount(id);
    return accountCurList;
  }



  /**
	 * 계좌 이체
	 */
	@Transactional
	@Override
	public void transfer(AccountVO account) {
		
		accountdao.transfer1(account); //출금
		accountdao.transfer2(account); //입금
		
	}


	/**
	 * 계좌 비밀번호 확인
	 */
  @Override
  public int chkPassword(AccountVO account) {
    // TODO Auto-generated method stub
    int result = accountdao.chkPassword(account);
    return result;
  }


  /**
   * 계좌를 소유하고 있는 id 확인
   */
  @Override
  public String chkIfAccountExist(String account_num) {
    String id = accountdao.chkIfAccountExist(account_num);
    return id;
  }
	
	
  @ExceptionHandler(TypeMismatchException.class)
  public String handleNotFoundException() {
    System.out.println("TypeMismatchException 에러 - service");
    return "error/404";
  }
  
  @ExceptionHandler(NumberFormatException.class)
  public String handleNotFoundException2() {
    System.out.println("NumberFormatException 에러 - service");
    return "error/404";
  }
  
  @ExceptionHandler(BindException.class)
  public String handleNotFoundException3() {
    System.out.println("BindException 에러 - service");
    return "error/404";
  }
  @ExceptionHandler(LogException.class)
  public String handleNotFoundException4() {
    System.out.println("LogException 에러  - service");
    return "error/404";
  }
  
  
	
	
	
	
	
	
	
	

}
