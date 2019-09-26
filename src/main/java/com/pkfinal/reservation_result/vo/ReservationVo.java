package com.pkfinal.reservation_result.vo;

public class ReservationVo {
	//Fields
	private String r_id;
	private String m_id;
	private String cate_id;
	private String e_id;
	private String c_id;
	private String r_date;
	private String f_date;
	private String f_time;
	private String r_msg;
	private String f_id;
	
	
	// Getter/Setter
	public String getR_id() {
		return r_id;
	}
	public void setR_id(String r_id) {
		this.r_id = r_id;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getCate_id() {
		return cate_id;
	}
	public void setCate_id(String cate_id) {
		this.cate_id = cate_id;
	}
	public String getE_id() {
		return e_id;
	}
	public void setE_id(String e_id) {
		this.e_id = e_id;
	}
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
	public String getR_date() {
		return r_date;
	}
	public void setR_date(String r_date) {
		this.r_date = r_date;
	}
	public String getF_date() {
		return f_date;
	}
	public void setF_date(String f_date) {
		this.f_date = f_date;
	}
	public String getF_time() {
		return f_time;
	}
	public void setF_time(String f_time) {
		this.f_time = f_time;
	}
	public String getR_msg() {
		return r_msg;
	}
	public void setR_msg(String r_msg) {
		this.r_msg = r_msg;
	}
	public String getF_id() {
		return f_id;
	}
	public void setF_id(String f_id) {
		this.f_id = f_id;
	}
	
	
	//Constructors
	public ReservationVo() {}
	public ReservationVo(String r_id, String m_id, String cate_id, String e_id, String c_id, String r_date,
			String f_date, String f_time, String r_msg, String f_id) {
		super();
		this.r_id = r_id;
		this.m_id = m_id;
		this.cate_id = cate_id;
		this.e_id = e_id;
		this.c_id = c_id;
		this.r_date = r_date;
		this.f_date = f_date;
		this.f_time = f_time;
		this.r_msg = r_msg;
		this.f_id = f_id;
	}
	
	// toString
	@Override
	public String toString() {
		return "ReservationVo [r_id=" + r_id + ", m_id=" + m_id + ", cate_id=" + cate_id + ", e_id=" + e_id + ", c_id="
				+ c_id + ", r_date=" + r_date + ", f_date=" + f_date + ", f_time=" + f_time + ", r_msg=" + r_msg
				+ ", f_id=" + f_id + "]";
	}
	
	
	
}
