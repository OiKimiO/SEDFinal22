package com.pkfinal.mng.vo;

public class MNGVo {
	private String  r_result;
	private String  r_date;
	private String  f_date;
	private String  fin_date;
	private String  m_name;
    private String  m_uid;
    private String  p_name;
    private String  s_num;
    private String  pr_date;
    private String  f_id;
    private String  e_id;
    private String  c_id;
    private String  fin_gbn;
    private String  fin_msg;
    private String  fin_pri;
    private String  fin_grade;
    private String  pa_txt ;
    private String  rs_id;
    private String  r_id;
    private String  p_id;
    private String  f_sname;
    private String  e_name;
    private String  c_name;
    private String  rp_id;
    private String  prev_rs_id;
    private String  next_rs_id;
    private String  cc_reason;
    private String  cc_date;
    private String  rs_note;
    private String  max_r_id;
    private String  r_msg;
    private String  c_msg;
    private int  r_id_count;
    private int  m_count;
    private int  e_count;
    
  //페이징 관련 정보
  		private int nowpage;			// 현재 페이지 정보
  		private int prevnowpage;		// 이전 10개 클릭 시 적용되는 nowpage
  		private int nextnowpage;		// 다음 10개 클릭 시 적용되는 nowpage
  		
  		private int totalcount;			// 전체 Row 수
  		private int totalpagecount;		// 화면에 보여줄 페이지 수
  		
  		private int pagestartnum;		// 페이지 시작 번호
  		private int pageendnum;			// 페이지 끝 번호
  		private int pagegrpnum;			// 페이지 그룹 숫자
  		
  		private int pagecount;			// 한 페이지에 보여줄 자료라인 수
  		
  		private boolean isshowpageprev;	
  		private boolean isshowpagenext;
		
