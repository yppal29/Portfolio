package com.ezen.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.dto.CommentVO;
import com.ezen.mappers.CommentMapper;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	CommentMapper mCommentMapper;
	
	@Override
	public List<CommentVO> commentListService(int bseq) throws Exception {

		return mCommentMapper.commentList(bseq);
	}

	@Override
	public int commentInsertService(CommentVO comment) throws Exception {

		return mCommentMapper.commentInsert(comment);
	}

	@Override
	public int commentUpdateService(CommentVO comment) throws Exception {

		return mCommentMapper.commentUpdate(comment);
	}

	@Override
	public int commentDeleteService(int cno) throws Exception {

		return mCommentMapper.commentDelete(cno);
	}

}
