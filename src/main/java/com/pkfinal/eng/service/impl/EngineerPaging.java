package com.pkfinal.eng.service.impl;

import com.pkfinal.eng.vo.EngVo;

public class EngineerPaging {
   private int totalCount;
   private int nowPage;
   private int prevNowPage;
   private int nextNowPage;
   private int pageCount;
   private int pageTotalCount;
   private int pageGrpNum;
   private int startPageNum;
   private int endPageNum;
   private int totalRecordPageCount;
   private boolean isShowPagePrev = true;
   private boolean isShowPageNext = false;

    public int getTotalCount() {
      return totalCount;
   }
   public void setTotalCount(int totalCount) {
      this.totalCount = totalCount;
   }
   public int getNowPage() {
      return nowPage;
   }
   public void setNowPage(int nowPage) {
      this.nowPage = nowPage;
   }
   public int getPrevNowPage() {
      return prevNowPage;
   }
   public void setPrevNowPage(int prevNowPage) {
      this.prevNowPage = prevNowPage;
   }
   public int getNextNowPage() {
      return nextNowPage;
   }
   public void setNextNowPage(int nextNowPage) {
      this.nextNowPage = nextNowPage;
   }
   public int getPageCount() {
      return pageCount;
   }
   public void setPageCount(int pageCount) {
      this.pageCount = pageCount;
   }
   public int getPageTotalCount() {
      return pageTotalCount;
   }
   public void setPageTotalCount(int pageTotalCount) {
      this.pageTotalCount = pageTotalCount;
   }
   public int getPageGrpNum() {
      return pageGrpNum;
   }
   public void setPageGrpNum(int pageGrpNum) {
      this.pageGrpNum = pageGrpNum;
   }
   public int getStartPageNum() {
      return startPageNum;
   }
   public void setStartPageNum(int startPageNum) {
      this.startPageNum = startPageNum;
   }
   public int getEndPageNum() {
      return endPageNum;
   }
   public void setEndPageNum(int endPageNum) {
      this.endPageNum = endPageNum;
   }
   public int getTotalRecordPageCount() {
      return totalRecordPageCount;
   }
   public void setTotalRecordPageCount(int totalRecordPageCount) {
      this.totalRecordPageCount = totalRecordPageCount;
   }
   public boolean isShowPagePrev() {
      return isShowPagePrev;
   }
   public void setShowPagePrev(boolean isShowPagePrev) {
      this.isShowPagePrev = isShowPagePrev;
   }
   public boolean isShowPageNext() {
      return isShowPageNext;
   }
   public void setShowPageNext(boolean isShowPageNext) {
      this.isShowPageNext = isShowPageNext;
   }
   
   @Override
   public String toString() {
      return "BoardPaging [totalCount=" + totalCount + ", nowPage=" + nowPage + ", prevNowPage=" + prevNowPage
            + ", nextNowPage=" + nextNowPage + ", pageCount=" + pageCount + ", pageTotalCount=" + pageTotalCount
            + ", pageGrpNum=" + pageGrpNum + ", startPageNum=" + startPageNum + ", endPageNum=" + endPageNum
            + ", totalRecordPageCount=" + totalRecordPageCount + ", isShowPagePrev=" + isShowPagePrev
            + ", isShowPageNext=" + isShowPageNext + "]";
   }
   
   public EngineerPaging(int totalCount, int nowPage, int pageCount, int pageTotalCount, int pageGrpNum) {
      this.totalCount = totalCount;
      this.nowPage = nowPage;
      this.pageCount = pageCount;
      this.pageTotalCount = pageTotalCount;
      this.pageGrpNum = pageGrpNum;
   }
   
   public EngVo getEngineerPaging() {
	   EngVo vo = new EngVo();
	   //totalRecordPageCount = 총 페이지 버튼 수
	   // 
      this.totalRecordPageCount = (int) Math.ceil((double) totalCount / pageCount);
      startPageNum = (pageGrpNum - 1) * pageTotalCount + 1;
      endPageNum = totalRecordPageCount < (pageGrpNum * pageTotalCount) ?
         totalRecordPageCount : (pageGrpNum * pageTotalCount);
      
      System.out.println("totalRecordPageCount : "       + totalRecordPageCount);
      System.out.println("startpageNum : "    			 + startPageNum);
      System.out.println("pageGrpNum : "      			 + pageGrpNum);
      System.out.println("pageTotalCount : " 			 + pageTotalCount);
      System.out.println("startpageNum : "               + startPageNum);
      System.out.println("endPageNum : "                 + endPageNum);
      
      prevNowPage = startPageNum - 1;
      nextNowPage = endPageNum + 1;
      
      vo.setNowpage(nowPage);
      vo.setPrevnowpage(prevNowPage);
      vo.setNextnowpage(nextNowPage);
      
      vo.setTotalcount(totalCount);
      vo.setTotalpagecount(pageTotalCount);
      
      vo.setPagestartnum(startPageNum);
      vo.setPageendnum(endPageNum);
      
      vo.setPagecount(pageCount);
      vo.setPagegrpnum(pageGrpNum);
      
      if(startPageNum == 1) 
    	  isShowPagePrev = false;      		
      if(endPageNum < totalRecordPageCount) 
    	  isShowPageNext = true;
    
      vo.setIsshowpagenext(isShowPageNext);
      vo.setIsshowpageprev(isShowPagePrev);
      System.out.println(vo);
      return vo;
   }

}