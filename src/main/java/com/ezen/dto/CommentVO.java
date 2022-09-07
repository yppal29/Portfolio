package com.ezen.dto;

import java.util.Date;

import lombok.Data;

@Data
public class CommentVO {

	private int cno;
	private int bseq;
	private String content;
	private String writer;
	private Date reg_date;
	
	private String nick_name;
	private String member_id;
}
