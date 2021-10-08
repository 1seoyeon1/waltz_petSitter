package com.pet.sitter.dao;

import java.util.List;

import com.pet.sitter.vo.BlogCategories;
import com.pet.sitter.vo.BlogLikeVO;
import com.pet.sitter.vo.BlogVO;
import com.pet.sitter.vo.SearchCriteria;

public interface BlogDAO {

   //게시글 작성
   public void write(BlogVO blogVO) throws Exception;
   
   //게시물 목록 조회
   public List<BlogVO> list(SearchCriteria scri) throws Exception;
   
   
   public List<BlogVO> blogCategoryList(String blogCat) throws Exception;
   
   //게시물 총 갯수
   public int listCount(SearchCriteria scri) throws Exception;
   
   //게시물 조회
   public BlogVO read(int bno)throws Exception;
   
   //게시물 수정
   public void update(BlogVO boardVO)throws Exception;
   
   //게시물 삭제
   public void delete(int bno) throws Exception;
   
   //게시물 좋아요 확인
   public BlogLikeVO likeRead(BlogLikeVO likeVO)throws Exception;
   
   //게시물 좋아요
   public void slikeAdd(BlogLikeVO likeVO) throws Exception;
   
   //게시물 좋아요
   public void mlikeAdd(BlogLikeVO likeVO) throws Exception;
   
   //게시물 좋아요 취소
   public void likeDelete(BlogLikeVO likeVO) throws Exception;
   
   //게시물 좋아요 총 갯수
   public int likeTotal(int bno) throws Exception;
   
   public BlogCategories blogCategoryCnt() throws Exception;
   
   public int blogCategoryCount(String blog_category) throws Exception;
}