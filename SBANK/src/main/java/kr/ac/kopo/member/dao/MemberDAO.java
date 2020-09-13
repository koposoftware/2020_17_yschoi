package kr.ac.kopo.member.dao;

import kr.ac.kopo.member.vo.MemberVO;

public interface MemberDAO {

	MemberVO login(MemberVO member);
	
	/**
	 * id로 이름 조회
	 * @param id
	 * @return
	 */
	public String chkAccountOwnName(String id);
	
	
	
	/**
   * 구글 OTP코드 연동하기
   * @param encodedKey
   */
  public void otpCodeSave(MemberVO member);
  
  
  /**
   * 로그인 한 아이디의 otpcode 가져오기
   * @param id
   * @return
   */
  public String getOtpCodeById(String id);
  
  
  
  
  
	
	
}
