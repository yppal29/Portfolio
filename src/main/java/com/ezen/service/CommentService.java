package com.ezen.service;

import java.util.List;

import com.ezen.dto.CommentVO;

public interface CommentService {
	
	List<CommentVO> commentListService(int bseq) throws Exception;
	
	int commentInsertService(CommentVO comment) throws Exception;
	
	int commentUpdateService(CommentVO comment) throws Exception;
	
	int commentDeleteService(int cno) throws Exception;
}
