package com.pet.sitter.vo;

import java.util.Date;

public class ReviewVO {

 private int r_rate;
 private String r_title;
 private Date rwrite_date;
 private String ruse_date;
 private int rno;
 private int reno;
 private String r_content;
 private String r_image;
private String sitter_image;
 private String user_email;
 private String sitter_email;
 
 
public int getR_rate() {
	return r_rate;
}
public void setR_rate(int r_rate) {
	this.r_rate = r_rate;
}
public String getR_title() {
	return r_title;
}
public void setR_title(String r_title) {
	this.r_title = r_title;
}
public Date getRwrite_date() {
	return rwrite_date;
}
public void setRwrite_date(Date rwrite_date) {
	this.rwrite_date = rwrite_date;
}
public String getRuse_date() {
	return ruse_date;
}
public void setRuse_date(String ruse_date) {
	this.ruse_date = ruse_date;
}
public int getRno() {
	return rno;
}
public void setRno(int rno) {
	this.rno = rno;
}
public String getR_content() {
	return r_content;
}
public void setR_content(String r_content) {
	this.r_content = r_content;
}
public String getR_image() {
	return r_image;
}
public void setR_image(String r_image) {
	this.r_image = r_image;
}
public String getUser_email() {
	return user_email;
}
public void setUser_email(String user_email) {
	this.user_email = user_email;
}
public String getSitter_email() {
	return sitter_email;
}
public void setSitter_email(String sitter_email) {
	this.sitter_email = sitter_email;
}
public String getSitter_image() {
	return sitter_image;
}
public void setSitter_image(String sitter_image) {
	this.sitter_image = sitter_image;
}
public int getReno() {
	return reno;
}
public void setReno(int reno) {
	this.reno = reno;
}
 
 
}
