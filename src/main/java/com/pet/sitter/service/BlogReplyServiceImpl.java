package com.pet.sitter.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.pet.sitter.dao.BlogReplyDAO;
import com.pet.sitter.vo.ReplyVO;

@Service
public class BlogReplyServiceImpl implements BlogReplyService {

	@Inject 
	private BlogReplyDAO dao;

	@Override
	public List<ReplyVO> readReply(int bno) throws Exception {
		return dao.readReply(bno);
	}

	@Override
	public void writeReply(ReplyVO vo) throws Exception {
		dao.writeReply(vo);
	}

	@Override
	public void deleteReply(ReplyVO vo) throws Exception {
		dao.deleteReply(vo);
	}

	@Override
	public ReplyVO selectReply(int rno) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectReply(rno);
	}

	@Override
	public int replyTotal(int bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.replyTotal(bno);
	}

	
}
