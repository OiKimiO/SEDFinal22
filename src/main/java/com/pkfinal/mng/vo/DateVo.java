package com.pkfinal.mng.vo;

public class DateVo {
	private String this_month;
	private String next_month;
	private String current_date;
	private String next_month_day;
	private String day;
	private String ename;
	private String chk_date;
	private String r_id;
	private String com_id;
	private String e_name;
	private String max_r_id;
	private String e_id;
	public String getThis_month() {
		return this_month;
	}
	public void setThis_month(String this_month) {
		this.this_month = this_month;
	}
	public String getNext_month() {
		return next_month;
	}
	public void setNext_month(String next_month) {
		this.next_month = next_month;
	}
	public String getCurrent_date() {
		return current_date;
	}
	public void setCurrent_date(String current_date) {
		this.current_date = current_date;
	}
	public String getNext_month_day() {
		return next_month_day;
	}
	public void setNext_month_day(String next_month_day) {
		this.next_month_day = next_month_day;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getChk_date() {
		return chk_date;
	}
	public void setChk_date(String chk_date) {
		this.chk_date = chk_date;
	}
	public String getR_id() {
		return r_id;
	}
	public void setR_id(String r_id) {
		this.r_id = r_id;
	}
	public String getCom_id() {
		return com_id;
	}
	public void setCom_id(String com_id) {
		this.com_id = com_id;
	}
	public String getE_name() {
		return e_name;
	}
	public void setE_name(String e_name) {
		this.e_name = e_name;
	}
	public String getMax_r_id() {
		return max_r_id;
	}
	public void setMax_r_id(String max_r_id) {
		this.max_r_id = max_r_id;
	}
	public String getE_id() {
		return e_id;
	}
	public void setE_id(String e_id) {
		this.e_id = e_id;
	}
	@Override
	public String toString() {
		return "DateVo [this_month=" + this_month + ", next_month=" + next_month + ", current_date=" + current_date
				+ ", next_month_day=" + next_month_day + ", day=" + day + ", ename=" + ename + ", chk_date=" + chk_date
				+ ", r_id=" + r_id + ", com_id=" + com_id + ", e_name=" + e_name + ", max_r_id=" + max_r_id + ", e_id="
				+ e_id + "]";
	}
	public DateVo(String this_month, String next_month, String current_date, String next_month_day, String day,
			String ename, String chk_date, String r_id, String com_id, String e_name, String max_r_id, String e_id) {
		this.this_month = this_month;
		this.next_month = next_month;
		this.current_date = current_date;
		this.next_month_day = next_month_day;
		this.day = day;
		this.ename = ename;
		this.chk_date = chk_date;
		this.r_id = r_id;
		this.com_id = com_id;
		this.e_name = e_name;
		this.max_r_id = max_r_id;
		this.e_id = e_id;
	}
	public DateVo() {
	}		
}
