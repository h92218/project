package kr.spring.clubqa.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.clubqa.domain.ClubQA1_1VO;
import kr.spring.clubqa.domain.ClubQAVO;
import kr.spring.clubqa.service.ClubQAService;
import kr.spring.util.PagingUtil;

@Controller
public class QA1_1Controller {
	private Logger log = Logger.getLogger(this.getClass());
	private int rowCount = 10;
	private int pageCount = 10;

	@Resource
	private ClubQAService clubqaService;


	@ModelAttribute
	public ClubQA1_1VO initCommand1() {
		return new ClubQA1_1VO();
	}

	//질문 게시판 폼 호출
	@RequestMapping("/ClubQA/QA1_1/QA1_1_list.do")
	public ModelAndView qa1_1process(
			@RequestParam(value="pageNum", defaultValue="1") int currentPage,
			@RequestParam(value="keyfield", defaultValue="") String keyfield,
			@RequestParam(value="keyword", defaultValue="") String keyword) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);

		int count = clubqaService.select1_1RowCount(map);

		if(log.isDebugEnabled()) {
			log.debug("<<count>> : " + count);
		}

		PagingUtil page = new PagingUtil(keyfield, keyword, currentPage, count, rowCount, pageCount, "QA1_1_list.do");
		map.put("start", page.getStartCount());
		map.put("end" , page.getEndCount());

		List<ClubQA1_1VO> list = null;
		if(count > 0) {
			list = clubqaService.select1_1List(map);
		}

		ModelAndView mav = new ModelAndView();
		mav.setViewName("qa1_1_main");
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("pagingHtml", page.getPagingHtml());


		if(log.isDebugEnabled()) {
			log.debug("<<list>> : " + list);
		}

		return mav;
	}

	//질문 글 쓰기 폼 호출
	@RequestMapping(value="/ClubQA/QA1_1/QA1_1_write.do", method=RequestMethod.GET)
	public String QAreport_write() {
		return "qa1_1_write";
	}

	//질문  글 쓰기 처리
	@RequestMapping(value="/ClubQA/QA1_1/QA1_1_write.do", method=RequestMethod.POST)
	public String submit1_1(@Valid ClubQA1_1VO clubqa1_1VO, BindingResult result,
			HttpServletRequest request,
			HttpSession session) {

		if(log.isDebugEnabled()) {
			log.debug("<<clubqaVO>> : " + clubqa1_1VO);
		}

		if(result.hasErrors()) {
			return "qa1_1_write";
		}

		clubqa1_1VO.setMem_num((Integer)session.getAttribute("user_num"));
		clubqa1_1VO.setMem_id((String)session.getAttribute("user_id"));



		clubqaService.insert1_1(clubqa1_1VO);

		return "redirect:/ClubQA/QA1_1/QA1_1_list.do";

	}



	//이미지 처리
	@RequestMapping("/ClubQA/QA1_1/imageView.do")
	public ModelAndView viewImage(@RequestParam("num")int num) {
		ClubQA1_1VO clubqa1_1VO = clubqaService.select1_1QABoard(num);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("imageView");
		mav.addObject("imageFile", clubqa1_1VO.getQa1_1uploadfile());
		mav.addObject("qa1_1filename", clubqa1_1VO.getQa1_1filename());


		return mav;
	}

	//건의 / 신고  글 상세 페이지
	@RequestMapping("/ClubQA/QA1_1/QA1_1_detail.do")
	public ModelAndView qa_process(@RequestParam("num") int num
			) throws Exception{


		if(log.isDebugEnabled()) {
			log.debug("<<num>> : " + num);
		}

		clubqaService.update1_1QAhit(num);

		ClubQA1_1VO clubqa = clubqaService.select1_1QABoard(num);

		return new ModelAndView("qa1_1_detail", "clubqa", clubqa);

	}
	
	// 질문 글 수정 폼 호출
		@RequestMapping(value="/ClubQA/QA1_1/QA1_1_update.do",
				method=RequestMethod.GET)
		public String form(@RequestParam("num") int num,
				Model model) {

			ClubQA1_1VO clubqa =
					clubqaService.select1_1QABoard(num);

			model.addAttribute("clubQA1_1VO", clubqa);

			return "qa1_1_update";
		}

		//질문 글 수정 처리
		@RequestMapping(value="/ClubQA/QA1_1/QA1_1_update.do",
				method=RequestMethod.POST)
		public String submitUpdate1(@Valid ClubQA1_1VO clubqa1_1VO,
				BindingResult result,
				HttpServletRequest request) {

			//로그 표시
			if(log.isDebugEnabled()) {
				log.debug("<<clubqaVO>> : " + clubqa1_1VO);
			}

			//유효성 체크 결과 에러가 있으면 폼 호출
			if(result.hasErrors()) {
				return "qa1_1_update";
			}

			clubqaService.update1_1(clubqa1_1VO);

			return "redirect:/ClubQA/QA1_1/QA1_1_list.do";
		}

		//질문 글 삭제
		@RequestMapping("/ClubQA/QA1_1/QA1_1_delete.do")
		public String submit(@RequestParam("num") int num) {

			//로그 표시
			if(log.isDebugEnabled()) {
				log.debug("<<num>> : " + num);
			}

			//글 삭제
			clubqaService.delete1_1(num);

			return "redirect:/ClubQA/QA1_1/QA1_1_list.do";
		}



}
