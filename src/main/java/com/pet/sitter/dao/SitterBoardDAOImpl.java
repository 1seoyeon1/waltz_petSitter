package com.pet.sitter.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.pet.sitter.vo.PetInfoVO;
import com.pet.sitter.vo.ReserveVO;
import com.pet.sitter.vo.ReviewVO;
import com.pet.sitter.vo.SearchCriteria;
import com.pet.sitter.vo.SitterBoardVO;

@Repository
public class SitterBoardDAOImpl implements SitterBoardDAO{

	@Inject 
	private SqlSession session;
	
	// 리스트 조회
	@Override
	public List<SitterBoardVO> sbList(SearchCriteria scri) throws Exception {
		return session.selectList("sitterBoardMapper.sbList",scri);
	}

	// 프로필 상세조회 
	@Override
	public SitterBoardVO profileView(String email) throws Exception {
		SitterBoardVO ss=session.selectOne("sitterBoardMapper.profileView",email);
		System.out.println("주소 왜안줘???"+ss.getSitter_addr());
		return session.selectOne("sitterBoardMapper.profileView",email);
	}
	
	// sitterBoardList 총 개수
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return session.selectOne("sitterBoardMapper.listCount",scri);
	}

	// 프로필 수정
	@Override
	public void update(SitterBoardVO sbvo) throws Exception {
		session.update("sitterBoardMapper.editBoard",sbvo);
		session.update("sitterBoardMapper.editMember",sbvo);
	}

	// 이미지 수정
	@Override
	public void updateImage(String image) throws Exception {
		session.update("sitterBoardMapper.editImage",image);
	}
	
	// sitter 예약 요청
	@Override
	public void sendReq(ReserveVO rvo) throws Exception {
		session.insert("sitterBoardMapper.insertrq",rvo);
	}

	// sitter 수락 대기중 요청리스트
	@Override
	public List<ReserveVO> rqList(Map<String,Object> map) throws Exception {
		return session.selectList("sitterBoardMapper.rqList",map);
	}
	
	// sitter 수락 대기중 요청리스트
	@Override
	public List<ReserveVO> newrqList(Map<String,Object> map) throws Exception {
		return session.selectList("sitterBoardMapper.newrqList",map);
	}

	// 예약요청 내용보기
	@Override
	public ReserveVO rqView(int reno) throws Exception {
		session.update("sitterBoardMapper.readCh",reno);
		return session.selectOne("sitterBoardMapper.rqView",reno);
	}
	
	// 예약요청 총 개수
	@Override
	public int rqlistCount(String sitter_email) throws Exception {
		return session.selectOne("sitterBoardMapper.rqlistCount",sitter_email);
	}

	// 예약요청 거절
	@Override
	public void rqReject(int num) throws Exception {
		session.update("sitterBoardMapper.rqReject",num);
	}

	// 예약요청 수락
	@Override
	public void acceptRq(int num) throws Exception {
		session.update("sitterBoardMapper.rqAccept",num);
	}

	// sitter별 요청받은 리스트 전체내역
	@Override
	public List<ReserveVO> reserveList(String sitter_email) throws Exception {
		return session.selectList("sitterBoardMapper.reserveList",sitter_email);
	}

	// 요청내역 펫정보
	@Override
	public List<PetInfoVO> petinfo(String user_email) throws Exception {
		return session.selectList("sitterBoardMapper.petinfo",user_email);
	}

	// 읽지 않은 요청 개수
	@Override
	public int newRqCount(String sitter_email) throws Exception {
		return session.selectOne("sitterBoardMapper.newRqCount",sitter_email);
	}

	@Override
	public List<ReserveVO> mrqList(Map map) throws Exception {
		// TODO Auto-generated method stub
	 return session.selectList("sitterBoardMapper.mrqList",map);
	}

	@Override
	public int mrqListCount(String member) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("sitterBoardMapper.mrqListCount" , member);
	}

	//member 요청 취소
	@Override
	public void rqcancel(int reno) throws Exception {
		session.delete("sitterBoardMapper.rqcancel",reno);
	}

	// member rq리스트에서 sitter 프로필보기
	@Override
	public SitterBoardVO rq_sittpf(int reno) throws Exception {
		return session.selectOne("sitterBoardMapper.rqSittPf",reno);
	}

	@Override
	public ReserveVO rq_info(int reno) throws Exception {
		return session.selectOne("sitterBoardMapper.rqInfo",reno);
	}

	@Override
	public List<ReviewVO> rvList() throws Exception {
		return session.selectList("sitterBoardMapper.rvList");
	}

}
