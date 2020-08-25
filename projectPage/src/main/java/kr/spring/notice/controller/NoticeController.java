package kr.spring.notice.controller;

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

import kr.spring.notice.domain.NoticeVO;
import kr.spring.notice.service.NoticeService;
import kr.spring.util.PagingUtil;
//공지
@Controller
public class NoticeController {
	private Logger log = Logger.getLogger(this.getClass());
	private int rowCount = 10;
	private int pageCount = 10;
	
	@Resource
	private NoticeService noticeService;
	
	@ModelAttribute
	public NoticeVO initCommand() {
		return new NoticeVO();
	}
	
	//목록
	@RequestMapping("/notice/list.do")
	public ModelAndView process(@RequestParam(value="pageNum",defaultValue="1") int currentPage,
								@RequestParam(value="keyfield",defaultValue="") String keyfield,
								@RequestParam(value="keyword",defaultValue="") String keyword) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);
		
		//게시판의 총 레코드 수 또는 검색 레코드 수 반환
		int count = noticeService.selectRowCount(map);
		
		if(log.isDebugEnabled()) {
			log.debug("<<count>> : " + count);
		}
		
		//페이징처리
		PagingUtil page = new PagingUtil(keyfield,keyword,currentPage,count,rowCount,pageCount,"list.do");
		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());
		
		List<NoticeVO> list = null;
		if(count > 0) {
			list = noticeService.selectList(map);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("noticeList");
		mav.addObject("count", count);
		mav.addObject("list",list);
		mav.addObject("pagingHtml",page.getPagingHtml());
		
		return mav;
	}
	
	//글쓰기
	@RequestMapping(value="/notice/write.do",method=RequestMethod.GET)
	public String form() {
		
		return "noticeWrite";
	}
	
	//글쓰기 처리
	@RequestMapping(value="/notice/write.do",method=RequestMethod.POST)
	public String submit(@Valid NoticeVO noticeVO, BindingResult result, 
								HttpServletRequest request, HttpSession session) {
		
		if(log.isDebugEnabled()) {
			log.debug("<<NoticeVO>> : " + noticeVO);
		}
		
		//유효성 체크 결과 에러가 있으면 폼을 호출
		if(result.hasErrors()) {
			return "noticeWrite";
		}
		
		//mem_num 반환
		noticeVO.setMem_num((Integer)session.getAttribute("user_num"));

		//mem_auth 반환
		noticeVO.setMem_auth((Integer)session.getAttribute("user_auth"));
		
		//글 등록
		noticeService.insert(noticeVO);
		
		return "redirect:/notice/list.do";
	}
	
	//글 상세
	@RequestMapping("/notice/detail.do")
	public ModelAndView process(@RequestParam("nt_num") int nt_num) {
		
		//로그 표시
		if(log.isDebugEnabled()) {
			log.debug("<<num>> : " + nt_num);
		}
		
		//조회수 증가
		noticeService.updateHit(nt_num);
		
		NoticeVO notice = noticeService.selectNotice(nt_num);
		
								 //  뷰 이름  , 속성명   , 속성값
		return new ModelAndView("noticeView","notice",notice);
	}
	
	//이미지 처리
	@RequestMapping("/notice/imageView.do")
	public ModelAndView viewImage(@RequestParam("nt_num") int nt_num) {
		
		NoticeVO notice = noticeService.selectNotice(nt_num);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("imageView");
		
		mav.addObject("imageFile", notice.getNt_img());
		mav.addObject("filename", notice.getNt_imgname());
		
		return mav;
	}
	
	//파일 다운로드
	@RequestMapping("/notice/file.do")
	public ModelAndView download(@RequestParam("nt_num") int nt_num) {
		
		NoticeVO notice = noticeService.selectNotice(nt_num);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("downloadView");
		
		//파일 정보
		mav.addObject("downloadFile", notice.getNt_file());
		mav.addObject("filename", notice.getNt_filename());
		
		return mav;	
	}
	

	
	//글 수정 폼 호출
	@RequestMapping(value="/notice/update.do",method=RequestMethod.GET)
	public String form(@RequestParam("nt_num") int nt_num, Model model) {
		
		NoticeVO noticeVO = noticeService.selectNotice(nt_num);
		
		model.addAttribute("noticeVO", noticeVO);
		
		return "noticeModify";
	}
	
	//글 수정 처리
	@RequestMapping(value="/notice/update.do",method=RequestMethod.POST)
	public String submitUpdate(@Valid NoticeVO noticeVO, BindingResult result, HttpServletRequest request) {
		
		//로그표시
		if(log.isDebugEnabled()) {
			log.debug("<<NoticeVO>> : " + noticeVO);
		}
		
		//유효성 체크 결과 에러가 있으면 폼 호출
		if(result.hasErrors()) {
			return "noticeModify";
		}
		
		//글 수정
		noticeService.update(noticeVO);
		
		return "redirect:/notice/list.do";
	}
	
	//글 삭제  
	@RequestMapping("/notice/delete.do")
	public String submit(@RequestParam("nt_num")int nt_num) {
		
		//로그 표시
		if(log.isDebugEnabled()) {
			log.debug("<<nt_num>> : " + nt_num);
		}
		
		//글 삭제
		noticeService.deleteNotice(nt_num);
		
		return "redirect:/notice/list.do";
	}
}