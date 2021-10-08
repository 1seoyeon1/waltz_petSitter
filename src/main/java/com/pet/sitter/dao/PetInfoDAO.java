package com.pet.sitter.dao;

import java.util.List;

import com.pet.sitter.vo.PetInfoVO;

public interface PetInfoDAO {
	
	
	    // 펫 정보 게시물 작성
		public void petinfoWrite(PetInfoVO pvo)throws Exception;
		
		// 펫 정보 게시물 목록 조회
		public List<PetInfoVO> list(String email) throws Exception;
		
		// 펫 정보 게시물 총 갯수
		public int listCount(int pno) throws Exception;
		
		// 펫 정보 게시물 조회
		public PetInfoVO readPetInfo(int pno) throws Exception;
		
		// 펫 정보 게시물 수정
		public void updatePetInfo(PetInfoVO pvo) throws Exception;
		
		// 펫 정보 게시물 삭제
		public void deletePetInfo(int pno) throws Exception;
		
		// 펫 이미지 수정
		public void petImageUpdate(PetInfoVO pvo) throws Exception;

}
