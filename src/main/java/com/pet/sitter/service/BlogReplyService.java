package com.pet.sitter.service;

import java.util.List;

import com.pet.sitter.vo.ReplyVO;

public interface BlogReplyService {

public List<ReplyVO> readReply(int bno)  throws Exception;
	
	public void writeReply(ReplyVO vo) throws Exception;
		
	public void deleteReply(ReplyVO vo) throws Exception;
	
	public ReplyVO selectReply(int rno) throws Exception;
	
	public int replyTotal(int bno) throws Exception;
}
