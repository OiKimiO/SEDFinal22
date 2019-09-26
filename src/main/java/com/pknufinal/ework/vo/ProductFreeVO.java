package com.pknufinal.ework.vo;

public class ProductFreeVO {
	private String p_id;
	private String p_name;
	private String s_num;
	private String freeornot;
	private String pa_name;
	
	
	public ProductFreeVO() {
		
	}
	public ProductFreeVO(String p_id, String p_name, String s_num, String freeornot, String pa_name) {
		super();
		this.p_id = p_id;
		this.p_name = p_name;
		this.s_num = s_num;
		this.freeornot = freeornot;
		this.pa_name = pa_name;
	}
	
	
	public String getP_id() {
		return p_id;
	}
	public void setP_id(String p_id) {
		this.p_id = p_id;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getS_num() {
		return s_num;
	}
	public void setS_num(String s_num) {
		this.s_num = s_num;
	}
	public String getFreeornot() {
		return freeornot;
	}
	public void setFreeornot(String freeornot) {
		this.freeornot = freeornot;
	}
	public String getPa_name() {
		return pa_name;
	}
	public void setPa_name(String pa_name) {
		this.pa_name = pa_name;
	}
	
	
	@Override
	public String toString() {
		return "ProductFreeVO [p_id=" + p_id + ", p_name=" + p_name + ", s_num=" + s_num + ", freeornot=" + freeornot
				+ ", pa_name=" + pa_name + "]";
	}
}
