package kr.ac.kopo.exchange.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.account.dao.AccountDAO;
import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.exchange.dao.ExchangeDAO;
import kr.ac.kopo.exchange.vo.CurlistVO;
import kr.ac.kopo.exchange.vo.CurrencyVO;
import kr.ac.kopo.exchange.vo.ExchangeVO;
import kr.ac.kopo.exchange.vo.PresentVO;
import kr.ac.kopo.exchange.vo.ReserveVO;
import kr.ac.kopo.exchange.vo.RevExchangeVO;

@Service
public class ExchangeServiceImpl implements ExchangeService {
	
	@Autowired
	private ExchangeDAO exchangeDAO;
	
	@Autowired
	private AccountDAO accountDAO;
	

	
	/**
	 * 환율정보폼 띄어주기
	 */
	@Override
	public List<CurrencyVO> selectAllCurrency() {
		
		List<CurrencyVO> currencyList = exchangeDAO.selectAll();
		
		return currencyList;
	}
	
	
	
	
	/**
	 * 환율정보에서 고치회차등을 표시하기
	 */
	@Override
  public List<String> selectdummy() {
	  List<String> dummy = exchangeDAO.selectdummy();
    return dummy;
  }











  /**
	 * 환전하기에서 통화 선택하면 현재환율정보 띄어주는 부분 ajax
	 * @param currency
	 * @return CurrencyVO
	 */
	@Override
	public CurrencyVO getRateCommission(String currency) {
		// TODO Auto-generated method stub
		
		CurrencyVO currencyVO = exchangeDAO.getRateCommission(currency);
		
		return currencyVO;
	}

	/**
	 * 환전하기 기능
	 */
	@Override
  public void doExchange(ExchangeVO exchangeVO) {
    
    AccountVO chkVO = new AccountVO();
    chkVO.setAccount_num(exchangeVO.getAccount_num());
    
    accountDAO.doExchangeKrw(exchangeVO); // 원화계좌에서 돈 출금
    
    String CurAccount_num = accountDAO.chkCurAccount_num(exchangeVO.getId()); // 외화계좌 번호 가져오기
    System.out.println("외화 계좌의 번호 : " + CurAccount_num);
    
    // 여기에 로직 넣기
    
    if (CurAccount_num != null) { // 외화계좌 있을때
      exchangeVO.setReg_date(CurAccount_num);
      // System.out.println("값확인하자"+exchangeVO);
      
      
      int result = accountDAO.chkRecordCurrencyCode(exchangeVO); // 외화 계좌에 해당 통화 관련 record 있는지 확인.
      System.out.println("result : " + result);
      System.out.println(exchangeVO.getExchange_place());
      
      if (exchangeVO.getExchange_place().equals("own")) {
        System.out.println("own");
        exchangeVO.setExchange_date("");
        
        if (result > 0) {
          // System.out.println("check if it is enter - Update");
          System.out.println(exchangeVO);
          accountDAO.doExchangeCurUpdate(exchangeVO);// record있으니 외화계좌에 해당 record에 balance 더하기
        } else {
          // System.out.println("check if it is enter - Insert");
          System.out.println(exchangeVO);
          accountDAO.doExchangeCurInsert(exchangeVO); // 외화계좌에 돈 insert
        }
      }
    }
    System.out.println("exchange테이블에 insert하자");
    exchangeDAO.doExchange(exchangeVO); // exchange 테이블에 record insert
  }

	/**
	 * 환전예약하기
	 */
  @Override
  public void doReserve(ReserveVO reserveVO) {
    // TODO Auto-generated method stub
    exchangeDAO.doReserve(reserveVO);
    
  }

  /**
   * 비회원 환전하기
   */
  @Override
  public void doKakaoExchange(ExchangeVO exchangeVO) {
    // TODO Auto-generated method stub
    exchangeDAO.doKakaoExchange(exchangeVO);
  }

  
  /**
   * 환전 내역 아이디 기준으로 조회
   */
  @Override
  public List<ExchangeVO> selectExchange(String id) {
    // TODO Auto-generated method stub
    
    List<ExchangeVO> exchangeList = exchangeDAO.selectExchange(id);
    
    return exchangeList;
  }

  /**
   * 환전 예약 내역 아이디 기준 조회
   */
  @Override
  public List<ReserveVO> selectReserve(String id) {
    
   List<ReserveVO> reserveList = exchangeDAO.selectReserve(id);
    
    return reserveList;
  }
  
  
  
  

  /**
   * 재환전내역 id 기준으로 조회
   */
  @Override
  public List<RevExchangeVO> selectRevExchange(String id) {
    List<RevExchangeVO> revExchangeList = exchangeDAO.selectRevExchange(id);
    return revExchangeList;
  }




  /**
   * 외화 보유 내역
   */
  @Override
  public List<CurlistVO> selectCurrency(String id) {
    String CurAccount_num = accountDAO.chkCurAccount_num(id);    //외화계좌 번호 가져오기
    List<CurlistVO> curlist  = exchangeDAO.selectCurrency(CurAccount_num);
    
    return curlist;
  }

