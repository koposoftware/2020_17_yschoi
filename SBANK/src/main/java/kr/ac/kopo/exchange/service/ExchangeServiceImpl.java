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
import kr.ac.kopo.exchange.vo.ReserveVO;

@Service
public class ExchangeServiceImpl implements ExchangeService {
	
	@Autowired
	private ExchangeDAO exchangeDAO;
	
	@Autowired
	private AccountDAO accountDAO;
	

	@Override
	public List<CurrencyVO> selectAllCurrency() {
		
		List<CurrencyVO> currencyList = exchangeDAO.selectAll();
		
		return currencyList;
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
   * 외화 보유 내역
   */
  @Override
  public List<CurlistVO> selectCurrency(String id) {
    String CurAccount_num = accountDAO.chkCurAccount_num(id);    //외화계좌 번호 가져오기
    List<CurlistVO> curlist  = exchangeDAO.selectCurrency(CurAccount_num);
    
    return curlist;
  }
	
	
	
	
	
	
	
	

	
	
	
}
