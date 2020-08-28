package kr.ac.kopo.exchange.dao;

import java.util.List;

import kr.ac.kopo.exchange.vo.CurrencyVO;

public interface ExchangeDAO {
	/**
	 * 모든 통화의 환율정보 리스트 제공
	 */
	public List<CurrencyVO> selectAll();

}
