package com.ezen.dto;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	private int bseq;
	private String writer;
	private String title;
	private String content;
	private Date regdate;
	private int count;
	private int category;
	private int boardTitle;
	
	private int file;
	
	private String type;
	private String keyword;
	
	private String catType;
	private String nick_name;
	private String member_id;
}