  /**
   * 외화 선물하기
   */
  @Override
  public void exchangeTransfer(PresentVO presentVO) {
    
    exchangeDAO.transfer1(presentVO); //출금
    int record = accountDAO.chkRecordS_CURLIST(presentVO);
    System.out.println("record : : "+record);
    if( record == 1 ) {
      exchangeDAO.transfer2(presentVO); //입금 - update
    }else {
      exchangeDAO.transfer2_2(presentVO); //입금 - insert
    }
  }

  /**
   * 비밀번호 해쉬값 만들어서 리턴
   */
  @Override
  public String returnHash(String pwd) {
    String hashpwd = exchangeDAO.returnHash(pwd);
    return hashpwd;
  }

  /**
   * 원화를 재환전하기
   */
  @Override
  public void doRevExchange(RevExchangeVO revExchangeVO) {
    PresentVO presentVO = new PresentVO();
    presentVO.setBalance(revExchangeVO.getExchangeprice());
    presentVO.setAccount_num(revExchangeVO.getAccount_num_from());
    exchangeDAO.transfer1(presentVO);  //외화출금
    
    AccountVO account = new AccountVO();
    
    account.setBalance((int)Math.round(revExchangeVO.getExchangecharge()));
    account.setAccount_num(revExchangeVO.getAccount_num_to());
    account.setBank_name(revExchangeVO.getAccount_num_to());
    accountDAO.transfer2(account); //원화입금
    
    exchangeDAO.doRevExchange(revExchangeVO); //재환전 내역에 insert
  }



  /**
   * 수령인 수령일 수령지점 수정하기
   */
  @Override
  public void changeInfo(ExchangeVO exchangeVO) {
    // TODO Auto-generated method stub
    
    if (exchangeVO.getExchange_place().equals("own")) { // 개인소유하면 curlist테이블에 넣어야해서
      
      int result = accountDAO.chkRecordCurrencyCode(exchangeVO); // 외화 계좌에 해당 통화 관련 record 있는지 확인.
      System.out.println("result : "+result);
      System.out.println("own");
      exchangeVO.setExchange_date(""); // 여기에 account_num이 없어서 에러나는듯!!!!!!!!!!!!!!!중요쓰,~~~~~~~~~
      
      if (result > 0) {
        // System.out.println("check if it is enter - Update");
        System.out.println(exchangeVO);
        accountDAO.doExchangeCurUpdate(exchangeVO);// record있으니 외화계좌에 해당 record에 balance 더하기
      } else {
        // System.out.println("check if it is enter - Insert");
        System.out.println(exchangeVO);
        accountDAO.doExchangeCurInsert(exchangeVO); // 외화계좌에 돈 insert
      }
      
    }
    
    
    
    exchangeDAO.changeInfo(exchangeVO); // 개인소유던 수령이던 UPDATE는 해야함~
  }



  /**
   * 최근 7일동안 환전 수 구하기
   * @return
   */
  @Override
  public List<ExchangeVO> exchangeCntSeven() {
    List<ExchangeVO> exchangeCntSeven =  exchangeDAO.exchangeCntSeven();
    return exchangeCntSeven;
  }



  /**
   * 최근 7일동안 환전 예약 수 구하기
   * @return
   */
  @Override
  public List<ReserveVO> reserveCntSeven() {
    List<ReserveVO> reserveCntSeven = exchangeDAO.reserveCntSeven();
    return reserveCntSeven;
  }



  /**
   * 최근 7일동안 재환전 수 구하기
   * @return
   */
  @Override
  public List<RevExchangeVO> revExchangeCntSeven() {
    List<RevExchangeVO> revExchangeCntSeven =exchangeDAO.revExchangeCntSeven();
    return revExchangeCntSeven;
  }



  /**
   * 오늘 하루 환전 수 구하기
   * @return
   */
  @Override
  public int exchangeCntOne() {
    int exchangeCntOne = exchangeDAO.exchangeCntOne();
    return exchangeCntOne;
  }



  /**
   * 오늘 하루 환전 예약 수 구하기
   * @return
   */
  @Override
  public int reserveCntOne() {
    int reserveCntOne = exchangeDAO.reserveCntOne();
    return reserveCntOne;
  }



  /**
   * 오늘 하루 재환전 수 구하기
   * @return
   */
  @Override
  public int revExchangeCntOne() {
    int revExchangeCntOne = exchangeDAO.revExchangeCntOne();
    return revExchangeCntOne;
  }



  /**
   * 오늘 가장 인기 있었던 외화코드 가져오기
   * @return
   */
  @Override
  public String currencyCodeCntOne() {
    String currency = exchangeDAO.currencyCodeCntOne();
    return currency;
  }
	
  
  
  
  
  
  
	
	
  
  
	
	
	
	
	

	
	
	
}
