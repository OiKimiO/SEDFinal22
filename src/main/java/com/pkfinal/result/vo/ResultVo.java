package com.pkfinal.result.vo;

public class ResultVo {
	private String r_id;
	private String rs_id;
	private String s_num;
	private String m_id;
	private String e_id;
	private String e_name;
	private String m_name;
	private String m_uid;
	private String p_id;
	private String p_name;
	private String fin_date;
	private String fin_time;
	private String r_result;
	private String start_date;
	private String final_date;
	private int m_count;
	private int e_count;
	
	//페이징 관련 정보
		private int nowpage;
		private int prevnowpage;
		private int nextnowpage;
		
		private int totalcount;			// 조회된 전체 Data Row 수
		private int totalpagecount;		// 화면에 보여줄 페이지 수 : 전체페이지수
		
		private int pagestartnum;
		private int pageendnum;
		private int pagegrpnum;			// 페이지 그룹 숫자
		
		private int pagecount;			// 한 페이지에 보여줄 라인수
		
		private boolean isshowpageprev;
		private boolean isshowpagenext;
	
	public ResultVo() {}
	
	public String getM_uid() {
		return m_uid;
	}

	public void setM_uid(String m_uid) {
		this.m_uid = m_uid;
	}

	public String getRs_id() {
		return rs_id;
	}

	public void setRs_id(String rs_id) {
		this.rs_id = rs_id;
	}

	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getR_id() {
		return r_id;
	}

	public void setR_id(String r_id) {
		this.r_id = r_id;
	}

	public String getS_num() {
		return s_num;
	}

	public void setS_num(String s_num) {
		this.s_num = s_num;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getE_id() {
		return e_id;
	}

	public void setE_id(String e_id) {
		this.e_id = e_id;
	}

	public String getE_name() {
		return e_name;
	}

	public void setE_name(String e_name) {
		this.e_name = e_name;
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

	public String getR_result() {
		return r_result;
	}

	public void setR_result(String r_result) {
		this.r_result = r_result;
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

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getFinal_date() {
		return final_date;
	}

	public void setFinal_date(String final_date) {
		this.final_date = final_date;
	}

	public int getM_count() {
		return m_count;
	}

	public void setM_count(int m_count) {
		this.m_count = m_count;
	}

	public int getE_count() {
		return e_count;
	}

	public void setE_count(int e_count) {
		this.e_count = e_count;
	}

	public ResultVo(String r_id, String rs_id, String s_num, String m_id, String e_id, String e_name, String m_name,
			String m_uid, String p_id, String p_name, String fin_date, String fin_time, String r_result,
			String start_date, String final_date, int m_count, int e_count, int nowpage, int prevnowpage,
			int nextnowpage, int totalcount, int totalpagecount, int pagestartnum, int pageendnum, int pagegrpnum,
			int pagecount, boolean isshowpageprev, boolean isshowpagenext) {

		this.r_id = r_id;
		this.rs_id = rs_id;
		this.s_num = s_num;
		this.m_id = m_id;
		this.e_id = e_id;
		this.e_name = e_name;
		this.m_name = m_name;
		this.m_uid = m_uid;
		this.p_id = p_id;
		this.p_name = p_name;
		this.fin_date = fin_date;
		this.fin_time = fin_time;
		this.r_result = r_result;
		this.start_date = start_date;
		this.final_date = final_date;
		this.m_count = m_count;
		this.e_count = e_count;
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
		return "ResultVo [r_id=" + r_id + ", rs_id=" + rs_id + ", s_num=" + s_num + ", m_id=" + m_id + ", e_id=" + e_id
				+ ", e_name=" + e_name + ", m_name=" + m_name + ", m_uid=" + m_uid + ", p_id=" + p_id + ", p_name="
				+ p_name + ", fin_date=" + fin_date + ", fin_time=" + fin_time + ", r_result=" + r_result
				+ ", start_date=" + start_date + ", final_date=" + final_date + ", m_count=" + m_count + ", e_count="
				+ e_count + ", nowpage=" + nowpage + ", prevnowpage=" + prevnowpage + ", nextnowpage=" + nextnowpage
				+ ", totalcount=" + totalcount + ", totalpagecount=" + totalpagecount + ", pagestartnum=" + pagestartnum
				+ ", pageendnum=" + pageendnum + ", pagegrpnum=" + pagegrpnum + ", pagecount=" + pagecount
				+ ", isshowpageprev=" + isshowpageprev + ", isshowpagenext=" + isshowpagenext + "]";
	}

	
	




	
	}
