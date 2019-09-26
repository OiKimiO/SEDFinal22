package com.pkfinal.board.vo;

public class BoardVo {

	
	private int idx;
	private String  m_id;
	private	String title;
	private String cont;
	private String writer;
	private String regdate;
	private String menu_id;
	private int bnum;
	private int lvl;
	private int step;
	private int nref;
	private int delnum;
	
	
	
	
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
	
	public BoardVo() {}

	@Override
	public String toString() {
		return "BoardVo [idx=" + idx + ", m_id=" + m_id + ", title=" + title + ", cont=" + cont + ", writer=" + writer
				+ ", regdate=" + regdate + ", menu_id=" + menu_id + ", bnum=" + bnum + ", lvl=" + lvl + ", step=" + step
				+ ", nref=" + nref + ", delnum=" + delnum + ", nowpage=" + nowpage + ", prevnowpage=" + prevnowpage
				+ ", nextnowpage=" + nextnowpage + ", totalcount=" + totalcount + ", totalpagecount=" + totalpagecount
				+ ", pagestartnum=" + pagestartnum + ", pageendnum=" + pageendnum + ", pagegrpnum=" + pagegrpnum
				+ ", pagecount=" + pagecount + ", isshowpageprev=" + isshowpageprev + ", isshowpagenext="
				+ isshowpagenext + "]";
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCont() {
		return cont;
	}

	public void setCont(String cont) {
		this.cont = cont;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getMenu_id() {
		return menu_id;
	}

	public void setMenu_id(String menu_id) {
		this.menu_id = menu_id;
	}

	public int getBnum() {
		return bnum;
	}

	public void setBnum(int bnum) {
		this.bnum = bnum;
	}

	public int getLvl() {
		return lvl;
	}

	public void setLvl(int lvl) {
		this.lvl = lvl;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public int getNref() {
		return nref;
	}

	public void setNref(int nref) {
		this.nref = nref;
	}

	public int getDelnum() {
		return delnum;
	}

	public void setDelnum(int delnum) {
		this.delnum = delnum;
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

	public BoardVo(int idx, String m_id, String title, String cont, String writer, String regdate, String menu_id,
			int bnum, int lvl, int step, int nref, int delnum, int nowpage, int prevnowpage, int nextnowpage,
			int totalcount, int totalpagecount, int pagestartnum, int pageendnum, int pagegrpnum, int pagecount,
			boolean isshowpageprev, boolean isshowpagenext) {
		this.idx = idx;
		this.m_id = m_id;
		this.title = title;
		this.cont = cont;
		this.writer = writer;
		this.regdate = regdate;
		this.menu_id = menu_id;
		this.bnum = bnum;
		this.lvl = lvl;
		this.step = step;
		this.nref = nref;
		this.delnum = delnum;
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
	};
	
	
	
	
}
