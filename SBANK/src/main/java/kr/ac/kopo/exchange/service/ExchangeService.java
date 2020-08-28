package kr.ac.kopo.exchange.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.ac.kopo.exchange.vo.CurrencyVO;


public interface ExchangeService {
	/**
	 * 모든 통화의 환율정보 리스트 제공
	 */
	List<CurrencyVO> selectAllCurrency();
}
