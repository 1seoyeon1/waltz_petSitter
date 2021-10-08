package com.pet.sitter.service;

import com.pet.sitter.vo.SitterVO;

public interface SitterService {
	
	
	public void sitterRegister(SitterVO svo) throws Exception;
	
	public SitterVO sitterLogin(SitterVO svo)throws Exception;
	
	public int sitterEmailChk(SitterVO svo)throws Exception;
	
	public int sitterPhoneChk(SitterVO svo)throws Exception;

	public int sitterLoginChk(SitterVO svo)throws Exception;
	
	

}
