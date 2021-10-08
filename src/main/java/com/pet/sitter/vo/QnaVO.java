package com.pet.sitter.vo;

import java.util.Date;

public class QnaVO {
	
	private int qno;
	private String qna_title;
	private String qna_category;
	private String qna_content;
	private String user_email;
	private Date qna_date;
	private int reply;
	
	
	public int getQno() {
		return qno;
	}
	public void setQno(int qno) {
		this.qno = qno;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getQna_category() {
		return qna_category;
	}
	public void setQna_category(String qna_category) {
		this.qna_category = qna_category;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public Date getQna_date() {
		return qna_date;
	}
	public void setQna_date(Date qna_date) {
		this.qna_date = qna_date;
	}
	
	
	public int getReply() {
		return reply;
	}
	public void setReply(int reply) {
		this.reply = reply;
	}
	@Override
	public String toString() {
		return "QnaVO [qno=" + qno + ", qna_title=" + qna_title + ", qna_category=" + qna_category + ", qna_content="
				+ qna_content + ", user_email=" + user_email + ", qna_date=" + qna_date + "]";
	}
	
	
	
	
	

}
