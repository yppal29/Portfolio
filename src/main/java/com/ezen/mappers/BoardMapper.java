package com.ezen.mappers;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ezen.dto.BoardVO;
import com.ezen.dto.Criteria;
import com.ezen.dto.FileVO;

@Mapper
public interface BoardMapper {
	public int listCount(Criteria cri);
	
	public List<Map<String, Object>> mainList(int boardTitle) throws Exception;

    //게시글 목록  
    public List<Map<String, Object>> listAll(Criteria cri) throws Exception;
    
    //게시글 상세
    public BoardVO boardDetail(int bseq) throws Exception;

    //게시글 작성  
    public int boardInsert(BoardVO board) throws Exception;

    //게시글 수정  
    public int boardUpdate(BoardVO board) throws Exception;

    //게시글 삭제  
    public int boardDelete(int bseq) throws Exception;
    
    // 파일 업로드
    public int fileInsert(FileVO file) throws Exception;
    
    // 파일 상세보기
    public FileVO fileDetail(int bseq) throws Exception;

    // 조회수 증가
	public void increaseViewcnt(int bseq) throws Exception;
    
}
