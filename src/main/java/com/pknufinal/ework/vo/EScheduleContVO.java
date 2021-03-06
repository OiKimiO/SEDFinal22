package com.pknufinal.ework.vo;

public class EScheduleContVO {
	
	private String r_id; 
	private String r_date;
	private String f_date; 
	private String f_time;
	private String p_name;
	private String f_lname; 
	private String f_sname;
	private String r_msg;
	private String m_name; 
	private String m_tel;
	private String m_city;
	private String m_gugun; 
	private String m_addr;
	
	
	public EScheduleContVO() {
		
	}
	public EScheduleContVO(String r_id, String r_date, String f_date, String f_time, String p_name, String f_lname,
			String f_sname, String r_msg, String m_name, String m_tel, String m_city, String m_gugun, String m_addr) {
		this.r_id = r_id;
		this.r_date = r_date;
		this.f_date = f_date;
		this.f_time = f_time;
		this.p_name = p_name;
		this.f_lname = f_lname;
		this.f_sname = f_sname;
		this.r_msg = r_msg;
		this.m_name = m_name;
		this.m_tel = m_tel;
		this.m_city = m_city;
		this.m_gugun = m_gugun;
		this.m_addr = m_addr;
	}
	
	
	public String getR_id() {
		return r_id;
	}
	public void setR_id(String r_id) {
		this.r_id = r_id;
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
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
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
	public String getR_msg() {
		return r_msg;
	}
	public void setR_msg(String r_msg) {
		this.r_msg = r_msg;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_tel() {
		return m_tel;
	}
	public void setM_tel(String m_tel) {
		this.m_tel = m_tel;
	}
	public String getM_city() {
		return m_city;
	}
	public void setM_city(String m_city) {
		this.m_city = m_city;
	}
	public String getM_gugun() {
		return m_gugun;
	}
	public void setM_gugun(String m_gugun) {
		this.m_gugun = m_gugun;
	}
	public String getM_addr() {
		return m_addr;
	}
	public void setM_addr(String m_addr) {
		this.m_addr = m_addr;
	}
	
	
	@Override
	public String toString() {
		return "EScheduleContVO [r_id=" + r_id + ", r_date=" + r_date + ", f_date=" + f_date + ", f_time=" + f_time
				+ ", p_name=" + p_name + ", f_lname=" + f_lname + ", f_sname=" + f_sname + ", r_msg=" + r_msg
				+ ", m_name=" + m_name + ", m_tel=" + m_tel + ", m_city=" + m_city + ", m_gugun=" + m_gugun
				+ ", m_addr=" + m_addr + "]";
	} 
	
}
