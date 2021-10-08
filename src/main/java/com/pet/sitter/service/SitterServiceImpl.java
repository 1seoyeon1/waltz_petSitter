package com.pet.sitter.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.pet.sitter.dao.SitterDAO;
import com.pet.sitter.vo.SitterVO;

@Service
public class SitterServiceImpl implements SitterService{
	
    @Inject
	SitterDAO sdao;
	
	@Override
	public void sitterRegister(SitterVO svo) throws Exception {
		// TODO Auto-generated method stub
	   sdao.sitterRegister(svo);	
	}

	@Override
	public SitterVO sitterLogin(SitterVO svo) throws Exception {
		// TODO Auto-generated method stub
		return sdao.sitterLogin(svo);		
		
	}

	@Override
	public int sitterEmailChk(SitterVO svo) throws Exception {
		// TODO Auto-generated method stub
		return sdao.sitterEmailChk(svo);
	}

	@Override
	public int sitterPhoneChk(SitterVO svo) throws Exception {
		// TODO Auto-generated method stub
		return sdao.sitterPhoneChk(svo);
	}

	@Override
	public int sitterLoginChk(SitterVO svo) throws Exception {
		// TODO Auto-generated method stub
		return sdao.sitterLoginChk(svo);
	}
	
	
	
	
	
	
	
	
	
	

}
