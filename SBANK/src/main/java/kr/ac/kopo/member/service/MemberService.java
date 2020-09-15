package kr.ac.kopo.member.service;

import kr.ac.kopo.member.vo.MemberVO;

public interface MemberService {

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
	
	/**
	 * 일반사용자 통계 plus
	 */
	public void setCntPlusNormal();
	
	/**
   * 카카오 아이디 사용자 통계 plus
   */
	public void setCntPlusKakao();
	
	
	
	
	
}
