package com.pknufinal.euser.vo;

public class EUserVO {
	
	private String e_id;
	private String e_pwd;
	private String e_name;
	private String cate_id;
	private String cate_name;
	private String e_tel;
	private String c_id;
	private String e_img;
	private String c_name;
	
	public EUserVO() {
		
	}
	public EUserVO(String e_id, String e_pwd, String e_name, String cate_id, String cate_name, String e_tel,
			String c_id, String e_img, String c_name) {
		super();
		this.e_id = e_id;
		this.e_pwd = e_pwd;
		this.e_name = e_name;
		this.cate_id = cate_id;
		this.cate_name = cate_name;
		this.e_tel = e_tel;
		this.c_id = c_id;
		this.e_img = e_img;
		this.c_name = c_name;
	}
	
	public String getE_id() {
		return e_id;
	}
	public void setE_id(String e_id) {
		this.e_id = e_id;
	}
	public String getE_pwd() {
		return e_pwd;
	}
	public void setE_pwd(String e_pwd) {
		this.e_pwd = e_pwd;
	}
	public String getE_name() {
		return e_name;
	}
	public void setE_name(String e_name) {
		this.e_name = e_name;
	}
	public String getCate_id() {
		return cate_id;
	}
	public void setCate_id(String cate_id) {
		this.cate_id = cate_id;
	}
	public String getCate_name() {
		return cate_name;
	}
	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}
	public String getE_tel() {
		return e_tel;
	}
	public void setE_tel(String e_tel) {
		this.e_tel = e_tel;
	}
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
	public String getE_img() {
		return e_img;
	}
	public void setE_img(String e_img) {
		this.e_img = e_img;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	
	@Override
	public String toString() {
		return "EUserVO [e_id=" + e_id + ", e_pwd=" + e_pwd + ", e_name=" + e_name + ", cate_id=" + cate_id
				+ ", cate_name=" + cate_name + ", e_tel=" + e_tel + ", c_id=" + c_id + ", e_img=" + e_img + ", c_name="
				+ c_name + "]";
	}
	
	
}
