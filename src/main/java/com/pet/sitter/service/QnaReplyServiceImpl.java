package com.pet.sitter.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.pet.sitter.dao.QnaReplyDAO;
import com.pet.sitter.vo.QnaReplyVO;

@Service
public class QnaReplyServiceImpl implements QnaReplyService{
	
	@Inject
	private QnaReplyDAO dao;

	//qna 답변 목록
	@Override
	public List<QnaReplyVO> readReply(int qno) throws Exception {
		return dao.readReply(qno);
	}
	//시터 이미지 조회
	@Override
	public String SitterImageView(String sitter_email) throws Exception {
		return dao.SitterImageView(sitter_email);		
	}
		
	//qna 답변 작성
	@Override
	public void writeReply(QnaReplyVO vo) throws Exception {
		dao.writeReply(vo);
	}

	//qna 답변 수정
	@Override
	public void updateReply(QnaReplyVO vo) throws Exception {
		dao.updateReply(vo);
	}

	//qna 답변 삭제
	@Override
	public void deleteReply(QnaReplyVO vo) throws Exception {
		dao.deleteReply(vo);
	}

	//선택된 qna 답변 조회
	@Override
	public QnaReplyVO selectReply(int qna_rno) throws Exception {
		return dao.selectReply(qna_rno);
	}

	// 답글전체조회
	@Override
	public List<QnaReplyVO> replyList() throws Exception {
		return dao.replyList();
	}
	@Override
	public int replyTotal(int bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.replyTotal(bno);
	}
	
	
	
	

}
