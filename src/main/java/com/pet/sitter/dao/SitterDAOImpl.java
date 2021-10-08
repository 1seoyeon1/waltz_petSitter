package com.pet.sitter.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pet.sitter.vo.SitterVO;

@Repository
public class SitterDAOImpl implements SitterDAO{

	
	@Autowired 
	SqlSession sittersql;
	
	@Override
	public void sitterRegister(SitterVO svo) throws Exception {
		// TODO Auto-generated method stub
		sittersql.insert("sitterMapper.sitterRegister" , svo);
		  sittersql.insert("sitterMapper.sitterInfo",svo);
	}
	@Override
	public SitterVO sitterLogin(SitterVO svo) throws Exception {
		// TODO Auto-generated method stub
		return sittersql.selectOne("sitterMapper.sitterLogin" , svo);
	}
	@Override
	public int sitterEmailChk(SitterVO svo) throws Exception {
		// TODO Auto-generated method stub
		return sittersql.selectOne("sitterMapper.sitteremailChk" , svo);
	}

	@Override
	public int sitterPhoneChk(SitterVO svo) throws Exception {
		// TODO Auto-generated method stub
		return sittersql.selectOne("sitterMapper.sitterphoneChk" , svo);
	}

	@Override
	public int sitterLoginChk(SitterVO svo) {
		// TODO Auto-generated method stub
		return sittersql.selectOne("sitterMapper.sitterLoginChk" , svo);
	}
}
