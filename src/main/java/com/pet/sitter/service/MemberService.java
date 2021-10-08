package com.pet.sitter.service;

import com.pet.sitter.vo.MemberVO;

public interface MemberService {
	
	public void memberRegister(MemberVO mvo) throws Exception;
	
	public MemberVO memberLogin(MemberVO mvo)throws Exception;
	
	public int memberEmailChk(MemberVO mvo) throws Exception;
	
	public int memberPhoneChk(MemberVO mvo) throws Exception;

	public int memberLoginChk(MemberVO mvo) throws Exception;

	public MemberVO memberProfile(String email) throws Exception;
	
	public void memberprofileUpdate(MemberVO mvo) throws Exception;

	public String memberDeleteChk(MemberVO mvo) throws Exception;
	
	public void memberDelete(MemberVO mvo) throws Exception;
}
