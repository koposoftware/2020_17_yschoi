package kr.ac.kopo.exchange.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.ac.kopo.exchange.vo.CurrencyVO;
import kr.ac.kopo.exchange.vo.ExchangeVO;
import kr.ac.kopo.exchange.vo.ReserveVO;


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
	
	
	/**
	 * 환전 예약하기
	 * @param reserveVO
	 */
	public void doReserve(ReserveVO reserveVO);
	
	
	/**
	 * 비회원 환전하기
	 * @param exchangeVO
	 */
	public void doKakaoExchange(ExchangeVO exchangeVO);
	
	
	/**
	 * 환전내역 아이디 기준으로 조회
	 * @param exchangeVO
	 * @return
	 */
	public List<ExchangeVO> selectExchange(String id);
	
	
	/**
	 * 환전 예약 내역 아아디 기준 조회
	 * @param id
	 * @return
	 */
	public List<ReserveVO> selectReserve(String id);
	
	
	
}
