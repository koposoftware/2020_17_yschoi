package kr.ac.kopo.exchange.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.exchange.vo.CurrencyVO;
import kr.ac.kopo.exchange.vo.ExchangeVO;

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
	
	
	
	

	
	
	
	
	
	
	
	
}
