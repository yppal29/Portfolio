package com.ezen.dto;

import java.util.Arrays;

public class Criteria {
	
	// 특정 페이지 조회를 위한 클래스
	private int page; // 현재 페이지 번호
	private int perPageNum; // 페이지당 보여줄 게시글의 개수
	private String keyword; // 검색 키워드
	private String type;	// 검색 타입
	private String[] typeArr;
	private int boardTitle;
	
	public int getPageStart() {
		return (this.page -1) * perPageNum;
	}

	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if(page <= 0) {
			this.page = 1;
			
		} else {
			this.page = page;
		}	
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		int cnt = this.perPageNum;
		
		if(perPageNum != cnt) {
			this.perPageNum = cnt;	
		} else {
			this.perPageNum = perPageNum;
		}
		
	}
	
	public String getKeyword() {
		return keyword;
	}
	
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
		this.typeArr = type.split("");
	}

	public String[] getTypeArr() {
		return typeArr;
	}

	public void setTypeArr(String[] typeArr) {
		this.typeArr = typeArr; 
	}

	

	public int getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(int boardTitle) {
		this.boardTitle = boardTitle;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", keyword=" + keyword + ", type=" + type
				+ ", typeArr=" + Arrays.toString(typeArr) + ", boardTitle=" + boardTitle + "]";
	}

	
	
}