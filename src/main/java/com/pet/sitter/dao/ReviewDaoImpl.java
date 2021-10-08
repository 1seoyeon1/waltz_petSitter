package com.pet.sitter.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.pet.sitter.vo.ReserveVO;
import com.pet.sitter.vo.ReviewVO;
import com.pet.sitter.vo.SearchCriteria;

@Repository
public class ReviewDaoImpl implements ReviewDao{

	@Inject
	private SqlSession session;

	@Override
	public void writeReview(ReviewVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert("ReviewMapper.insert", vo);
	    session.update("ReviewMapper.rvupdate", vo);
	}

	@Override
	public ReviewVO readReview(int rno) throws Exception {
		// TODO Auto-generated method stub
		
		return session.selectOne("ReviewMapper.read", rno);
	}

	@Override
	public List<ReviewVO> list(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("ReviewMapper.listPage", scri);
	}

	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("ReviewMapper.listCount", scri);
	}

	@Override
	public void update(ReviewVO ReviewVO) throws Exception {
		// TODO Auto-generated method stub
		 session.update("ReviewMapper.update", ReviewVO);
	}

	@Override
	public void delete(int rno) throws Exception {
		// TODO Auto-generated method stub
		session.delete("ReviewMapper.delete", rno);
	}

	@Override
	public void imageUpdate(ReviewVO ReviewVO) throws Exception {
		// TODO Auto-generated method stub
		session.update("ReviewMapper.imageUpdate", ReviewVO);
	}

	@Override
	public List<ReserveVO> getTime(int reno) throws Exception {
		// TODO Auto-generated method stub
	return session.selectList("ReviewMapper.getTime", reno);
	}

	@Override
	public String getImage(String sitter_email) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("ReviewMapper.getImage", sitter_email);
	}

	@Override
	public List<ReserveVO> getRead(String user_email) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("ReviewMapper.getRead", user_email);
	}
}
