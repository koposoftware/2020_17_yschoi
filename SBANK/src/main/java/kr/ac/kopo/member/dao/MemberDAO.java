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
	
	
}
