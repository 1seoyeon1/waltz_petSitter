package com.pet.sitter.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.pet.sitter.vo.ReplyVO;

@Repository
public class BlogReplyDaoImpl implements BlogReplyDAO {

	@Inject SqlSession sql;
	
	
	@Override
	public List<ReplyVO> readReply(int bno) throws Exception {
		return sql.selectList("blogreplyMapper.blogreadReply", bno);
	}

	@Override
	public void writeReply(ReplyVO vo) throws Exception {
		sql.insert("blogreplyMapper.blogwriteReply", vo);
	}

	@Override
	public void deleteReply(ReplyVO vo) throws Exception {
		sql.delete("blogreplyMapper.blogdeleteReply", vo);
	}

	@Override
	public ReplyVO selectReply(int rno) throws Exception {
		return sql.selectOne("blogreplyMapper.blogselectReply", rno);
	}

	@Override
	public int replyTotal(int bno) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne("blogreplyMapper.blogreplyTotal", bno);
	}
}
