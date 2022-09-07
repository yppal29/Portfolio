package com.ezen.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.dto.BoardVO;
import com.ezen.dto.Criteria;
import com.ezen.dto.FileVO;
import com.ezen.mappers.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardMapper mBoardMapper;

	public int listCount(Criteria cri) {
		return mBoardMapper.listCount(cri);
	}

	public List<Map<String, Object>> mainList(int boardTitle) throws Exception {

		return mBoardMapper.mainList(boardTitle);
	}

	public List<Map<String, Object>> listAll(Criteria cri) throws Exception {

		return mBoardMapper.listAll(cri);
	}

	public BoardVO boardDetailService(int bseq) throws Exception {

		return mBoardMapper.boardDetail(bseq);
	}

	public int boardInsertService(BoardVO board) throws Exception {

		return mBoardMapper.boardInsert(board);
	}

	public int boardUpdateService(BoardVO board) throws Exception {

		return mBoardMapper.boardUpdate(board);
	}

	public int boardDeleteService(int bseq) throws Exception {

		return mBoardMapper.boardDelete(bseq);
	}

	public int fileInsertService(FileVO file) throws Exception {

		return mBoardMapper.fileInsert(file);
	}

	public FileVO fileDetailService(int bseq) throws Exception {

		return mBoardMapper.fileDetail(bseq);
	}

	public void increaseViewcnt(int bseq, HttpSession session) throws Exception {
		long update_time = 0;

		if (session.getAttribute("update_time_" + bseq) != null) {
			update_time = (long) session.getAttribute("update_time_" + bseq);
		}

		long current_time = System.currentTimeMillis();

		if (current_time - update_time > 5 * 100) {
			mBoardMapper.increaseViewcnt(bseq);

			session.setAttribute("update_time_" + bseq, current_time);
		}

	}
}
