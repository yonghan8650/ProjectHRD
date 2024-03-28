package com.bswill.domain;

public class BoardCri {
	private int page; //페이지 번호
	private int pageSize; //페이지 크기
	private String keyword;	// 검색어
	public BoardCri() {
		this.page = 1;
		this.pageSize = 10;
	}



	public void setPage(int page) {
		if(page <= 0) {		//페이지번호가 음수일 때
			this.page =1;
			return;
		}
		this.page = page;
	}
	
	public void setPageSize(int pageSize) {
		if(pageSize <= 0 || pageSize >100) {	//페이지 크기가 이상한 경우
			this.pageSize = 10;
			return;
		}
		this.pageSize = pageSize;
	}
	
	// 페이지 정보를 인덱스로 변경하는 메서드
	public int getStartPage() {		
		return (this.page-1) * pageSize;
	}
	
	public int getPage() {		
		//return (this.page-1) * pageSize;
		return page;
	}
	
	public int getPageSize() {
		return pageSize;
	}
	
	public String getKeyword() {
		return keyword;
	}
	
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "BoardCri [page=" + page + ", pageSize=" + pageSize + ", keyword=" + keyword + "]";
	}

	
	
	
	
	
}
