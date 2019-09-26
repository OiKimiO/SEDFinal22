package com.pknufinal.ework.vo;

public class EScheduleVO {
	
	private String e_id;
	private String r_id;
	private String f_date;
	private String f_time;
	private String com_val;
	private String m_name;
	private String m_tel;
	private String m_city;
	private String m_gugun;
	private String p_name;
	
	public EScheduleVO() {
		
	}
	public EScheduleVO(String e_id, String r_id, String f_date, String f_time, String com_val, String m_name,
			String m_tel, String m_city, String m_gugun, String p_name) {
		super();
		this.e_id = e_id;
		this.r_id = r_id;
		this.f_date = f_date;
		this.f_time = f_time;
		this.com_val = com_val;
		this.m_name = m_name;
		this.m_tel = m_tel;
		this.m_city = m_city;
		this.m_gugun = m_gugun;
		this.p_name = p_name;
	}
	
	
	public String getE_id() {
		return e_id;
	}
	public void setE_id(String e_id) {
		this.e_id = e_id;
	}
	public String getR_id() {
		return r_id;
	}
	public void setR_id(String r_id) {
		this.r_id = r_id;
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
	public String getCom_val() {
		return com_val;
	}
	public void setCom_val(String com_val) {
		this.com_val = com_val;
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
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	
	
	@Override
	public String toString() {
		return "EScheduleVO [e_id=" + e_id + ", r_id=" + r_id + ", f_date=" + f_date + ", f_time=" + f_time
				+ ", com_val=" + com_val + ", m_name=" + m_name + ", m_tel=" + m_tel + ", m_city=" + m_city
				+ ", m_gugun=" + m_gugun + ", p_name=" + p_name + "]";
	}
	
	
}
