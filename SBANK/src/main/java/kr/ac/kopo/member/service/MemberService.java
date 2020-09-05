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
	
}
