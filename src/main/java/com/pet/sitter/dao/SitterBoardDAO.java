package com.pet.sitter.dao;

import java.util.List;
import java.util.Map;

import com.pet.sitter.vo.PetInfoVO;
import com.pet.sitter.vo.ReserveVO;
import com.pet.sitter.vo.ReviewVO;
import com.pet.sitter.vo.SearchCriteria;
import com.pet.sitter.vo.SitterBoardVO;

public interface SitterBoardDAO {
	// sitter 프로필리스트 조회
	public List<SitterBoardVO> sbList(SearchCriteria scri) throws Exception;

	// sitter 프로필 디테일 조회
	public SitterBoardVO profileView(String email) throws Exception;
	
	// sitter 프로필 총 개수
	public int listCount(SearchCriteria scri) throws Exception;
	
	// sitter 프로필 수정
	public void update(SitterBoardVO sbvo) throws Exception;

	// sitter 프로필 이미지 수정
	public void updateImage(String image) throws Exception;

	// sitter 예약 전송
	public void sendReq(ReserveVO rvo) throws Exception;

	// sitter 예약요청 리스트(sitter 확인창)
	public List<ReserveVO> rqList(Map<String,Object> map) throws Exception;

	// sitter 예약요청 내용보기
	public ReserveVO rqView(int reno)throws Exception;

	// sitter 예약요청 총 개수
	public int rqlistCount(String sitter_email) throws Exception;

	// 예약 요청 거절
	public void rqReject(int num) throws Exception;

	// 예약 요청 수락
	public void acceptRq(int num) throws Exception;

	// sitter별 요청받은 리스트 전체내역
	public List<ReserveVO> reserveList(String sitter_email) throws Exception;

	// 요청내역 펫정보
	public List<PetInfoVO> petinfo(String user_email) throws Exception;

	// 읽지 않은 요청 개수
	public int newRqCount(String sitter_email) throws Exception;

	// 신규 예약요청 리스트
	public List<ReserveVO> newrqList(Map<String, Object> map) throws Exception;

	// member 예약요청 보기
	public List<ReserveVO> mrqList(Map<String,Object> map) throws Exception;

	// member 예약요청 카운트
	public int mrqListCount(String member) throws Exception;

	public void rqcancel(int reno) throws Exception;

	public SitterBoardVO rq_sittpf(int reno) throws Exception;

	public ReserveVO rq_info(int reno) throws Exception;

	public List<ReviewVO> rvList() throws Exception;
	
}
