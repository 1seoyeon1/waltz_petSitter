package com.pet.sitter.vo;

import java.sql.Date;

public class SitterBoardVO {
	private String sitter_exp;
	private String sitter_intro;
	private String sitter_addr;
	private int sitter_price;
	private String sitter_image;
	private String sitter_email;
	private double rate;
	private String sitter_name;
	private String mksitter_name;
	private String sitter_password;
	private String sitter_phone;
	private String mksitter_phone;
	private String sitter_gender;
	private int count;
	
	
	public int getCount() {
		return count;
	}
	public String getMksitter_name() {
		return mksitter_name;
	}
	public void setMksitter_name(String mksitter_name) {
		this.mksitter_name = mksitter_name;
	}
	public String getMksitter_phone() {
		return mksitter_phone;
	}
	public void setMksitter_phone(String mksitter_phone) {
		this.mksitter_phone = mksitter_phone;
	}
	public String getSitter_email() {
		return sitter_email;
	}
	public void setSitter_email(String sitter_email) {
		this.sitter_email = sitter_email;
	}
	public String getSitter_name() {
		return sitter_name;
	}
	public void setSitter_name(String sitter_name) {
		this.sitter_name = sitter_name;
	}
	public String getSitter_password() {
		return sitter_password;
	}
	public void setSitter_password(String sitter_password) {
		this.sitter_password = sitter_password;
	}
	public String getSitter_phone() {
		return sitter_phone;
	}
	public void setSitter_phone(String sitter_phone) {
		this.sitter_phone = sitter_phone;
	}
	public String getSitter_gender() {
		return sitter_gender;
	}
	public void setSitter_gender(String sitter_gender) {
		this.sitter_gender = sitter_gender;
	}
	
	public double getRate() {
		return rate;
	}
	public String getSitter_exp() {
		return sitter_exp;
	}
	public void setSitter_exp(String sitter_exp) {
		this.sitter_exp = sitter_exp;
	}
	public String getSitter_intro() {
		return sitter_intro;
	}
	public void setSitter_intro(String sitter_intro) {
		this.sitter_intro = sitter_intro;
	}
	public String getSitter_addr() {
		return sitter_addr;
	}
	public void setSitter_addr(String sitter_addr) {
		this.sitter_addr = sitter_addr;
	}
	public int getSitter_price() {
		return sitter_price;
	}
	public void setSitter_price(int sitter_price) {
		this.sitter_price = sitter_price;
	}
	public String getSitter_image() {
		return sitter_image;
	}
	public void setSitter_image(String sitter_image) {
		this.sitter_image = sitter_image;
	}
	@Override
	public String toString() {
		return "SitterBoardVO [sitter_exp=" + sitter_exp + ", sitter_intro=" + sitter_intro + ", sitter_addr="
				+ sitter_addr + ", sitter_avail=" + ", sitter_price=" + sitter_price + ", sitter_image="
				+ sitter_image + ", sitter_email=" + sitter_email + ", rate=" + rate + ", sitter_name=" + sitter_name
				+ ", sitter_password=" + sitter_password + ", sitter_phone=" + sitter_phone + ", sitter_gender="
				+ sitter_gender + "]";
	}
}
