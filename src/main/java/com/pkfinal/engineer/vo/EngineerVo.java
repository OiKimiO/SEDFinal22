package com.pkfinal.engineer.vo;

import com.pkfinal.commoncode.vo.CommoncodeVo;

public class EngineerVo {
	// Fields
	private String e_id;
	private String e_pwd;
	private String e_name;
	private String c_id;
	private String cate_id;
	private String e_tel;
	private String e_img;
	private String e_use_del;
	private int com_seq;
	
	private CommoncodeVo commoncodeVo;
	
	// Getter/Setter
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
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
	public String getCate_id() {
		return cate_id;
	}
	public void setCate_id(String cate_id) {
		this.cate_id = cate_id;
	}
	public String getE_tel() {
		return e_tel;
	}
	public void setE_tel(String e_tel) {
		this.e_tel = e_tel;
	}
	public String getE_img() {
		return e_img;
	}
	public void setE_img(String e_img) {
		this.e_img = e_img;
	}
	public String getE_use_del() {
		return e_use_del;
	}
	public void setE_use_del(String e_use_del) {
		this.e_use_del = e_use_del;
	}
	public int getCom_seq() {
		return com_seq;
	}
	public void setCom_seq(int com_seq) {
		this.com_seq = com_seq;
	}
	public CommoncodeVo getCommoncodeVo() {
		return commoncodeVo;
	}
	public void setCommoncodeVo(CommoncodeVo commoncodeVo) {
		this.commoncodeVo = commoncodeVo;
	}
	
	// Constructors
	public EngineerVo() {}
	public EngineerVo(String e_id, String e_pwd, String e_name, String c_id, String cate_id, String e_tel, String e_img,
			String e_use_del, int com_seq, CommoncodeVo commoncodeVo) {
		super();
		this.e_id = e_id;
		this.e_pwd = e_pwd;
		this.e_name = e_name;
		this.c_id = c_id;
		this.cate_id = cate_id;
		this.e_tel = e_tel;
		this.e_img = e_img;
		this.e_use_del = e_use_del;
		this.com_seq = com_seq;
		this.commoncodeVo = commoncodeVo;
	}
	
	// toString
	@Override
	public String toString() {
		return "EnginnerVo [e_id=" + e_id + ", e_pwd=" + e_pwd + ", e_name=" + e_name + ", c_id=" + c_id + ", cate_id="
				+ cate_id + ", e_tel=" + e_tel + ", e_img=" + e_img + ", e_use_del=" + e_use_del + ", com_seq="
				+ com_seq + ", commoncodeVo=" + commoncodeVo + "]";
	}
	
	
	
	
	
}
