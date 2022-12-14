package com.ezen.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.dto.BoardVO;
import com.ezen.dto.Criteria;
import com.ezen.dto.FileVO;
import com.ezen.dto.MemberVO;
import com.ezen.dto.PageMaker;
import com.ezen.service.BoardService;
import com.ezen.service.MemberService;

@Controller
public class HomeController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Value("${file.upload.directory}")
	String uploadFileDir;

	@Autowired
	BoardService mBoardService;
	
	
	@Autowired
	private MemberService memberService;


	@RequestMapping("/")
	private String main() {
		return "redirect:/index";
	}
	
	@RequestMapping("/chart") 
	private String chartPage() {
		
		return "chart";
	}
	
	@RequestMapping("/index") 
	private String main(Model model) throws Exception {

		model.addAttribute("freeBoard", mBoardService.mainList(1));
		model.addAttribute("tipBoard", mBoardService.mainList(2));
		model.addAttribute("companyBoard", mBoardService.mainList(3));
		model.addAttribute("usedBoard", mBoardService.mainList(4));
		model.addAttribute("gongjiBoard", mBoardService.mainList(5));
		model.addAttribute("qnaBoard", mBoardService.mainList(6));
		
		return "index";
	}
	
	/// ?????? ????????? ????????? ??????
	@RequestMapping("/freeBoard") 
	private ModelAndView freeBoard(Criteria cri) throws Exception {

		cri.setBoardTitle(1);
		
		ModelAndView mav = new ModelAndView();

		PageMaker page = new PageMaker();
		page.setCri(cri);
		page.setTotalCount(mBoardService.listCount(cri));
		
		List<Map<String, Object>> list = mBoardService.listAll(cri);
		
		mav.setViewName("freeBoard");
		mav.addObject("freeBoard", list);
		mav.addObject("page", page);
		
		return mav;
	}
	
	
	/// ??? ????????? ????????? ??????
	@RequestMapping("/tipBoard") 
	private ModelAndView tipBoard(Criteria cri) throws Exception {

		cri.setBoardTitle(2);
		
		ModelAndView mav = new ModelAndView();

		PageMaker page = new PageMaker();
		page.setCri(cri);
		page.setTotalCount(mBoardService.listCount(cri));
		
		List<Map<String, Object>> list = mBoardService.listAll(cri);
		
		mav.setViewName("tipBoard");
		mav.addObject("tipBoard", list);
		mav.addObject("page", page);
		
		return mav;
	}
	
	
	/// ??? ????????? ????????? ??????
	@RequestMapping("/companyBoard") 
	private ModelAndView companyBoard(Criteria cri) throws Exception {

		cri.setBoardTitle(3);
		
		ModelAndView mav = new ModelAndView();

		PageMaker page = new PageMaker();
		page.setCri(cri);
		page.setTotalCount(mBoardService.listCount(cri));
		
		List<Map<String, Object>> list = mBoardService.listAll(cri);
		
		mav.setViewName("companyBoard");
		mav.addObject("companyBoard", list);
		mav.addObject("page", page);
		
		return mav;
	}
	
	
	/// ??? ????????? ????????? ??????
	@RequestMapping("/usedBoard") 
	private ModelAndView usedBoard(Criteria cri) throws Exception {

		cri.setBoardTitle(4);
		
		ModelAndView mav = new ModelAndView();

		PageMaker page = new PageMaker();
		page.setCri(cri);
		page.setTotalCount(mBoardService.listCount(cri));
		
		List<Map<String, Object>> list = mBoardService.listAll(cri);
		
		mav.setViewName("usedBoard");
		mav.addObject("usedBoard", list);
		mav.addObject("page", page);
		
		return mav;
	}
	
	
	/// ??? ????????? ????????? ??????
	@RequestMapping("/gongjiBoard") 
	private ModelAndView gongjiBoard(Criteria cri) throws Exception {

		cri.setBoardTitle(5);
		
		ModelAndView mav = new ModelAndView();

		PageMaker page = new PageMaker();
		page.setCri(cri);
		page.setTotalCount(mBoardService.listCount(cri));
		
		List<Map<String, Object>> list = mBoardService.listAll(cri);
		
		mav.setViewName("gongjiBoard");
		mav.addObject("gongjiBoard", list);
		mav.addObject("page", page);
		
		return mav;
	}
	
	
	/// ??? ????????? ????????? ??????
	@RequestMapping("/qnaBoard") 
	private ModelAndView qnaBoard(Criteria cri) throws Exception {

		cri.setBoardTitle(6);
		
		ModelAndView mav = new ModelAndView();

		PageMaker page = new PageMaker();
		page.setCri(cri);
		page.setTotalCount(mBoardService.listCount(cri));
		
		List<Map<String, Object>> list = mBoardService.listAll(cri);
		
		mav.setViewName("qnaBoard");
		mav.addObject("qnaBoard", list);
		mav.addObject("page", page);
		
		return mav;
	}

	/// ????????? ???????????? ??????
	@RequestMapping("/freeDetail/{bseq}")
	private String freeDetail(@PathVariable int bseq, Model model, HttpSession session) throws Exception {
		
		mBoardService.increaseViewcnt(bseq, session);

		model.addAttribute("detail", mBoardService.boardDetailService(bseq));
		model.addAttribute("files", mBoardService.fileDetailService(bseq));

		return "freeDetail";
	}

	/// ????????? ???????????? ??????
	@RequestMapping("/tipDetail/{bseq}")
	private String tipDetail(@PathVariable int bseq, Model model, HttpSession session) throws Exception {
		
		mBoardService.increaseViewcnt(bseq, session);

		model.addAttribute("detail", mBoardService.boardDetailService(bseq));
		model.addAttribute("files", mBoardService.fileDetailService(bseq));

		return "tipDetail";
	}

	/// ????????? ???????????? ??????
	@RequestMapping("/companyDetail/{bseq}")
	private String companyDetail(@PathVariable int bseq, Model model, HttpSession session) throws Exception {
		
		mBoardService.increaseViewcnt(bseq, session);

		model.addAttribute("detail", mBoardService.boardDetailService(bseq));
		model.addAttribute("files", mBoardService.fileDetailService(bseq));

		return "companyDetail";
	}

	/// ????????? ???????????? ??????
	@RequestMapping("/usedDetail/{bseq}")
	private String usedDetail(@PathVariable int bseq, Model model, HttpSession session) throws Exception {
		
		mBoardService.increaseViewcnt(bseq, session);

		model.addAttribute("detail", mBoardService.boardDetailService(bseq));
		model.addAttribute("files", mBoardService.fileDetailService(bseq));

		return "usedDetail";
	}

	/// ????????? ???????????? ??????
	@RequestMapping("/gongjiDetail/{bseq}")
	private String gongjiDetail(@PathVariable int bseq, Model model, HttpSession session) throws Exception {
		
		mBoardService.increaseViewcnt(bseq, session);

		model.addAttribute("detail", mBoardService.boardDetailService(bseq));
		model.addAttribute("files", mBoardService.fileDetailService(bseq));

		return "gongjiDetail";
	}

	/// ????????? ???????????? ??????
	@RequestMapping("/qnaDetail/{bseq}")
	private String qnaDetail(@PathVariable int bseq, Model model, HttpSession session) throws Exception {
		
		mBoardService.increaseViewcnt(bseq, session);

		model.addAttribute("detail", mBoardService.boardDetailService(bseq));
		model.addAttribute("files", mBoardService.fileDetailService(bseq));

		return "qnaDetail";
	}


	@RequestMapping("/freeInsert") // ????????? ????????? ??????
	private String freeInsertForm() {

		return "freeInsert";
	}
	
	@RequestMapping("/tipInsert") // ????????? ????????? ??????
	private String tipInsertForm() {

		return "tipInsert";
	}
	
	@RequestMapping("/companyInsert") // ????????? ????????? ??????
	private String companyInsertForm() {

		return "companyInsert";
	}
	
	@RequestMapping("/usedInsert") // ????????? ????????? ??????
	private String usedInsertForm() {

		return "usedInsert";
	}
	
	@RequestMapping("/qnaInsert") // ????????? ????????? ??????
	private String qnaInsertForm() {

		return "qnaInsert";
	}

	/// ????????? ????????? ??????
	@RequestMapping("/freeInsertProc")
	private String freeInsertProc(HttpServletRequest request, @RequestPart MultipartFile files) throws Exception {
		BoardVO board = new BoardVO();
		FileVO file = new FileVO();

		board.setTitle(request.getParameter("title"));
		board.setContent(request.getParameter("content"));
		board.setWriter(request.getParameter("writer"));
		board.setBoardTitle(Integer.parseInt(request.getParameter("boardTitle")));
		board.setCategory(Integer.parseInt(request.getParameter("category")));
		
		if (files.isEmpty()) { // ???????????? ????????? ?????? ???
			mBoardService.boardInsertService(board); // ????????? insert
		} else {

			String fileName = files.getOriginalFilename();
			String fileNameExtension = FilenameUtils.getExtension(fileName).toLowerCase();
			File destinationFile;
			String destinationFileName;
			//String fileUrl = "C:\\Users\\LEE.J.W\\eclipse\\SpringWorkspace\\SpringBootWorkspace\\Project6\\src\\main\\webapp\\WEB-INF\\uploadFiles\\";

			do {
				destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension;
				destinationFile = new File(uploadFileDir + destinationFileName);
			} while (destinationFile.exists());

			destinationFile.getParentFile().mkdirs();
			files.transferTo(destinationFile);

			mBoardService.boardInsertService(board); // ????????? insert

			file.setFno(board.getBseq());
			file.setBseq(board.getBseq());
			file.setFileName(destinationFileName);
			file.setFileOriName(fileName);
			file.setFileUrl(uploadFileDir);

			mBoardService.fileInsertService(file); // file insert
		}

		return "redirect:/freeBoard";

	}
	
	@RequestMapping("/tipInsertProc")
	private String tipInsertProc(HttpServletRequest request, @RequestPart MultipartFile files) throws Exception {
		BoardVO board = new BoardVO();
		FileVO file = new FileVO();

		board.setTitle(request.getParameter("title"));
		board.setContent(request.getParameter("content"));
		board.setWriter(request.getParameter("writer"));
		board.setBoardTitle(Integer.parseInt(request.getParameter("boardTitle")));
		board.setCategory(Integer.parseInt(request.getParameter("category")));
		
		if (files.isEmpty()) { // ???????????? ????????? ?????? ???
			mBoardService.boardInsertService(board); // ????????? insert
		} else {

			String fileName = files.getOriginalFilename();
			String fileNameExtension = FilenameUtils.getExtension(fileName).toLowerCase();
			File destinationFile;
			String destinationFileName;
			//String fileUrl = "C:\\Users\\LEE.J.W\\eclipse\\SpringWorkspace\\SpringBootWorkspace\\Project6\\src\\main\\webapp\\WEB-INF\\uploadFiles\\";

			do {
				destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension;
				destinationFile = new File(uploadFileDir + destinationFileName);
			} while (destinationFile.exists());

			destinationFile.getParentFile().mkdirs();
			files.transferTo(destinationFile);

			mBoardService.boardInsertService(board); // ????????? insert

			file.setFno(board.getBseq());
			file.setBseq(board.getBseq());
			file.setFileName(destinationFileName);
			file.setFileOriName(fileName);
			file.setFileUrl(uploadFileDir);

			mBoardService.fileInsertService(file); // file insert
		}

		return "redirect:/tipBoard";

	}
	
	@RequestMapping("/companyInsertProc")
	private String companyInsertProc(HttpServletRequest request, @RequestPart MultipartFile files) throws Exception {
		BoardVO board = new BoardVO();
		FileVO file = new FileVO();

		board.setTitle(request.getParameter("title"));
		board.setContent(request.getParameter("content"));
		board.setWriter(request.getParameter("writer"));
		board.setBoardTitle(Integer.parseInt(request.getParameter("boardTitle")));
		board.setCategory(Integer.parseInt(request.getParameter("category")));
		
		if (files.isEmpty()) { // ???????????? ????????? ?????? ???
			mBoardService.boardInsertService(board); // ????????? insert
		} else {

			String fileName = files.getOriginalFilename();
			String fileNameExtension = FilenameUtils.getExtension(fileName).toLowerCase();
			File destinationFile;
			String destinationFileName;
			//String fileUrl = "C:\\Users\\LEE.J.W\\eclipse\\SpringWorkspace\\SpringBootWorkspace\\Project6\\src\\main\\webapp\\WEB-INF\\uploadFiles\\";

			do {
				destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension;
				destinationFile = new File(uploadFileDir + destinationFileName);
			} while (destinationFile.exists());

			destinationFile.getParentFile().mkdirs();
			files.transferTo(destinationFile);

			mBoardService.boardInsertService(board); // ????????? insert

			file.setFno(board.getBseq());
			file.setBseq(board.getBseq());
			file.setFileName(destinationFileName);
			file.setFileOriName(fileName);
			file.setFileUrl(uploadFileDir);

			mBoardService.fileInsertService(file); // file insert
		}

		return "redirect:/companyBoard";

	}
	
	@RequestMapping("/usedInsertProc")
	private String usedInsertProc(HttpServletRequest request, @RequestPart MultipartFile files) throws Exception {
		BoardVO board = new BoardVO();
		FileVO file = new FileVO();

		board.setTitle(request.getParameter("title"));
		board.setContent(request.getParameter("content"));
		board.setWriter(request.getParameter("writer"));
		board.setBoardTitle(Integer.parseInt(request.getParameter("boardTitle")));
		board.setCategory(Integer.parseInt(request.getParameter("category")));
		
		if (files.isEmpty()) { // ???????????? ????????? ?????? ???
			mBoardService.boardInsertService(board); // ????????? insert
		} else {

			String fileName = files.getOriginalFilename();
			String fileNameExtension = FilenameUtils.getExtension(fileName).toLowerCase();
			File destinationFile;
			String destinationFileName;
			//String fileUrl = "C:\\Users\\LEE.J.W\\eclipse\\SpringWorkspace\\SpringBootWorkspace\\Project6\\src\\main\\webapp\\WEB-INF\\uploadFiles\\";

			do {
				destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension;
				destinationFile = new File(uploadFileDir + destinationFileName);
			} while (destinationFile.exists());

			destinationFile.getParentFile().mkdirs();
			files.transferTo(destinationFile);

			mBoardService.boardInsertService(board); // ????????? insert

			file.setFno(board.getBseq());
			file.setBseq(board.getBseq());
			file.setFileName(destinationFileName);
			file.setFileOriName(fileName);
			file.setFileUrl(uploadFileDir);

			mBoardService.fileInsertService(file); // file insert
		}

		return "redirect:/usedBoard";

	}
	
	@RequestMapping("/qnaInsertProc")
	private String qnaInsertProc(HttpServletRequest request, @RequestPart MultipartFile files) throws Exception {
		BoardVO board = new BoardVO();
		FileVO file = new FileVO();

		board.setTitle(request.getParameter("title"));
		board.setContent(request.getParameter("content"));
		board.setWriter(request.getParameter("writer"));
		board.setBoardTitle(Integer.parseInt(request.getParameter("boardTitle")));
		board.setCategory(Integer.parseInt(request.getParameter("category")));
		
		if (files.isEmpty()) { // ???????????? ????????? ?????? ???
			mBoardService.boardInsertService(board); // ????????? insert
		} else {

			String fileName = files.getOriginalFilename();
			String fileNameExtension = FilenameUtils.getExtension(fileName).toLowerCase();
			File destinationFile;
			String destinationFileName;
			//String fileUrl = "C:\\Users\\LEE.J.W\\eclipse\\SpringWorkspace\\SpringBootWorkspace\\Project6\\src\\main\\webapp\\WEB-INF\\uploadFiles\\";

			do {
				destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension;
				destinationFile = new File(uploadFileDir + destinationFileName);
			} while (destinationFile.exists());

			destinationFile.getParentFile().mkdirs();
			files.transferTo(destinationFile);

			mBoardService.boardInsertService(board); // ????????? insert

			file.setFno(board.getBseq());
			file.setBseq(board.getBseq());
			file.setFileName(destinationFileName);
			file.setFileOriName(fileName);
			file.setFileUrl(uploadFileDir);

			mBoardService.fileInsertService(file); // file insert
		}

		return "redirect:/qnaBoard";

	}
	
	/// ?????? ?????????&???????????? ??????
	@RequestMapping("/fileDown/{bseq}")
	private void fileDown(@PathVariable int bseq, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		FileVO fileVO = mBoardService.fileDetailService(bseq);
		
		try {
			String fileUrl = fileVO.getFileUrl();
			fileUrl += "/";
			String savePath = fileUrl;
			String fileName = fileVO.getFileName();
			
			String oriFileName = fileVO.getFileOriName();
			InputStream in = null;
			OutputStream os = null;
			File file = null;
			boolean skip = false;
			String client = "";
			
			try {
				file = new File(savePath, fileName);
				in = new FileInputStream(file);
			} catch (FileNotFoundException fe) {
				skip = true;
			}
			client = request.getHeader("User-Agent");
			
			response.reset();
			response.setContentType("application/octet-stream");
			response.setHeader("Content-Description", "JSP Generated Data");
			
			if (!skip) {
				if (client.indexOf("MSIE") != -1) {
					response.setHeader("Content-Disposition", "attachment; filename=\""
							+ java.net.URLEncoder.encode(oriFileName,"UTF-8").replaceAll("\\+","\\??")+"\"");
				} else if (client.indexOf("Trident") != -1) {
					response.setHeader("Content-Disposition", "attachment; filename=\""
							+ java.net.URLEncoder.encode(oriFileName, "UTF-8").replaceAll("\\+","\\??")+"\"");
				} else {
					response.setHeader("Content-Disposition", "attachment; filename=\""
							+ new String(oriFileName.getBytes("UTF-8"), "ISO8859_1") + "\"");
					response.setHeader("Content-Type", "application/octet-stream; charset=UTF-8");
				}
				response.setHeader("Content-Length", "" + file.length());
				os = response.getOutputStream();
				byte b[] = new byte[(int) file.length()];
				int leng = 0;
				while ((leng = in.read(b)) > 0) {
					os.write(b, 0, leng);
				}
			} else {
				response.setContentType("text/html;charset=UTF-8");
				System.out.println("<script??language='javascript'>alert('????????????????????????????????????');history.back();</script>");
			}
			in.close();
			os.close();
		} catch (Exception e) {
			System.out.println("ERROR : " + e.getMessage());
		}
	}
	
	@RequestMapping("/freeUpdate/{bseq}") // ????????? ????????? ??????
	private String freeUpdateForm(@PathVariable int bseq, Model model) throws Exception {

		model.addAttribute("detail", mBoardService.boardDetailService(bseq));

		return "freeUpdate";
	}
	
	@RequestMapping("/tipUpdate/{bseq}") // ????????? ????????? ??????
	private String tipUpdateForm(@PathVariable int bseq, Model model) throws Exception {

		model.addAttribute("detail", mBoardService.boardDetailService(bseq));

		return "tipUpdate";
	}
	
	@RequestMapping("/companyUpdate/{bseq}") // ????????? ????????? ??????
	private String companyUpdateForm(@PathVariable int bseq, Model model) throws Exception {

		model.addAttribute("detail", mBoardService.boardDetailService(bseq));

		return "companyUpdate";
	}
	
	@RequestMapping("/usedUpdate/{bseq}") // ????????? ????????? ??????
	private String usedUpdateForm(@PathVariable int bseq, Model model) throws Exception {

		model.addAttribute("detail", mBoardService.boardDetailService(bseq));

		return "usedUpdate";
	}
	
	@RequestMapping("/qnaUpdate/{bseq}") // ????????? ????????? ??????
	private String qnaUpdateForm(@PathVariable int bseq, Model model) throws Exception {

		model.addAttribute("detail", mBoardService.boardDetailService(bseq));

		return "qnaUpdate";
	}

	/// ????????? ?????? ??????
	@RequestMapping("/freeUpdateProc")
	private String freeUpdateProc(BoardVO board, HttpServletRequest request) throws Exception {
		BoardVO upBoard = new BoardVO();
		
		upBoard = board;

		mBoardService.boardUpdateService(board);

		return "redirect:/freeDetail/" + request.getParameter("bseq");
	}

	/// ????????? ?????? ??????
	@RequestMapping("/tipUpdateProc")
	private String tipUpdateProc(BoardVO board, HttpServletRequest request) throws Exception {
		BoardVO upBoard = new BoardVO();
		
		upBoard = board;

		mBoardService.boardUpdateService(board);

		return "redirect:/tipDetail/" + request.getParameter("bseq");
	}

	/// ????????? ?????? ??????
	@RequestMapping("/companyUpdateProc")
	private String companyUpdateProc(BoardVO board, HttpServletRequest request) throws Exception {
		BoardVO upBoard = new BoardVO();
		
		upBoard = board;

		mBoardService.boardUpdateService(board);

		return "redirect:/companyDetail/" + request.getParameter("bseq");
	}

	/// ????????? ?????? ??????
	@RequestMapping("/usedUpdateProc")
	private String usedUpdateProc(BoardVO board, HttpServletRequest request) throws Exception {
		BoardVO upBoard = new BoardVO();
		
		upBoard = board;

		mBoardService.boardUpdateService(board);

		return "redirect:/usedDetail/" + request.getParameter("bseq");
	}

	/// ????????? ?????? ??????
	@RequestMapping("/qnaUpdateProc")
	private String boardUpdateProc(BoardVO board, HttpServletRequest request) throws Exception {
		BoardVO upBoard = new BoardVO();
		
		upBoard = board;

		mBoardService.boardUpdateService(board);

		return "redirect:/qnaDetail/" + request.getParameter("bseq");
	}

	/// ????????? ?????? ??????
	@RequestMapping("/freeDelete/{bseq}")
	private String freeDelete(@PathVariable int bseq) throws Exception {

		mBoardService.boardDeleteService(bseq);

		return "redirect:/freeBoard";
	}
	
	/// ????????? ?????? ??????
	@RequestMapping("/tipDelete/{bseq}")
	private String tipDelete(@PathVariable int bseq) throws Exception {

		mBoardService.boardDeleteService(bseq);

		return "redirect:/tipBoard";
	}
	
	/// ????????? ?????? ??????
	@RequestMapping("/companyDelete/{bseq}")
	private String companyDelete(@PathVariable int bseq) throws Exception {

		mBoardService.boardDeleteService(bseq);

		return "redirect:/companyBoard";
	}
	
	/// ????????? ?????? ??????
	@RequestMapping("/usedDelete/{bseq}")
	private String usedDelete(@PathVariable int bseq) throws Exception {

		mBoardService.boardDeleteService(bseq);

		return "redirect:/usedBoard";
	}
	
	/// ????????? ?????? ??????
	@RequestMapping("/qnaDelete/{bseq}")
	private String qnaDelete(@PathVariable int bseq) throws Exception {

		mBoardService.boardDeleteService(bseq);

		return "redirect:/qnaBoard";
	}

	/// ????????? ??????
	@PostMapping("/login")
	public String login(@RequestParam Map<String, String> map, Model model, HttpSession session, HttpServletRequest request) throws Exception {

		String referer = request.getHeader("REFERER");
		
		MemberVO member = memberService.login(map);

		session.setAttribute("member", member);
		

		return "redirect:"+referer;
	}

	   @RequestMapping(value="login", method=RequestMethod.GET)
	    public String loginGET() {
	        
	        return "user/login";
	    }
	    
	    @RequestMapping(value="loginPostNaver", method=RequestMethod.GET)
	    public String loginPOSTNaver(HttpSession session) {
	        
	        return "user/loginPostNaver";
	    }

	
	/// ???????????? ??????
	@RequestMapping(value = "logout.do", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();

		session.invalidate();

		return "redirect:/index";
	}
	
	/// ???????????? ??????
	@RequestMapping(value="/register", method=RequestMethod.GET) 
	public void registerGet() throws Exception {
		
		logger.info("********GET register");
	}

	/// ???????????? ??????
	@RequestMapping(value="/register", method=RequestMethod.POST) 
	public String memberRegister(MemberVO member) throws Exception {
		
		int count = memberService.idCheck(member.getMember_id());
		
		try {
			if(count == 0) memberService.memberRegister(member);
		} catch (Exception e) {
			logger.info("****?????? ?????? ?????????");
		}
		
		return "redirect:/index";
	}
	
	/// ????????? ?????? ?????? ??????
	@ResponseBody 
	@RequestMapping(value="/idCheck", method=RequestMethod.POST)
	public int idCheck(@RequestBody String member_id) throws Exception {

		logger.info("***********idCheck");

		int count = 0;
		if(member_id != null) count = memberService.idCheck(member_id);

		return count;	
	}
}
