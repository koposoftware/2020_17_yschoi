package kr.ac.kopo.exchange.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.exchange.vo.CurrencyVO;
import kr.ac.kopo.exchange.vo.ExchangeVO;
import kr.ac.kopo.exchange.vo.ReserveVO;

@Repository
public class ExchangeDAOImpl implements ExchangeDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<CurrencyVO> selectAll() {
		
		List<CurrencyVO> currencyList =
				sqlSession.selectList("exchange.dao.ExchangeDAO.selectAll");
		
		return currencyList;
	}
	
	
	
	/**
	 * 환전하기에서 통화 선택하면 현재환율정보 띄어주는 부분 ajax
	 * @param currency
	 * @return
	 */
	@Override
	public CurrencyVO getRateCommission(String currency) {
		CurrencyVO currencyVO =
				sqlSession.selectOne("exchange.dao.ExchangeDAO.getRateCommission", currency);
		
		return currencyVO;
	}


	/**
	 * 환전하기 기능
	 */
	@Override
	public void doExchange(ExchangeVO exchangeVO) {
		
		sqlSession.insert("exchange.dao.ExchangeDAO.doExchange", exchangeVO);
		
	}


	/**
	 * 환전예약하기
	 */
  @Override
  public void doReserve(ReserveVO reserveVO) {
    // TODO Auto-generated method stub
    if (reserveVO.getMax_date().length() < 3) {
      sqlSession.insert("exchange.dao.ExchangeDAO.doReserve2", reserveVO);
    } else {
      sqlSession.insert("exchange.dao.ExchangeDAO.doReserve", reserveVO);
    }
  }


  /**
   * 비회원 환전하기
   */
  @Override
  public void doKakaoExchange(ExchangeVO exchangeVO) {
    // TODO Auto-generated method stub
    sqlSession.insert("exchange.dao.ExchangeDAO.doKakaoExchange",exchangeVO);
  }


  /**
   * 환전내역 아이디 기준 조회
   */
  @Override
  public List<ExchangeVO> selectExchange(String id) {
    List<ExchangeVO> exchangeList  = sqlSession.selectList("exchange.dao.ExchangeDAO.selectExchange", id);
        
    return exchangeList;
  }


  /**
   * 환전 예약 내역 아이디 기준으로 조회
   */
  @Override
  public List<ReserveVO> selectReserve(String id) {
    
    List<ReserveVO> reserveList = sqlSession.selectList("exchange.dao.ExchangeDAO.selectReserve", id);
    
    return reserveList;
  }
	
	
	
  
  
  
	
	

	
	
	
	
	
	
	
	
}
