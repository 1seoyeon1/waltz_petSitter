package com.pet.sitter.dao;

import com.pet.sitter.vo.MemberVO;

public interface MemberDAO {

	public void memberRegister(MemberVO mvo) throws Exception;

	public MemberVO memberLogin(MemberVO mvo) throws Exception;
	
	public int memberEmailChk(MemberVO mvo)throws Exception;
	
	public int memberPhoneChk(MemberVO mvo)throws Exception;

	public int memberLoginChk(MemberVO mvo);

	public void memberDelete(MemberVO mvo)throws Exception;
	
	public MemberVO memberProfile(String email) throws Exception;

	public void memberProfileUpdate(MemberVO mvo)throws Exception;
	
	public String memberDeleteChk(MemberVO mvo) throws Exception;

}
