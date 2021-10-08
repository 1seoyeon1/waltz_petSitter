package com.pet.sitter.vo;

import java.util.Date;

public class BlogLikeVO {

   private int likeBlog_bno;
   private String likeBlog_email;
   private int likeBlog_status;
   private Date likeBlog_regDate;
   private int tc;
   private int rc;
   
   public int getTc() {
	return tc;
}
public void setTc(int tc) {
	this.tc = tc;
}
public int getRc() {
	return rc;
}
public void setRc(int rc) {
	this.rc = rc;
}
public int getLikeBlog_bno() {
      return likeBlog_bno;
   }
   public Date getLikeBlog_regDate() {
      return likeBlog_regDate;
   }
   public void setLikeBlog_regDate(Date likeBlog_regDate) {
      this.likeBlog_regDate = likeBlog_regDate;
   }
   public void setLikeBlog_bno(int likeBlog_bno) {
      this.likeBlog_bno = likeBlog_bno;
   }
   public String getLikeBlog_email() {
      return likeBlog_email;
   }
   public void setLikeBlog_email(String likeBlog_email) {
      this.likeBlog_email = likeBlog_email;
   }
   public int getLikeBlog_status() {
      return likeBlog_status;
   }
   public void setLikeBlog_status(int likeBlog_status) {
      this.likeBlog_status = likeBlog_status;
   }
   
}