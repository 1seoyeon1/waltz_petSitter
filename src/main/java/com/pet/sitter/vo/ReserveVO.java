package com.pet.sitter.vo;

import java.sql.Date;
import java.text.SimpleDateFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ReserveVO {
	private int reno;
	private String sitter_email;
	private String user_email;
	private String user_phone;
	private String memo;
	private int chk;
	private int rd;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date start_date;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date end_date;
	private Date rq_date;
	private Date last_date;
	private String st_time;
	private String ed_time;
	private int all_day;
	private int rv;
	
	
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public Date getLast_date() {
		return last_date;
	}
	public void setLast_date(Date last_date) {
		this.last_date = last_date;
	}
	public int getRv() {
		return rv;
	}
	public void setRv(int rv) {
		this.rv = rv;
	}
	public int getAll_day() {
		return all_day;
	}
	public void setAll_day(int all_day) {
		this.all_day = all_day;
	}
	public String getSt_time() {
		return st_time;
	}
	public void setSt_time(String st_time) {
		this.st_time = st_time;
	}
	public String getEd_time() {
		return ed_time;
	}
	public void setEd_time(String ed_time) {
		this.ed_time = ed_time;
	}
	public int getReno() {
		return reno;
	}
	
	public void setReno(int reno) {
		this.reno = reno;
	}
	// 0이면 초기값
	public int getChk() {
		return chk;
	}
	public void setChk(int chk) {
		this.chk = chk;
	}
	
	// 0이면 초기값
	public int getRd() {
		return rd;
	}
	public void setRd(int rd) {
		this.rd = rd;
	}
	
	public Date getRq_date() {
		return rq_date;
	}
	public void setRq_date(Date rq_date) {
		this.rq_date = rq_date;
	}
	public void setSitter_email(String sitter_email) {
		this.sitter_email = sitter_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		System.out.println("vo 지나갈때??"+start_date);
		this.start_date = start_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getSitter_email() {
		return sitter_email;
	}
	public String getUser_email() {
		return user_email;
	}
	
	
}
