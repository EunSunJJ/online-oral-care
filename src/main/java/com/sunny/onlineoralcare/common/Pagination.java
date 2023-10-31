package com.sunny.onlineoralcare.common;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class Pagination {

	// 현재 페이지 , 페이지당 게시물 표시 수 정보
	private int page;

	// 게시물의 총 개수
	private int totalPost;

	// 하단 페이지 번호의 전체 개수
	private int totalPage;

	// 페이지당 출력할 게시물의 개수
	private int postSize = 10;

	// 한번에 표시할 하단 페이지 번호
	private int pageSize = 5;

	// 표시되는 페이지 번호 중 마지막 번호
	private int endPage;

	// 표시되는 페이지 번호 중 마지막 번호
	private int realEndPage;

	// 표시되는 페이지 번호 중 첫번째 번호
	private int startPage;

	// 이전 페이지 여부
	private boolean prev;

	// 다음 페이지 여부
	private boolean next;
	
	//게시판 시작 번호 - limit 조건 걸 때 사용
	private int start;
	
	// 검색 기능 
	private String keyword;
	private String searchType;
	
	// search
	public void searchMaker(String keyword, String searchType) {
		this.keyword = keyword;
		this.searchType = searchType;
	}
		
	// paging
	public void pageMaker(int page, int totalPost) {

		this.page = page;
		this.totalPost = totalPost;
		
		// 전체 페이지수
		this.totalPage = (int) Math.ceil((double)totalPost / postSize);
		
		// 마지막 페이지
		this.endPage = (int) (Math.ceil((double)page / pageSize)) * pageSize;

		// 마지막 페이지 재계산
		this.realEndPage = (int) (Math.ceil((double)totalPost / postSize));

		// 마지막 페이지 비교 후 값 조정
		if (this.realEndPage < this.endPage) {
			this.endPage = this.realEndPage;
		}

		// 시작 페이지
		this.startPage = endPage - pageSize + 1;

		// 시작 페이지(startPage)값이 1보다 큰 경우 true 
		this.prev = this.startPage > 1;

		// 마지막 페이지(endPage)값이 1보다 큰 경우 true
		this.next = this.endPage < realEndPage;
		
		//게시판 시작 번호 - limit 조건 걸 때 사용		
		this.start = (page - 1) * postSize;
	}
}