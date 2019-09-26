package com.pkfinal.eng.vo;

public class EngVo {
	private String e_id;
	private String e_pwd;
	private String e_name;
	private String cate_id;
	private String cate_name;
	private String e_tel;
	private String c_id;
	private String e_img;
	private String c_name;
	private String gubun;
	
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
	
	
	public String getCate_name() {
		return cate_name;
	}

	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}

	public String getE_id() {
		return e_id;
	}

	public void setE_id(String e_id) {
		this.e_id = e_id;
	}

	public String getE_pwd() {
		return e_pwd;
	}

	public void setE_pwd(String e_pwd) {
		this.e_pwd = e_pwd;
	}

	public String getE_name() {
		return e_name;
	}

	public void setE_name(String e_name) {
		this.e_name = e_name;
	}

	
	public String getCate_id() {
		return cate_id;
	}

	public void setCate_id(String cate_id) {
		this.cate_id = cate_id;
	}

	public String getE_tel() {
		return e_tel;
	}

	public void setE_tel(String e_tel) {
		this.e_tel = e_tel;
	}

	public String getC_id() {
		return c_id;
	}

	public void setC_id(String c_id) {
		this.c_id = c_id;
	}

	public String getE_img() {
		return e_img;
	}

	public void setE_img(String e_img) {
		this.e_img = e_img;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
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

	public String getGubun() {
		return gubun;
	}

	public void setGubun(String gubun) {
		this.gubun = gubun;
	}



	public EngVo(String e_id, String e_pwd, String e_name, String cate_id, String cate_name, String e_tel, String c_id,
			String e_img, String c_name, String gubun, int nowpage, int prevnowpage, int nextnowpage, int totalcount,
			int totalpagecount, int pagestartnum, int pageendnum, int pagegrpnum, int pagecount, boolean isshowpageprev,
			boolean isshowpagenext) {
		this.e_id = e_id;
		this.e_pwd = e_pwd;
		this.e_name = e_name;
		this.cate_id = cate_id;
		this.cate_name = cate_name;
		this.e_tel = e_tel;
		this.c_id = c_id;
		this.e_img = e_img;
		this.c_name = c_name;
		this.gubun = gubun;
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

	public EngVo() {

	}

	@Override
	public String toString() {
		return "EngVo [e_id=" + e_id + ", e_pwd=" + e_pwd + ", e_name=" + e_name + ", cate_id=" + cate_id
				+ ", cate_name=" + cate_name + ", e_tel=" + e_tel + ", c_id=" + c_id + ", e_img=" + e_img + ", c_name="
				+ c_name + ", gubun=" + gubun + ", nowpage=" + nowpage + ", prevnowpage=" + prevnowpage
				+ ", nextnowpage=" + nextnowpage + ", totalcount=" + totalcount + ", totalpagecount=" + totalpagecount
				+ ", pagestartnum=" + pagestartnum + ", pageendnum=" + pageendnum + ", pagegrpnum=" + pagegrpnum
				+ ", pagecount=" + pagecount + ", isshowpageprev=" + isshowpageprev + ", isshowpagenext="
				+ isshowpagenext + "]";
	}
	
	
	
	
	
	
	
}
