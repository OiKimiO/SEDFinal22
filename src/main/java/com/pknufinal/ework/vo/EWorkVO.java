package com.pknufinal.ework.vo;

public class EWorkVO {
	private String r_id;
	private String m_id;
	private String cate_id;
	private String e_id;
	private String c_id;
	private String r_msg;
	private String r_date;
	private String f_date;
	private String f_time;
	private String f_id;
	private String rs_id;
	private String s_num;
	private String p_id;
	private String r_result;
	private String fin_date;
	private String fin_time;
	private String fin_gbn;
	private String pa_txt;
	private String fin_pri;
	private String fin_msg;
	private String cc_reason;
	private String cc_date;
	private String rs_note;
	
	
	public EWorkVO() {
		
	}
	public EWorkVO(String r_id, String m_id, String cate_id, String e_id, String c_id, String r_msg, String r_date,
			String f_date, String f_time, String f_id, String rs_id, String s_num, String p_id, String r_result,
			String fin_date, String fin_time, String fin_gbn, String pa_txt, String fin_pri, String fin_msg,
			String cc_reason, String cc_date, String rs_note) {
		this.r_id = r_id;
		this.m_id = m_id;
		this.cate_id = cate_id;
		this.e_id = e_id;
		this.c_id = c_id;
		this.r_msg = r_msg;
		this.r_date = r_date;
		this.f_date = f_date;
		this.f_time = f_time;
		this.f_id = f_id;
		this.rs_id = rs_id;
		this.s_num = s_num;
		this.p_id = p_id;
		this.r_result = r_result;
		this.fin_date = fin_date;
		this.fin_time = fin_time;
		this.fin_gbn = fin_gbn;
		this.pa_txt = pa_txt;
		this.fin_pri = fin_pri;
		this.fin_msg = fin_msg;
		this.cc_reason = cc_reason;
		this.cc_date = cc_date;
		this.rs_note = rs_note;
	}
	
	
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
	public String getR_msg() {
		return r_msg;
	}
	public void setR_msg(String r_msg) {
		this.r_msg = r_msg;
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
	public String getF_id() {
		return f_id;
	}
	public void setF_id(String f_id) {
		this.f_id = f_id;
	}
	public String getRs_id() {
		return rs_id;
	}
	public void setRs_id(String rs_id) {
		this.rs_id = rs_id;
	}
	public String getS_num() {
		return s_num;
	}
	public void setS_num(String s_num) {
		this.s_num = s_num;
	}
	public String getP_id() {
		return p_id;
	}
	public void setP_id(String p_id) {
		this.p_id = p_id;
	}
	public String getR_result() {
		return r_result;
	}
	public void setR_result(String r_result) {
		this.r_result = r_result;
	}
	public String getFin_date() {
		return fin_date;
	}
	public void setFin_date(String fin_date) {
		this.fin_date = fin_date;
	}
	public String getFin_time() {
		return fin_time;
	}
	public void setFin_time(String fin_time) {
		this.fin_time = fin_time;
	}
	public String getFin_gbn() {
		return fin_gbn;
	}
	public void setFin_gbn(String fin_gbn) {
		this.fin_gbn = fin_gbn;
	}
	public String getPa_txt() {
		return pa_txt;
	}
	public void setPa_txt(String pa_txt) {
		this.pa_txt = pa_txt;
	}
	public String getFin_pri() {
		return fin_pri;
	}
	public void setFin_pri(String fin_pri) {
		this.fin_pri = fin_pri;
	}
	public String getFin_msg() {
		return fin_msg;
	}
	public void setFin_msg(String fin_msg) {
		this.fin_msg = fin_msg;
	}
	public String getCc_reason() {
		return cc_reason;
	}
	public void setCc_reason(String cc_reason) {
		this.cc_reason = cc_reason;
	}
	public String getCc_date() {
		return cc_date;
	}
	public void setCc_date(String cc_date) {
		this.cc_date = cc_date;
	}
	public String getRs_note() {
		return rs_note;
	}
	public void setRs_note(String rs_note) {
		this.rs_note = rs_note;
	}
	
	
	@Override
	public String toString() {
		return "EWorkVO [r_id=" + r_id + ", m_id=" + m_id + ", cate_id=" + cate_id + ", e_id=" + e_id + ", c_id=" + c_id
				+ ", r_msg=" + r_msg + ", r_date=" + r_date + ", f_date=" + f_date + ", f_time=" + f_time + ", f_id="
				+ f_id + ", rs_id=" + rs_id + ", s_num=" + s_num + ", p_id=" + p_id + ", r_result=" + r_result
				+ ", fin_date=" + fin_date + ", fin_time=" + fin_time + ", fin_gbn=" + fin_gbn + ", pa_txt=" + pa_txt
				+ ", fin_pri=" + fin_pri + ", fin_msg=" + fin_msg + ", cc_reason=" + cc_reason + ", cc_date=" + cc_date
				+ ", rs_note=" + rs_note + "]";
	}
}
