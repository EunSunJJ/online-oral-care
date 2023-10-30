package com.sunny.onlineoralcare.common;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class SearchPagination extends Pagination {

	// 검색 기능 
	private String keyword;
	private String searchType;
	
	// search
	public void searchMaker(String keyword, String searchType) {
		this.keyword = keyword;
		this.searchType = searchType;
		
	}
}
