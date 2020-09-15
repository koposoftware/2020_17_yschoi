package kr.ac.kopo.exchange.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.ac.kopo.exchange.vo.CurlistVO;
import kr.ac.kopo.exchange.vo.CurrencyVO;
import kr.ac.kopo.exchange.vo.ExchangeVO;
import kr.ac.kopo.exchange.vo.PresentVO;
import kr.ac.kopo.exchange.vo.ReserveVO;
import kr.ac.kopo.exchange.vo.RevExchangeVO;


public interface ExchangeService {
	/**
	 * 모든 통화의 환율정보 리스트 제공
	 */
	List<CurrencyVO> selectAllCurrency();
	
	/**
   * 환율리스트에서 고시회차등을 가져옴
   * @return
   */
  public List<String> selectdummy();
	
	
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
	
	
	/**
	 * 재환전내역 id 기준으로 조회
	 * @param id
	 * @return
	 */
	public List<RevExchangeVO> selectRevExchange(String id);
	
	
	
	/**
	 * 외화 보유 내역
	 * @param id
	 * @return
	 */
	public List<CurlistVO> selectCurrency(String id);
	
	
	
	
	/**
	 * 외화선물하기
	 * @param presentVO
	 */
	public void exchangeTransfer(PresentVO presentVO);
	
	
	
	/**
	 * 비밀번호 해쉬값 만들어서 리턴
	 * @param pwd
	 * @return
	 */
	public String returnHash(String pwd);
	
	
	/**
	 * 원화로 재환전하기
	 * @param revExchangeVO
	 * @return
	 */
	public void doRevExchange(RevExchangeVO revExchangeVO);
	
	
	/**
	 * 수령인 수령일 수령지점 수정하기
	 * @param exchangeVO
	 */
	public void changeInfo(ExchangeVO exchangeVO);
	
	
	/**
	 * 최근 7일동안 환전 수 구하기
	 * @return
	 */
	public List<ExchangeVO> exchangeCntSeven();
	
	/**
   * 최근 7일동안 환전 예약 수 구하기
   * @return
   */
	public List<ReserveVO> reserveCntSeven();
	
	/**
   * 최근 7일동안 재환전 수 구하기
   * @return
   */
	public List<RevExchangeVO> revExchangeCntSeven();
	
	
	
	
	
}
