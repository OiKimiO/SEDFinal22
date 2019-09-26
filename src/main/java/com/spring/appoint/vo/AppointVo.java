package com.spring.appoint.vo;

public class AppointVo {
	private String r_id;
	private String cate_name;
	private String p_name;
	private String f_date;
	private String f_time;
	private String r_result;
	private String m_id;
	private String rs_id;
	private String com_val;
	
	private int    nowpage;			
	private int    prevnowpage;		 
	private int    nextnowpage;      
	
	private int    totalcount;		 
	private int    totalpagecount;	
	
	private int	   pagestartnum;     
	private int	   pageendnum;     
	private int	   pagegrpnum;    
	
	private int    pagecount; 		
	
	private boolean isshowpageprev;	 
	private boolean isshowpagenext;
	public String getR_id() {
		return r_id;
	}
	public void setR_id(String r_id) {
		this.r_id = r_id;
	}
	public String getCate_name() {
		return cate_name;
	}
	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
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
	public String getR_result() {
		return r_result;
	}
	public void setR_result(String r_result) {
		this.r_result = r_result;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getRs_id() {
		return rs_id;
	}
	public void setRs_id(String rs_id) {
		this.rs_id = rs_id;
	}
	public String getCom_val() {
		return com_val;
	}
	public void setCom_val(String com_val) {
		this.com_val = com_val;
	}
	public int getNowpage() {
		return nowpage;
	}
	public void setNowpage(int nowpage) {
		this.nowpage = nowpage;
	}
	public int getPrevnowpage() {
		return prevnowpage;
	}
	public void setPrevnowpage(int prevnowpage) {
		this.prevnowpage = prevnowpage;
	}
	public int getNextnowpage() {
		return nextnowpage;
	}
	public void setNextnowpage(int nextnowpage) {
		this.nextnowpage = nextnowpage;
	}
	public int getTotalcount() {
		return totalcount;
	}
	public void setTotalcount(int totalcount) {
		this.totalcount = totalcount;
	}
	public int getTotalpagecount() {
		return totalpagecount;
	}
	public void setTotalpagecount(int totalpagecount) {
		this.totalpagecount = totalpagecount;
	}
	public int getPagestartnum() {
		return pagestartnum;
	}
	public void setPagestartnum(int pagestartnum) {
		this.pagestartnum = pagestartnum;
	}
	public int getPageendnum() {
		return pageendnum;
	}
	public void setPageendnum(int pageendnum) {
		this.pageendnum = pageendnum;
	}
	public int getPagegrpnum() {
		return pagegrpnum;
	}
	public void setPagegrpnum(int pagegrpnum) {
		this.pagegrpnum = pagegrpnum;
	}
	public int getPagecount() {
		return pagecount;
	}
	public void setPagecount(int pagecount) {
		this.pagecount = pagecount;
	}
	public boolean isIsshowpageprev() {
		return isshowpageprev;
	}
	public void setIsshowpageprev(boolean isshowpageprev) {
		this.isshowpageprev = isshowpageprev;
	}
	public boolean isIsshowpagenext() {
		return isshowpagenext;
	}
	public void setIsshowpagenext(boolean isshowpagenext) {
		this.isshowpagenext = isshowpagenext;
	}
	
	public AppointVo() {}
	public AppointVo(String r_id, String cate_name, String p_name, String f_date, String f_time, String r_result,
			String m_id, String rs_id, String com_val, int nowpage, int prevnowpage, int nextnowpage, int totalcount,
			int totalpagecount, int pagestartnum, int pageendnum, int pagegrpnum, int pagecount, boolean isshowpageprev,
			boolean isshowpagenext) {
		this.r_id = r_id;
		this.cate_name = cate_name;
		this.p_name = p_name;
		this.f_date = f_date;
		this.f_time = f_time;
		this.r_result = r_result;
		this.m_id = m_id;
		this.rs_id = rs_id;
		this.com_val = com_val;
		this.nowpage = nowpage;
		this.prevnowpage = prevnowpage;
		this.nextnowpage = nextnowpage;
		this.totalcount = totalcount;
		this.totalpagecount = totalpagecount;
		this.pagestartnum = pagestartnum;
		this.pageendnum = pageendnum;
		this.pagegrpnum = pagegrpnum;
		this.pagecount = pagecount;
		this.isshowpageprev = isshowpageprev;
		this.isshowpagenext = isshowpagenext;
	}
	@Override
	public String toString() {
		return "AppointVo [r_id=" + r_id + ", cate_name=" + cate_name + ", p_name=" + p_name + ", f_date=" + f_date
				+ ", f_time=" + f_time + ", r_result=" + r_result + ", m_id=" + m_id + ", rs_id=" + rs_id + ", com_val="
				+ com_val + ", nowpage=" + nowpage + ", prevnowpage=" + prevnowpage + ", nextnowpage=" + nextnowpage
				+ ", totalcount=" + totalcount + ", totalpagecount=" + totalpagecount + ", pagestartnum=" + pagestartnum
				+ ", pageendnum=" + pageendnum + ", pagegrpnum=" + pagegrpnum + ", pagecount=" + pagecount
				+ ", isshowpageprev=" + isshowpageprev + ", isshowpagenext=" + isshowpagenext + "]";
	}
	
}
