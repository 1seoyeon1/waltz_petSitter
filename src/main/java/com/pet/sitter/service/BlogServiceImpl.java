package com.pet.sitter.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.pet.sitter.dao.BlogDAO;
import com.pet.sitter.vo.BlogCategories;
import com.pet.sitter.vo.BlogLikeVO;
import com.pet.sitter.vo.BlogVO;
import com.pet.sitter.vo.SearchCriteria;

@Service
public class BlogServiceImpl implements BlogService {

   @Inject
   BlogDAO dao;
   
   @Override
   public void write(BlogVO blogVO) throws Exception {
      dao.write(blogVO);
   }

   @Override
   public List<BlogVO> list(SearchCriteria scri) throws Exception {
      return dao.list(scri);
   }

   @Override
   public int listCount(SearchCriteria scri) throws Exception {
      return dao.listCount(scri);
   }

   @Override
   public BlogVO read(int bno) throws Exception {
      return dao.read(bno);
   }

   @Override
   public void update(BlogVO blogVO) throws Exception {
      dao.update(blogVO);
   }

   @Override
   public void delete(int bno) throws Exception {

      dao.delete(bno);
   }
//좋아요 추가
   @Override
   public void slikeAdd(BlogLikeVO likeVO) throws Exception {
      dao.slikeAdd(likeVO);
   }
   
   @Override
   public void mlikeAdd(BlogLikeVO likeVO) throws Exception {
   	// TODO Auto-generated method stub
   	dao.mlikeAdd(likeVO);
   }
//좋아요 삭제
   @Override
   public void likeDelete(BlogLikeVO likeVO) throws Exception{
      dao.likeDelete(likeVO);
   }
//좋아요 불러오기
   public BlogLikeVO likeRead(BlogLikeVO likeVO) throws Exception{
      return dao.likeRead(likeVO);
   }

   @Override
   public int likeTotal(int bno) throws Exception {
      // TODO Auto-generated method stub
      return dao.likeTotal(bno);
   }

@Override
public BlogCategories blogCategoryCnt() throws Exception {
	// TODO Auto-generated method stub
	return dao.blogCategoryCnt();
}

@Override
public List<BlogVO> blogCategoryList(String blogCat) throws Exception {
	// TODO Auto-generated method stub
	return dao.blogCategoryList(blogCat);
}

@Override
public int blogCategoryCount(String blog_category) throws Exception {
	// TODO Auto-generated method stub
	return dao.blogCategoryCount(blog_category);
}
}