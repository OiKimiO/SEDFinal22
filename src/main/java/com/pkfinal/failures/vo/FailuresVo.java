package com.pkfinal.failures.vo;

public class FailuresVo {
	// Fields
	private String f_id;
	private String cate_id;
	private String f_lname;
	private String f_sname;
	
	private String cate_name;
	
	// Getter
	public String getF_id() {
		return f_id;
	}
	public void setF_id(String f_id) {
		this.f_id = f_id;
	}
	public String getCate_id() {
		return cate_id;
	}
	public void setCate_id(String cate_id) {
		this.cate_id = cate_id;
	}
	public String getF_lname() {
		return f_lname;
	}
	public void setF_lname(String f_lname) {
		this.f_lname = f_lname;
	}
	public String getF_sname() {
		return f_sname;
	}
	public void setF_sname(String f_sname) {
		this.f_sname = f_sname;
	}
	
	//
	public String getCate_name() {
		return cate_name;
	}
	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}
	//
	public FailuresVo() {}
	
	
	public FailuresVo(String f_id, String cate_id, String f_lname, String f_sname, String cate_name) {
		super();
		this.f_id = f_id;
		this.cate_id = cate_id;
		this.f_lname = f_lname;
		this.f_sname = f_sname;
		this.cate_name = cate_name;
	}
	//
	@Override
	public String toString() {
		return "FailuresVo [f_id=" + f_id + ", cate_id=" + cate_id + ", f_lname=" + f_lname + ", f_sname=" + f_sname
				+ ", cate_name=" + cate_name + "]";
	}
	
	
	
	
	
}
