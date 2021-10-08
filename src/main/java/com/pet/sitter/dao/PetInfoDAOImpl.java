package com.pet.sitter.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.pet.sitter.vo.PetInfoVO;

@Repository
public class PetInfoDAOImpl implements PetInfoDAO{
	
	@Inject 
	private SqlSession session;

	@Override
	public void petinfoWrite(PetInfoVO pvo) throws Exception {
		session.insert("petInfoMapper.insert", pvo);
	}

	@Override
	public List<PetInfoVO> list(String email) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("petInfoMapper.listPage", email);
	}

	@Override
	public int listCount(int pno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("petInfoMapper.listCount", pno);
	}

	@Override
	public PetInfoVO readPetInfo(int pno) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("petInfoMapper.read", pno);
	}

	@Override
	public void updatePetInfo(PetInfoVO pvo) throws Exception {
		// TODO Auto-generated method stub
		session.update("petInfoMapper.update", pvo);
	}

	@Override
	public void deletePetInfo(int pno) throws Exception {
		// TODO Auto-generated method stub
		session.delete("petInfoMapper.delete", pno);
	}

	@Override
	public void petImageUpdate(PetInfoVO pvo) throws Exception {
		// TODO Auto-generated method stub
		session.update("petInfoMapper.imageUpdate", pvo);
	}
}
