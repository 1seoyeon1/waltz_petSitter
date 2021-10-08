package com.pet.sitter.vo;

public class SitterVO {
	
	private String sitter_email;
	
	private String sitter_name;
	
	private String sitter_password;
	
	private String sitter_phone;
	
	private String sitter_gender;
	
	

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

	@Override
	public String toString() {
		return "SitterVO [sitter_email=" + sitter_email + ", sitter_name=" + sitter_name + ", sitter_password="
				+ sitter_password + ", sitter_phone=" + sitter_phone + ", sitter_gender=" + sitter_gender + "]";
	}
	
	
	
	
	
	

}
