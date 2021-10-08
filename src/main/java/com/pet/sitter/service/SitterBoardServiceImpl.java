package com.pet.sitter.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.pet.sitter.dao.SitterBoardDAO;
import com.pet.sitter.vo.PetInfoVO;
import com.pet.sitter.vo.ReserveVO;
import com.pet.sitter.vo.ReviewVO;
import com.pet.sitter.vo.SearchCriteria;
import com.pet.sitter.vo.SitterBoardVO;

@Service
public class SitterBoardServiceImpl implements SitterBoardService{

	@Inject
	private SitterBoardDAO sb_dao;
	
	// 프로필 리스트 조회
	@Override
	public List<SitterBoardVO> sbList(SearchCriteria scri) throws Exception {
		return sb_dao.sbList(scri);
	}
	
	// 프로필 상세 뷰
	@Override
	public SitterBoardVO profileView(String email) throws Exception {
		return sb_dao.profileView(email);
	}
	

	// sitterBoardList 총 개수
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return sb_dao.listCount(scri);
	}

	// 프로필 수정
	@Override
	public void update(SitterBoardVO sbvo) throws Exception {
		sb_dao.update(sbvo);
	}

	// 이미지 수정
	@Override
	public void updateImage(String image) throws Exception {
		sb_dao.updateImage(image);
	}

	// 예약 요청보내기
	@Override
	public void sendReq(ReserveVO rvo) throws Exception {
		sb_dao.sendReq(rvo);
	}

	// 예약요청 리스트 (sitter 확인창)
	@Override
	public List<ReserveVO> rqList(Map<String,Object> map) throws Exception {
		return sb_dao.rqList(map);
	}

	// 예약 요청 내용 보기
	@Override
	public ReserveVO rqView(int reno) throws Exception {
		return sb_dao.rqView(reno);
	}

	// 예약 요청 총 개수
	@Override
	public int rqlistCount(String sitter_email) throws Exception {
		return sb_dao.rqlistCount(sitter_email);
	}


	// 예약요청 거절
	@Override
	public void rqReject(int num) throws Exception {
		sb_dao.rqReject(num);
	}

	// 예약요청 수락
	@Override
	public void acceptRq(int num) throws Exception {
		sb_dao.acceptRq(num);
	}

	// sitter별 요청받은 리스트 전체내역
	@Override
	public List<ReserveVO> reserveList(String sitter_email) throws Exception {
		return sb_dao.reserveList(sitter_email);
	}

	// 요청내역 펫 정보 
	@Override
	public List<PetInfoVO> petinfo(String user_email) throws Exception {
		return sb_dao.petinfo(user_email);
	}

	// 신규 요청 개수
	@Override
	public int newRqCount(String sitter_email) throws Exception {
		return sb_dao.newRqCount(sitter_email);
	}

	// 신규 요청 리스트
	@Override
	public List<ReserveVO> newrqList(Map<String, Object> map) throws Exception {
		return sb_dao.newrqList(map);
	}

	@Override
	public List<ReserveVO> mrqList(Map<String,Object> map) throws Exception {
		// TODO Auto-generated method stub
		return sb_dao.mrqList(map);
	}

	@Override
	public int mrqlistCount(String member) throws Exception {
		// TODO Auto-generated method stub
		return sb_dao.mrqListCount(member);
	}

	// member 요청 취소
	@Override
	public void rqcancel(int reno) throws Exception {
		sb_dao.rqcancel(reno);
	}

	// member rq리스트에서 sitter 프로필보기
	@Override
	public SitterBoardVO rq_sittpf(int reno) throws Exception {
		return sb_dao.rq_sittpf(reno);
	}

	@Override
	public ReserveVO rq_info(int reno) throws Exception {
		return sb_dao.rq_info(reno);
	}

	@Override
	public List<ReviewVO> rvList() throws Exception {
		return sb_dao.rvList();
	}
}
