package kr.ac.kopo.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.member.dao.MemberDAO;
import kr.ac.kopo.member.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public MemberVO login(MemberVO member) {
		
		return memberDAO.login(member);
	}
	
	/**
	 * id로 이름 조회
	 */
  @Override
  public String chkAccountOwnName(String id) {
    String name = memberDAO.chkAccountOwnName(id);
    return name;
  }
  
  
  
  /**
   * 구글 OTP코드 연동하기
   * @param encodedKey
   */
  @Override
  public void otpCodeSave(MemberVO member) {
    memberDAO.otpCodeSave(member);
  }
  
  /**
   * 로그인 한 아이디의 otpcode 가져오기
   * @param id
   * @return
   */
  @Override
  public String getOtpCodeById(String id) {
    String code = memberDAO.getOtpCodeById(id);
    return code;
  }
  
  /**
   * 일반사용자 통계 plus
   */
  @Override
  public void setCntPlusNormal() {
    memberDAO.setCntPlusNormal();
  }
  
  /**
   * 카카오 아이디 사용자 통계 plus
   */
  @Override
  public void setCntPlusKakao() {
    // TODO Auto-generated method stub
    memberDAO.setCntPlusKakao();
  }
	
	
  
  
  
  
  
	
	

}

