package com.bswill.domain;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class AttendancePageVO {

	private static final Logger logger = LoggerFactory.getLogger(AttendancePageVO.class);

	private int totalCount; // 전체 글의 수
	private int startPage; // 블럭의 시작번호
	private int endPage; // 블럭의 끝번호

	private boolean prev; // 이전버튼
	private boolean next; // 다음버튼

	private int pageBlock = 10; // 페이지 블럭의 개수

	// private int page; // 페이지번호
	// private int pageSize; // 페이지 크기
	private AttendanceCri cri;

	public void setCri(AttendanceCri cri) {
		this.cri = cri;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		logger.debug("  페이징처리에 필요한 정보를 계산 - 시작 ");

		pageCalc();

		logger.debug("  페이징처리에 필요한 정보를 계산 - 끝 ");

	}// setTotalCount()

	public void pageCalc() {
		// endPage
		endPage = (int) Math.ceil(cri.getPage() / (double) pageBlock) * pageBlock;

		// startPage
		startPage = (endPage - pageBlock) + 1;

		// tmpEndPage (실제 endPage)
		int tmpEndPage = (int) Math.ceil(totalCount / (double) cri.getPageSize());

		if (endPage > tmpEndPage) { // 글이 없음
			endPage = tmpEndPage;
		}

		// prev
		// prev = startPage == 1? false : true;
		prev = startPage != 1;

		// next
		// next = endPage * cri.getPageSize() >= totalCount? false : true;
		next = endPage * cri.getPageSize() < totalCount;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public boolean isNext() {
		return next;
	}

	public int getPageBlock() {
		return pageBlock;
	}

	public AttendanceCri getCri() {
		return cri;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public void setPageBlock(int pageBlock) {
		this.pageBlock = pageBlock;
	}

	@Override
	public String toString() {
		return "AttendancePageVO [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage
				+ ", prev=" + prev + ", next=" + next + ", pageBlock=" + pageBlock + ", cri=" + cri + "]";
	}

}
