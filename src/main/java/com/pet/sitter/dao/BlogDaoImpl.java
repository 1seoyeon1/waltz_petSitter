package com.pet.sitter.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.pet.sitter.vo.BlogCategories;
import com.pet.sitter.vo.BlogLikeVO;
import com.pet.sitter.vo.BlogVO;
import com.pet.sitter.vo.SearchCriteria;

@Repository
public class BlogDaoImpl implements BlogDAO {

   @Inject 
   private SqlSession sqlSession;
   
   @Override
   public void write(BlogVO blogVO) throws Exception {
      sqlSession.insert("blogMapper.insert", blogVO);
   }

   @Override
   public List<BlogVO> list(SearchCriteria scri) throws Exception {
      return sqlSession.selectList("blogMapper.listPage", scri);
   }

   @Override
   public int listCount(SearchCriteria scri) throws Exception {
      return sqlSession.selectOne("blogMapper.listCount", scri);
   }

   @Override
   public BlogVO read(int bno) throws Exception {
      return sqlSession.selectOne("blogMapper.read", bno);
   }

   @Override
   public void update(BlogVO blogVO) throws Exception {

      sqlSession.update("blogMapper.update", blogVO);
   }

   @Override
   public void delete(int bno) throws Exception {
      sqlSession.delete("blogMapper.delete", bno);
   }

   
   @Override
   public void slikeAdd(BlogLikeVO likeVO) throws Exception {
      System.out.println("시터가 블로그를 좋아요 했을때 @@" + likeVO);
      sqlSession.insert("blogMapper.slikeAdd", likeVO);
   }
   
   @Override
   public void mlikeAdd(BlogLikeVO likeVO) throws Exception {
	   System.out.println("멤버가 블로그를 좋아요 했을때 ! ");
   	// TODO Auto-generated method stub
       sqlSession.insert("blogMapper.mlikeAdd", likeVO);
   }
   
   public void likeDelete(BlogLikeVO likeVO) throws Exception{
      System.out.println("블로그LIKE DELETE 에  VO 에 값은= " + likeVO);

      sqlSession.delete("blogMapper.likeDelete", likeVO);
   }

   @Override
   public BlogLikeVO likeRead(BlogLikeVO likeVO) throws Exception {
      // TODO Auto-generated method stub

      return sqlSession.selectOne("blogMapper.likeRead", likeVO);
   }

   @Override
   public int likeTotal(int bno) throws Exception {
      // TODO Auto-generated method stub
      return sqlSession.selectOne("blogMapper.likeTotal", bno);
   }

@Override
public BlogCategories blogCategoryCnt() throws Exception {
	// TODO Auto-generated method stub
	return sqlSession.selectOne("blogMapper.blogCategoryCnt");
}

@Override
public List<BlogVO> blogCategoryList(String blogCat) throws Exception {
	// TODO Auto-generated method stub
	System.out.println("블로그 카테고리 리스트 에 매개변수 값은 ? >> " + blogCat);
	return sqlSession.selectList("blogMapper.listCategory", blogCat);
}

@Override
public int blogCategoryCount(String blog_category) throws Exception {
	// TODO Auto-generated method stub
	return sqlSession.selectOne("blogMapper.blogCategoryCount", blog_category);
}
}