package kr.ac.kopo.exchange.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.exchange.vo.CurlistVO;
import kr.ac.kopo.exchange.vo.CurrencyVO;
import kr.ac.kopo.exchange.vo.ExchangeVO;
import kr.ac.kopo.exchange.vo.PresentVO;
import kr.ac.kopo.exchange.vo.ReserveVO;
import kr.ac.kopo.exchange.vo.RevExchangeVO;

@Repository
public class ExchangeDAOImpl implements ExchangeDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * 모든 통화의 환율정보 폼에 띄어줄 내용 
	 */
	@Override
	public List<CurrencyVO> selectAll() {
		
		List<CurrencyVO> currencyList =
				sqlSession.selectList("exchange.dao.ExchangeDAO.selectAll");
		
		return currencyList;
	}
	
	
	
	
	
	
	
	
	/**
	 * 환율정보에서 고시회차등을 가져옴
	 */
	@Override
  public List<String> selectdummy() {
	  List<String> dummy = new ArrayList<>();
	  
	  String one = sqlSession.selectOne("exchange.dao.ExchangeDAO.selectDummyOne");
	  String two = sqlSession.selectOne("exchange.dao.ExchangeDAO.selectDummyTwo");
	  String thr = sqlSession.selectOne("exchange.dao.ExchangeDAO.selectDummyThr");
	  String fou = sqlSession.selectOne("exchange.dao.ExchangeDAO.selectDummyFou");
	  
	  dummy.add(one);
	  dummy.add(two);
	  dummy.add(thr);
	  dummy.add(fou);
	  
    return dummy;
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
  
  
  
  
  

  /**
   * 재환전내역 id 기준으로 조회
   * @param id
   * @return
   */
  @Override
  public List<RevExchangeVO> selectRevExchange(String id) {
    List<RevExchangeVO> revExchangeList = sqlSession.selectList("exchange.dao.ExchangeDAO.selectRevExchange", id);
    return revExchangeList;
  }








  /**
   * 보유외화 조회
   */
  @Override
  public List<CurlistVO> selectCurrency(String accounnt_num) {
    List<CurlistVO> curlist = new ArrayList<CurlistVO>();
    if (accounnt_num != null) {
      curlist = sqlSession.selectList("exchange.dao.ExchangeDAO.selectCurrency", accounnt_num);
    }
    return curlist;
  }


  /**
   * 외화선물하기 - 출금
   */
  @Override
  public void transfer1(PresentVO presentVO) {
    // TODO Auto-generated method stub
    sqlSession.update("exchange.dao.ExchangeDAO.transfer1", presentVO);
  }


  /**
   * 외화선물하기 - 입금 - update
   */
  @Override
  public void transfer2(PresentVO presentVO) {
    // TODO Auto-generated method stub
    sqlSession.update("exchange.dao.ExchangeDAO.transfer2", presentVO);
    
  }


  /**
   * 외화선물하기 - 입금 - insert
   */
  @Override
  public void transfer2_2(PresentVO presentVO) {
    // TODO Auto-generated method stub
    sqlSession.update("exchange.dao.ExchangeDAO.transfer2_2", presentVO);
  }


  /**
   * 비밀번호 해쉬값 만들어서 리턴
   */
  @Override
  public String returnHash(String pwd) {
    // TODO Auto-generated method stub
    String hashpwd = sqlSession.selectOne("exchange.dao.ExchangeDAO.returnHash", pwd);
    return hashpwd;
  }


  /**
   * 원화로 재환전하기
   */
  @Override
  public void doRevExchange(RevExchangeVO revExchangeVO) {
    sqlSession.insert("exchange.dao.ExchangeDAO.doRevExchange", revExchangeVO);
  }







  /**
   * 수령인 수령일 수령지점 수정하기
   */
  @Override
  public void changeInfo(ExchangeVO exchangeVO) {
    // TODO Auto-generated method stub
    sqlSession.update("exchange.dao.ExchangeDAO.changeInfo", exchangeVO);
  }







  /**
   * 최근 7일동안 환전 수 구하기
   * @return
   */
  @Override
  public List<ExchangeVO> exchangeCntSeven() {
    List<ExchangeVO> exchangeCntSeven = sqlSession.selectList("exchange.dao.ExchangeDAO.exchangeCntSeven");
    return exchangeCntSeven;
  }





  /**
   * 최근 7일동안 환전 예약 수 구하기
   * @return
   */
  @Override
  public List<ReserveVO> reserveCntSeven() {
    List<ReserveVO> reserveCntSeven = sqlSession.selectList("exchange.dao.ExchangeDAO.reserveCntSeven");
    return reserveCntSeven;
  }





  /**
   * 최근 7일동안 재환전 수 구하기
   * @return
   */
  @Override
  public List<RevExchangeVO> revExchangeCntSeven() {
    List<RevExchangeVO> revExchangeCntSeven = sqlSession.selectList("exchange.dao.ExchangeDAO.revExchangeCntSeven");
    return revExchangeCntSeven;
  }

  /**
   * 오늘 하루 환전 수 구하기
   * @return
   */
  @Override
  public int exchangeCntOne() {
    int exchangeCntOne = sqlSession.selectOne("exchange.dao.ExchangeDAO.exchangeCntOne");
    return exchangeCntOne;
  }


  /**
   * 오늘 하루 환전 예약 수 구하기
   * @return
   */
  @Override
  public int reserveCntOne() {
    int reserveCntOne = sqlSession.selectOne("exchange.dao.ExchangeDAO.reserveCntOne");
    return reserveCntOne;
  }


  /**
   * 오늘 하루 재환전 수 구하기
   * @return
   */
  @Override
  public int revExchangeCntOne() {
    int revExchangeCntOne = sqlSession.selectOne("exchange.dao.ExchangeDAO.revExchangeCntOne");
    return revExchangeCntOne;
  }
	
  /**
   * 오늘 가장 인기 있었던 외화코드 가져오기
   * @return
   */
  @Override
  public String currencyCodeCntOne() {
    String currency = sqlSession.selectOne("exchange.dao.ExchangeDAO.currencyCodeCntOne");
    return currency;
  }
  
  
  
	
	
  
  
  
  
  
	
	

	
	
	
	
	
	
	
	
}
