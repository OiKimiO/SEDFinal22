package com.pkfinal.commoncode.vo;

public class CommoncodeVo {
	// Fields
	private String com_id;
	private String com_val;
	private int com_seq;
	
	// Getter/Setter
	public String getCom_id() {
		return com_id;
	}
	public void setCom_id(String com_id) {
		this.com_id = com_id;
	}
	public String getCom_val() {
		return com_val;
	}
	public void setCom_val(String com_val) {
		this.com_val = com_val;
	}
	public int getCom_seq() {
		return com_seq;
	}
	public void setCom_seq(int com_seq) {
		this.com_seq = com_seq;
	}
	
	// Constructors
	public CommoncodeVo() {}
	public CommoncodeVo(String com_id, String com_val, int com_seq) {
		super();
		this.com_id = com_id;
		this.com_val = com_val;
		this.com_seq = com_seq;
	}
	
	// toString
	@Override
	public String toString() {
		return "CommoncodeVo [com_id=" + com_id + ", com_val=" + com_val + ", com_seq=" + com_seq + "]";
	}
	
	
	
	
	
}
