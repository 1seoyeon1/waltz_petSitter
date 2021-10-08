package com.pet.sitter.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.pet.sitter.dao.PetInfoDAO;
import com.pet.sitter.vo.PetInfoVO;

@Service
public class PetInfoServiceImpl implements PetInfoService{
	
	@Inject PetInfoDAO pdao;
	
	@Override
	public void petinfoWrite(PetInfoVO pvo) throws Exception {
		// TODO Auto-generated method stub
		pdao.petinfoWrite(pvo);
	}

	@Override
	public List<PetInfoVO> list(String email) throws Exception {
		// TODO Auto-generated method stub
		return pdao.list(email);
	}

	@Override
	public int listCount(int pno) throws Exception {
		// TODO Auto-generated method stub
		return pdao.listCount(pno);
	}

	@Override
	public PetInfoVO readPetInfo(int pno) throws Exception {
		// TODO Auto-generated method stub
		return pdao.readPetInfo(pno);
	}

	@Override
	public void updatePetInfo(PetInfoVO pvo) throws Exception {
		// TODO Auto-generated method stub
		pdao.updatePetInfo(pvo);
	}

	@Override
	public void deletePetInfo(int pno) throws Exception {
		// TODO Auto-generated method stub
		pdao.deletePetInfo(pno);
	}
	
	@Override
	public void petImageUpdate(PetInfoVO pvo) throws Exception {
		// TODO Auto-generated method stub
		pdao.petImageUpdate(pvo);
	}
}
