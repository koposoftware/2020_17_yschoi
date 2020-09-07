package kr.ac.kopo.exchange.dao;

import java.util.List;

import kr.ac.kopo.exchange.vo.CurlistVO;
import kr.ac.kopo.exchange.vo.CurrencyVO;
import kr.ac.kopo.exchange.vo.ExchangeVO;
import kr.ac.kopo.exchange.vo.PresentVO;
import kr.ac.kopo.exchange.vo.ReserveVO;
import kr.ac.kopo.exchange.vo.RevExchangeVO;

public interface ExchangeDAO {
	
	
	/**
	 * 모든 통화의 환율정보 리스트 제공
	 */
	public List<CurrencyVO> selectAll();
	
	
	
	/**
	 * 환율정보에서 고치회차등을 표시하기
	 * @return
	 */
	public List<String> selectdummy();
	
	
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
	
	
	/**
	 * 환전예약하기
	 * @param reserveVO
	 */
	public void doReserve(ReserveVO reserveVO);
	
	
	
	/**
	 * 비회원 환전하기
	 * @param exchangeVO
	 */
	public void doKakaoExchange(ExchangeVO exchangeVO);
	
	
	/**
	 * 환전내역 id 기준으로 조회
	 * @param id
	 * @return
	 */
	public List<ExchangeVO> selectExchange(String id);
	
	
	
	
	/**
	 * 환전 예약 내역 id기준으로 조회
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
	 * 보유외화 조회
	 * @param accounnt_num
	 * @return
	 */
	public List<CurlistVO> selectCurrency(String accounnt_num);
	
	
	/**
	 * 외화 선물하기 - 출금로직
	 */
	public void transfer1(PresentVO presentVO);
	
	
	
	/**
	 * 외화선물하기 - 입금로직 - update
	 * @param presentVO
	 */
	public void transfer2(PresentVO presentVO);
	
	
	/**
   * 외화선물하기 - 입금로직 - insert
   * @param presentVO
   */
	public void transfer2_2(PresentVO presentVO);
	
	
	/**
	 * 비밀번호 해쉬값 만들어서 리턴
	 * @param pwd
	 * @return
	 */
	public String returnHash(String pwd);
	
	
	
	
	/**
	 * 원화로 재환전하기
	 * @param revExchangeVO
	 */
	public void doRevExchange(RevExchangeVO revExchangeVO);
	
	
	
	

}
