package com.pet.sitter.service;

import java.util.List;

import com.pet.sitter.vo.ReserveVO;
import com.pet.sitter.vo.ReviewVO;
import com.pet.sitter.vo.SearchCriteria;
import com.pet.sitter.vo.SitterBoardVO;

public interface ReviewService {

	// 리뷰 게시물 작성
	public void writeReview(ReviewVO vo) throws Exception;
	
	// 리뷰 게시물 목록 조회
	public List<ReviewVO> list(SearchCriteria scri) throws Exception;

	// 리뷰 게시물 총 갯수
    public int listCount(SearchCriteria scri) throws Exception;
	
	// 리뷰 게시물 조회
	public ReviewVO readReview(int rno) throws Exception;
	
	// 리뷰 게시물 수정
	public void update(ReviewVO ReviewVO) throws Exception;

	// 이미지 수정
	public void imageUpdate(ReviewVO ReviewVO) throws Exception;
	
	// 리뷰 게시물 삭제
	public void delete(int rno) throws Exception;

	// ReserveVO에서 이용시간을 얻어오기위해 작성
	public List<ReserveVO> getTime(int reno) throws Exception;
	
	// sitter 프로필에 이미지를 가져오기위해 작성
	public String getImage(String sitter_email) throws Exception;

	// review main 페이지에서 글작성버튼이 언제 떠야하는지 지정하기위해 작성
	public List<ReserveVO> getRead(String user_email) throws Exception;

}
