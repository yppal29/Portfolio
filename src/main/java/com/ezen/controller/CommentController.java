package com.ezen.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.dto.CommentVO;
import com.ezen.service.CommentService;

@Controller
@RequestMapping("/comment")
public class CommentController {

	@Autowired
	CommentService mCommentService;
	
	/// 댓글 리스트 구현
	@RequestMapping("/list")
	@ResponseBody
	private List<CommentVO> mCommentServiceList(Model model, int bseq) throws Exception {
		return mCommentService.commentListService(bseq);
	}
	
	/// 댓글 쓰기 구현
	@RequestMapping("/insert")
	@ResponseBody
	private int mComentServiceInsert(@RequestParam String writer, @RequestParam int bseq, @RequestParam String content, HttpServletRequest request) throws Exception {
		CommentVO comment = new CommentVO();
		comment.setBseq(bseq);
		comment.setContent(content);
		comment.setWriter(writer);
		
		return mCommentService.commentInsertService(comment);
	}
	
	/// 댓글 수정 구현
	@RequestMapping("/update")
	@ResponseBody
	private int mCommentServiceUpdateProc(@RequestParam int cno, @RequestParam String content) throws Exception {
		CommentVO comment = new CommentVO();
		comment.setCno(cno);
		comment.setContent(content);
		
		return mCommentService.commentUpdateService(comment);
	}
	
	/// 댓글 삭제 구현
	@RequestMapping("/delete/{cno}")
	@ResponseBody
	private int mCommentServiceDelete(@PathVariable int cno) throws Exception {
		return mCommentService.commentDeleteService(cno);
	}
}
