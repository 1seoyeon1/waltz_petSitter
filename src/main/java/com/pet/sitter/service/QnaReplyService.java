package com.pet.sitter.service;

import java.util.List;

import com.pet.sitter.vo.QnaReplyVO;


public interface QnaReplyService {

	//qna 답변 조회
	public List<QnaReplyVO> readReply(int qno) throws Exception;

	//시터 이미지 조회
	public String SitterImageView(String sitter_email) throws Exception;

	//qna 답변 작성
	public void writeReply(QnaReplyVO vo) throws Exception;

	//qna 답변 수정
	public void updateReply(QnaReplyVO vo) throws Exception;

	//qna 답변 삭제
	public void deleteReply(QnaReplyVO vo) throws Exception;

	//선택된 qna 답변 조회
	public QnaReplyVO selectReply(int qna_rno) throws Exception;

	//답글 전체조회
	public List<QnaReplyVO> replyList() throws Exception;
	
	public int replyTotal(int bno) throws Exception;
	
		
}
