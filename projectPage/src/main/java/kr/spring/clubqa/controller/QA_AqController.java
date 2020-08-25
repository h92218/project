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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.clubqa.domain.ClubAQVO;
import kr.spring.clubqa.service.ClubQAService;
import kr.spring.util.PagingUtil;

@Controller
public class QA_AqController {
	private Logger log = Logger.getLogger(this.getClass());
	private int rowCount = 10;
	private int pageCount = 10;

	@Resource
	private ClubQAService clubqaService;

	@ModelAttribute
	public ClubAQVO initCommand() {
		return new ClubAQVO();
	}
	
	@RequestMapping(value="/ClubQA/QAmainForm.do", method=RequestMethod.GET)
	public ModelAndView qa_process(
			@RequestParam(value="pageNum", defaultValue="1") int currentPage,
			@RequestParam(value="keyfield", defaultValue="") String keyfield,
			@RequestParam(value="keyword", defaultValue="") String keyword) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);

		int count = clubqaService.selectaqRowCount(map);

		if(log.isDebugEnabled()) {
			log.debug("<<count>> : " + count);
		}

		PagingUtil page = new PagingUtil(keyfield, keyword, currentPage, count, rowCount, pageCount, "QAmainForm.do");
		map.put("start", page.getStartCount());
		map.put("end" , page.getEndCount());

		List<ClubAQVO> list = null;
		if(count > 0) {
			list = clubqaService.selectaqList(map);
		}
		
		ClubAQVO clubaqVO = new ClubAQVO();
		clubaqVO.setCount(count);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("QAmain");
		mav.addObject("count", count);
		mav.addObject("list", list);
		mav.addObject("pagingHtml", page.getPagingHtml());


		if(log.isDebugEnabled()) {
			log.debug("<<list>> : " + list);
		}

		return mav;
	}
	
		//자주하는 질문 글 쓰기 폼
		@RequestMapping(value="/ClubQA/QAmain_write.do", method=RequestMethod.GET)
		public String QAlist_write() {
			return "qamain_write";
		}

		//자주하는 질문 글쓰기 처리
		@RequestMapping(value="/ClubQA/QAmain_write.do", method=RequestMethod.POST)
		public String submit(@Valid ClubAQVO clubaqVO, BindingResult result,
				HttpServletRequest request,
				HttpSession session) {

			if(log.isDebugEnabled()) {
				log.debug("<<clubaqVO>> : " + clubaqVO);
			}

			if(result.hasErrors()) {
				return "qamain_write";
			}

			clubaqVO.setMem_num((Integer)session.getAttribute("user_num"));
			

			clubqaService.insertaq(clubaqVO);

			return "redirect:/ClubQA/QAmainForm.do";

		}
		
		//자주하는 질문 글 삭제
		@RequestMapping("/ClubQA/QAmain_delete.do")
		public String submit(@RequestParam(value="num") int num) {

			//로그 표시
			if(log.isDebugEnabled()) {
				log.debug("<<num>> : " + num);
			}

			//글 삭제
			clubqaService.deleteaq(num);

			return "qa_delete";
		}
}
