package kr.ac.kopo.exchange.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.ac.kopo.exchange.vo.CurrencyVO;
import kr.ac.kopo.exchange.vo.ExchangeVO;


public interface ExchangeService {
	/**
	 * 모든 통화의 환율정보 리스트 제공
	 */
	List<CurrencyVO> selectAllCurrency();
	
	
	/**
	 * 환전하기에서 통화 누르면 현재 환율정보 알려주는 것
	 */
	public CurrencyVO getRateCommission(String currency);
	
	
	
	/**
	 * 환전하기
	 * @param exchangeVO
	 */
	public void doExchange(ExchangeVO exchangeVO);
}
