package com.pet.sitter.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.pet.sitter.vo.QnaReplyVO;
import com.pet.sitter.vo.QnaVO;
import com.pet.sitter.vo.SearchCriteria;

@Service
public class QnaDAOImpl implements QnaDAO{
	
	@Inject
	private SqlSession sqlSession;

	
	//qna 작성
	@Override
	public void qnaWrite(QnaVO qnaVO) throws Exception {
		sqlSession.insert("qnaMapper.insert", qnaVO);
	}

	//qna 목록 조회
	@Override
	public List<QnaVO> list(SearchCriteria scri) throws Exception {
		return sqlSession.selectList("qnaMapper.listPage", scri);
	}
	
	//qna 카테고리 조회
	@Override
	public List<QnaVO> calist() throws Exception {
		return sqlSession.selectList("qnaMapper.calist", ".caList");
	}

	//qna 총 갯수
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return sqlSession.selectOne("qnaMapper.listCount", scri);
	}
	
	//qna 조회
	@Override
	public QnaVO qnaRead(int qno) throws Exception {
		return sqlSession.selectOne("qnaMapper.read", qno);
	}
	
	//시터 이미지 조회
	@Override
	public String SitterImageView(String sitter_email) throws Exception {
		return sqlSession.selectOne("qnaMapper.Image",sitter_email);
		
	}
	
	//qna 수정
	@Override
	public void qnaUpdate(QnaVO qnaVO) throws Exception {
		sqlSession.update("qnaMapper.update", qnaVO);
	}
	
	//qna 삭제
	@Override
	public void qnaDelete(int qno) throws Exception {
		sqlSession.delete("qnaMapper.delete", qno);
	}

	@Override
	public List<QnaReplyVO> replylist() throws Exception {
		return sqlSession.selectList("qnaMapper.reply");
	}

    
	
	
	
	

}
