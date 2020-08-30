package kr.ac.kopo.exchange.dao;

import java.util.List;

import kr.ac.kopo.exchange.vo.CurrencyVO;
import kr.ac.kopo.exchange.vo.ExchangeVO;

public interface ExchangeDAO {
	
	
	/**
	 * 모든 통화의 환율정보 리스트 제공
	 */
	public List<CurrencyVO> selectAll();
	
	
	/**
	 * 환전하기에서 통화 선택하면 현재환율정보 띄어주는 부분 ajax
	 * @param currency
	 * @return
	 */
	public CurrencyVO getRateCommission(String currency);
	
	
	/**
	 * 환전하기 기능
	 * @param exchangeVO
	 */
	public void doExchange(ExchangeVO exchangeVO);
	

}