		@Override
		public String toString() {
			return "MNGVo [r_result=" + r_result + ", r_date=" + r_date + ", f_date=" + f_date + ", fin_date="
					+ fin_date + ", m_name=" + m_name + ", m_uid=" + m_uid + ", p_name=" + p_name + ", s_num=" + s_num
					+ ", pr_date=" + pr_date + ", f_id=" + f_id + ", e_id=" + e_id + ", c_id=" + c_id + ", fin_gbn="
					+ fin_gbn + ", fin_msg=" + fin_msg + ", fin_pri=" + fin_pri + ", fin_grade=" + fin_grade
					+ ", pa_txt=" + pa_txt + ", rs_id=" + rs_id + ", r_id=" + r_id + ", p_id=" + p_id + ", f_sname="
					+ f_sname + ", e_name=" + e_name + ", c_name=" + c_name + ", rp_id=" + rp_id + ", prev_rs_id="
					+ prev_rs_id + ", next_rs_id=" + next_rs_id + ", cc_reason=" + cc_reason + ", cc_date=" + cc_date
					+ ", rs_note=" + rs_note + ", max_r_id=" + max_r_id + ", r_msg=" + r_msg + ", c_msg=" + c_msg
					+ ", r_id_count=" + r_id_count + ", m_count=" + m_count + ", e_count=" + e_count + ", nowpage="
					+ nowpage + ", prevnowpage=" + prevnowpage + ", nextnowpage=" + nextnowpage + ", totalcount="
					+ totalcount + ", totalpagecount=" + totalpagecount + ", pagestartnum=" + pagestartnum
					+ ", pageendnum=" + pageendnum + ", pagegrpnum=" + pagegrpnum + ", pagecount=" + pagecount
					+ ", isshowpageprev=" + isshowpageprev + ", isshowpagenext=" + isshowpagenext + "]";
		}
		public MNGVo(String r_result, String r_date, String f_date, String fin_date, String m_name, String m_uid,
				String p_name, String s_num, String pr_date, String f_id, String e_id, String c_id, String fin_gbn,
				String fin_msg, String fin_pri, String fin_grade, String pa_txt, String rs_id, String r_id, String p_id,
				String f_sname, String e_name, String c_name, String rp_id, String prev_rs_id, String next_rs_id,
				String cc_reason, String cc_date, String rs_note, String max_r_id, String r_msg, String c_msg,
				int r_id_count, int m_count, int e_count, int nowpage, int prevnowpage, int nextnowpage, int totalcount,
				int totalpagecount, int pagestartnum, int pageendnum, int pagegrpnum, int pagecount,
				boolean isshowpageprev, boolean isshowpagenext) {

			this.r_result = r_result;
			this.r_date = r_date;
			this.f_date = f_date;
			this.fin_date = fin_date;
			this.m_name = m_name;
			this.m_uid = m_uid;
			this.p_name = p_name;
			this.s_num = s_num;
			this.pr_date = pr_date;
			this.f_id = f_id;
			this.e_id = e_id;
			this.c_id = c_id;
			this.fin_gbn = fin_gbn;
			this.fin_msg = fin_msg;
			this.fin_pri = fin_pri;
			this.fin_grade = fin_grade;
			this.pa_txt = pa_txt;
			this.rs_id = rs_id;
			this.r_id = r_id;
			this.p_id = p_id;
			this.f_sname = f_sname;
			this.e_name = e_name;
			this.c_name = c_name;
			this.rp_id = rp_id;
			this.prev_rs_id = prev_rs_id;
			this.next_rs_id = next_rs_id;
			this.cc_reason = cc_reason;
			this.cc_date = cc_date;
			this.rs_note = rs_note;
			this.max_r_id = max_r_id;
			this.r_msg = r_msg;
			this.c_msg = c_msg;
			this.r_id_count = r_id_count;
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
		public String getC_msg() {
			return c_msg;
		}
		public void setC_msg(String c_msg) {
			this.c_msg = c_msg;
		}
		public String getMax_r_id() {
			return max_r_id;
		}
		public void setMax_r_id(String max_r_id) {
			this.max_r_id = max_r_id;
		}
		public String getR_result() {
			return r_result;
		}
		public void setR_result(String r_result) {
			this.r_result = r_result;
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
		public String getFin_date() {
			return fin_date;
		}
		public void setFin_date(String fin_date) {
			this.fin_date = fin_date;
		}
		public String getM_name() {
			return m_name;
		}
		public void setM_name(String m_name) {
			this.m_name = m_name;
		}
		public String getM_uid() {
			return m_uid;
		}
		public void setM_uid(String m_uid) {
			this.m_uid = m_uid;
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
		public String getPr_date() {
			return pr_date;
		}
		public void setPr_date(String pr_date) {
			this.pr_date = pr_date;
		}
		public String getF_id() {
			return f_id;
		}
		public void setF_id(String f_id) {
			this.f_id = f_id;
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
		public String getFin_gbn() {
			return fin_gbn;
		}
		public void setFin_gbn(String fin_gbn) {
			this.fin_gbn = fin_gbn;
		}
		public String getFin_msg() {
			return fin_msg;
		}
		public void setFin_msg(String fin_msg) {
			this.fin_msg = fin_msg;
		}
		public String getFin_pri() {
			return fin_pri;
		}
		public void setFin_pri(String fin_pri) {
			this.fin_pri = fin_pri;
		}
		public String getFin_grade() {
			return fin_grade;
		}
		public void setFin_grade(String fin_grade) {
			this.fin_grade = fin_grade;
		}
		public String getPa_txt() {
			return pa_txt;
		}
		public void setPa_txt(String pa_txt) {
			this.pa_txt = pa_txt;
		}
		public String getRs_id() {
			return rs_id;
		}
		public void setRs_id(String rs_id) {
			this.rs_id = rs_id;
		}
		public String getR_id() {
			return r_id;
		}
		public void setR_id(String r_id) {
			this.r_id = r_id;
		}
		public String getP_id() {
			return p_id;
		}
		public void setP_id(String p_id) {
			this.p_id = p_id;
		}
		public String getF_sname() {
			return f_sname;
		}
		public void setF_sname(String f_sname) {
			this.f_sname = f_sname;
		}
		public String getE_name() {
			return e_name;
		}
		public void setE_name(String e_name) {
			this.e_name = e_name;
		}
		public String getC_name() {
			return c_name;
		}
		public void setC_name(String c_name) {
			this.c_name = c_name;
		}
		public String getRp_id() {
			return rp_id;
		}
		public void setRp_id(String rp_id) {
			this.rp_id = rp_id;
		}
		public String getPrev_rs_id() {
			return prev_rs_id;
		}
		public void setPrev_rs_id(String prev_rs_id) {
			this.prev_rs_id = prev_rs_id;
		}
		public String getNext_rs_id() {
			return next_rs_id;
		}
		public void setNext_rs_id(String next_rs_id) {
			this.next_rs_id = next_rs_id;
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
		public int getR_id_count() {
			return r_id_count;
		}
		public void setR_id_count(int r_id_count) {
			this.r_id_count = r_id_count;
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
		public String getR_msg() {
			return r_msg;
		}
		public void setR_msg(String r_msg) {
			this.r_msg = r_msg;
		}
		public MNGVo() {
	
		}
			
}
