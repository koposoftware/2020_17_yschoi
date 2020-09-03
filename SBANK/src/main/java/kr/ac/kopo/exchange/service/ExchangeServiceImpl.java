package kr.ac.kopo.exchange.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.account.dao.AccountDAO;
import kr.ac.kopo.account.vo.AccountVO;
import kr.ac.kopo.exchange.dao.ExchangeDAO;
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

	  
		
	  accountDAO.doExchange(exchangeVO);  // 원화계좌에서 돈 출금
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
	
	
	
	
	
	
	
	

	
	
	
}
