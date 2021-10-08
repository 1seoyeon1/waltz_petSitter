package com.pet.sitter.vo;

import java.util.Date;


public class BlogVO {
   private int blog_bno;
   private String blog_title;
   private String   blog_content;
   private String blog_semail;
   private String blog_memail;
   private String blog_image;
   public String getBlog_semail() {
	return blog_semail;
}
public void setBlog_semail(String blog_semail) {
	this.blog_semail = blog_semail;
}
public String getBlog_memail() {
	return blog_memail;
}
public void setBlog_memail(String blog_memail) {
	this.blog_memail = blog_memail;
}
private Date blog_date;
   private String blog_category;
   
   public String getBlog_category() {
	return blog_category;
}
public void setBlog_category(String blog_category) {
	this.blog_category = blog_category;
}
   public int getBlog_bno() {
      return blog_bno;
   }
   public void setBlog_bno(int blog_bno) {
      this.blog_bno = blog_bno;
   }
   public String getBlog_title() {
      return blog_title;
   }
   public void setBlog_title(String blog_title) {
      this.blog_title = blog_title;
   }
   public String getBlog_content() {
      return blog_content;
   }
   public void setBlog_content(String blog_content) {
      this.blog_content = blog_content;
   }

   public String getBlog_image() {
      return blog_image;
   }
   public void setBlog_image(String blog_image) {
      this.blog_image = blog_image;
   }
   public Date getBlog_date() {
      return blog_date;
   }
   public void setBlog_date(Date blog_date) {
      this.blog_date = blog_date;
   }
}