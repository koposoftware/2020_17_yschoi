package kr.ac.kopo.member.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.member.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public MemberVO login(MemberVO member) {
		
		MemberVO loginVO = sqlSession.selectOne("member.dao.MemberDAO.login", member);
		//System.out.println("check"+member);
		
		return loginVO;
	}

  @Override
  public String chkAccountOwnName(String id) { 
    String name = sqlSession.selectOne("member.dao.MemberDAO.chkAccountOwnName", id);
    return name;
  }
	
	
  /**
   * 구글 OTP코드 연동하기
   * @param encodedKey
   */
  @Override
  public void otpCodeSave(MemberVO member) {
    sqlSession.update("member.dao.MemberDAO.otpCodeSave", member);
  }
  
  
  /**
   * 로그인 한 아이디의 otpcode 가져오기
   * @param id
   * @return
   */
  @Override
  public String getOtpCodeById(String id) {
    String code = sqlSession.selectOne("member.dao.MemberDAO.getOtpCodeById",id);
    return code;
  }

  /**
   * 일반사용자 통계 plus
   */
  @Override
  public void setCntPlusNormal() {
    // TODO Auto-generated method stub
    sqlSession.update("member.dao.MemberDAO.setCntPlusNormal");
  }
  
  /**
   * 카카오 아이디 사용자 통계 plus
   */
  @Override
  public void setCntPlusKakao() {
    // TODO Auto-generated method stub
    sqlSession.update("member.dao.MemberDAO.setCntPlusKakao");
  }
  
  
  
  
  
	
	
	
	

	
}

