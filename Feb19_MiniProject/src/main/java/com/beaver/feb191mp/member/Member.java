package com.beaver.feb191mp.member;

public class Member {
	private String gs_id;
	private String gs_pw;
	private String gs_name;
	private String gs_addr;
	private String gs_photo;
	private String gs_role;
	
	public Member() {
		// TODO Auto-generated constructor stub
	}

	public Member(String gs_id, String gs_pw, String gs_name, String gs_addr, String gs_photo, String gs_role) {
		super();
		this.gs_id = gs_id;
		this.gs_pw = gs_pw;
		this.gs_name = gs_name;
		this.gs_addr = gs_addr;
		this.gs_photo = gs_photo;
		this.gs_role = gs_role;
	}

	public String getGs_id() {
		return gs_id;
	}

	public void setGs_id(String gs_id) {
		this.gs_id = gs_id;
	}

	public String getGs_pw() {
		return gs_pw;
	}

	public void setGs_pw(String gs_pw) {
		this.gs_pw = gs_pw;
	}

	public String getGs_name() {
		return gs_name;
	}

	public void setGs_name(String gs_name) {
		this.gs_name = gs_name;
	}

	public String getGs_addr() {
		return gs_addr;
	}

	public void setGs_addr(String gs_addr) {
		this.gs_addr = gs_addr;
	}

	public String getGs_photo() {
		return gs_photo;
	}

	public void setGs_photo(String gs_photo) {
		this.gs_photo = gs_photo;
	}

	public String getGs_role() {
		return gs_role;
	}

	public void setGs_role(String gs_role) {
		this.gs_role = gs_role;
	}
	
}
