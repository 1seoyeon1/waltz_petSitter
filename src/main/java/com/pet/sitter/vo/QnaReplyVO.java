package com.pet.sitter.vo;

import java.util.Date;

public class QnaReplyVO {
	
	private int qno;
	private int qna_rno;
	private String qna_reply_content;
	private String sitter_image;
	private String sitter_email;
	private Date qna_reply_date;
	
	public int getQno() {
		return qno;
	}
	public void setQno(int qno) {
		this.qno = qno;
	}
	public int getQna_rno() {
		return qna_rno;
	}
	public void setQna_rno(int qna_rno) {
		this.qna_rno = qna_rno;
	}
	public String getQna_reply_content() {
		return qna_reply_content;
	}
	public void setQna_reply_content(String qna_reply_content) {
		this.qna_reply_content = qna_reply_content;
	}
	public String getSitter_image() {
		return sitter_image;
	}
	public void setSitter_image(String sitter_image) {
		this.sitter_image = sitter_image;
	}
	public String getSitter_email() {
		return sitter_email;
	}
	public void setSitter_email(String sitter_email) {
		this.sitter_email = sitter_email;
	}
	public Date getQna_reply_date() {
		return qna_reply_date;
	}
	public void setQna_reply_date(Date qna_reply_date) {
		this.qna_reply_date = qna_reply_date;
	}
	@Override
	public String toString() {
		return "QnaReplyVO [qno=" + qno + ", qna_rno=" + qna_rno + ", qna_reply_content=" + qna_reply_content
				+ ", sitter_image=" + sitter_image + ", sitter_email=" + sitter_email + ", qna_reply_date="
				+ qna_reply_date + "]";
	}
}
