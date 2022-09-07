package com.ezen.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.ezen.dto.BoardVO;
import com.ezen.dto.Criteria;
import com.ezen.dto.FileVO;

public interface BoardService {
	int listCount(Criteria cri);

	List<Map<String, Object>> mainList(int boardTitle) throws Exception;
	
	List<Map<String, Object>> listAll(Criteria cri) throws Exception;
	
	BoardVO boardDetailService(int bseq) throws Exception;
	
	int boardInsertService(BoardVO board) throws Exception;
	
	int boardUpdateService(BoardVO board) throws Exception;
	
	int boardDeleteService(int bseq) throws Exception;
	
	int fileInsertService(FileVO file) throws Exception;
	
	FileVO fileDetailService(int bseq) throws Exception;
	
	void increaseViewcnt(int bseq, HttpSession session) throws Exception;
}
