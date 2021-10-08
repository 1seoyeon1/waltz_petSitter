package com.pet.sitter.dao;


import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pet.sitter.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	SqlSession membersql;
  
	@Override
	public void memberRegister(MemberVO mvo) throws Exception {
		
		membersql.insert("memberMapper.memberRegister", mvo);
	}

	@Override
	public MemberVO memberLogin(MemberVO mvo) throws Exception {
		return membersql.selectOne("memberMapper.memberLogin", mvo);
	}

	@Override
	public int memberEmailChk(MemberVO mvo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("이메일 체크 전 VO 값은? : " + mvo.getUser_email());
		return membersql.selectOne("memberMapper.memberemailChk" , mvo);
		
	}

	@Override
	public int memberPhoneChk(MemberVO mvo) throws Exception {
		// TODO Auto-generated method stub
		return membersql.selectOne("memberMapper.memberphoneChk" , mvo);
	}

	@Override
	public int memberLoginChk(MemberVO mvo) {
		// TODO Auto-generated method stub
		return membersql.selectOne("memberMapper.memberLoginChk", mvo);
	}

	@Override
	public void memberDelete(MemberVO mvo) throws Exception {
		// TODO Auto-generated method stub
		membersql.delete("memberMapper.memberDelete" , mvo);
	}

	@Override
	public MemberVO memberProfile(String email) throws Exception {
		// TODO Auto-generated method stub
		return membersql.selectOne("memberMapper.memberProfile" , email);
	}

	@Override
	public void memberProfileUpdate(MemberVO mvo) throws Exception {
		// TODO Auto-generated method stub
		membersql.update("memberMapper.memberProfileUpdate" , mvo);
		
	}

	@Override
	public String memberDeleteChk(MemberVO mvo) throws Exception {
		// TODO Auto-generated method stub
		return membersql.selectOne("memberMapper.memberDeleteChk" , mvo);
	}
	
	


	

}
