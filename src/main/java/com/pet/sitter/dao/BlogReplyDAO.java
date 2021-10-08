package com.pet.sitter.dao;

import java.util.List;

import com.pet.sitter.vo.ReplyVO;

public interface BlogReplyDAO {

	//댓글들 조회
		public List<ReplyVO> readReply(int bno) throws Exception;
		
		public void writeReply(ReplyVO vo) throws Exception;
				
		public void deleteReply(ReplyVO vo)  throws Exception;
		
		//선택된 댓글 조회
		public ReplyVO selectReply(int rno)  throws Exception;

		public int replyTotal(int bno) throws Exception;
}
