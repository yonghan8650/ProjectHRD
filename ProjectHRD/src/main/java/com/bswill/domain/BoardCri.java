package com.bswill.domain;

public class BoardCri {
	private int page;
	private int pageSize;
	public BoardCri() {
		this.page = 1;
		this.pageSize = 10;
	}
	
	public void setPage(int page) {
		if(page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}
	public void setPageSize(int pageSize) {
		if(pageSize <= 0 || pageSize > 100) {
			this.pageSize = 10;
			return;
		}
	}
	public int getPage() {
		return page;
	}
	public int getPageSize() {
		return pageSize;
	}
	
	
	
	
}
