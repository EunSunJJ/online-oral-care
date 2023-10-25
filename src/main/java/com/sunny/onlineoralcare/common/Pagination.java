package com.sunny.onlineoralcare.common;

public class Pagination {

	//초기값으로 목록개수를 10으로 셋팅
	private int listSize = 10;  
	
	//초기값으로 페이지범위를 10으로 셋팅
	private int rangeSize = 10;    
	
	private int page;
	private int range;
	private int listCnt;
	private int pageCnt;
	private int startPage;
	private int startList;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	// getter setter 생성
	public int getListSize() {
		return listSize;
	}
	public void setListSize(int listSize) {
		this.listSize = listSize;
	}
	public int getRangeSize() {
		return rangeSize;
	}
	public void setRangeSize(int rangeSize) {
		this.rangeSize = rangeSize;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRange() {
		return range;
	}
	public void setRange(int range) {
		this.range = range;
	}
	public int getListCnt() {
		return listCnt;
	}
	public void setListCnt(int listCnt) {
		this.listCnt = listCnt;
	}
	public int getPageCnt() {
		return pageCnt;
	}
	public void setPageCnt(int pageCnt) {
		this.pageCnt = pageCnt;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getStartList() {
		return startList;
	}
	public void setStartList(int startList) {
		this.startList = startList;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	
	// 페이지 정보
	// 3개의 파라미터 
	// 1.page = 현재 페이지 정보 2.range = 현재 페이지 범위 정보 3.listCnt = 게시물 총 개수
	public void pageInfo(int page, int range, int listCnt) {
		
		// 우선 전달 받은 인자들을 프로퍼티에 setting
		this.page = page;
		this.range = range;
		this.listCnt = listCnt;
		
		// 전체 페이지수 
		this.pageCnt = (int) Math.ceil(listCnt/listSize);

		// 시작 페이지
		this.startPage = (range - 1) * rangeSize + 1 ;

		// 마지막 페이지 - [다음]버튼의 활성화 여부를 판단하기 위해서 구함
		this.endPage = range * rangeSize;

		// 게시판 시작번호 - MySQL을 이용해 원하는 목록을 가져오기 위해서 구함
		this.startList = (page - 1) * listSize;

		// 이전 버튼 상태
		// 첫번째 페이지 범위에서는 [이전]버튼이 필요없다!
		// 페이지 범위가 1일 때는 false, 1이 아닐 때는 true
		this.prev = range == 1 ? false : true;
		
		// 다음 버튼 상태
		// 현재 페이지의 마지막 페이지 번호 > 전체 페이지 개수 = 활성화
		
		// 마지막 페이지 번호를 작업할때 한가지 유의 사항
		// 마지막 if 구문은 마지막 번호와 페이지의 총 갯수를 비교 
		// if 마지막 번호 > 총 개수 = 마지막 번호로 총 개수를 셋팅
		// 다음 페이지에 대한 이동도 비활성 : this.next = false;
		this.next = endPage > pageCnt ? false : true;
		if (this.endPage > this.pageCnt) {
			this.endPage = this.pageCnt;
			this.next = false;
		}
	}
	
	

}
