package com.bswill.domain;

public class AttendanceCri {

	private int page;  // 페이지 번호
	private int pageSize;  //페이지 크기
	
	public AttendanceCri() {
		this.page = 1;
		this.pageSize = 10;
	}

	// alt shift s + r  
	public void setPage(int page) {
		if(page <= 0) { //페이지번호가 음수일때
			this.page = 1;
			return;
		}
		this.page = page;
	}
	public void setPageSize(int pageSize) {
		if(pageSize <= 0 || pageSize > 100) { //페이지 크기가 이상한경우
			this.pageSize = 10;
			return;
		}
		this.pageSize = pageSize;
	}
	
	
	// 페이지정보를 인덱스로 변경하는 메서드
	public int getStartPage() {
		return (this.page - 1) * pageSize;
	}

	public int getPage() {
		//return (this.page - 1) * pageSize;
		return page;
	}
	
	public int getPageSize() {
		return pageSize;
	}

		
	// alt shift s + s
	@Override
	public String toString() {
		return "AttendanceCri [page=" + page + ", pageSize=" + pageSize + "]";
	}
}
