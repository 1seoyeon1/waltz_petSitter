package com.pet.sitter.dao;

import com.pet.sitter.vo.SitterVO;

public interface SitterDAO {
	
	
    public void sitterRegister(SitterVO svo) throws Exception;
	
	public SitterVO sitterLogin(SitterVO svo)throws Exception;
	
	public int sitterEmailChk(SitterVO svo)throws Exception;
	
	public int sitterPhoneChk(SitterVO svo)throws Exception;

	public int sitterLoginChk(SitterVO svo);

}
