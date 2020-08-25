package kr.spring.manage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.manage.domain.ManageClubVO;
import kr.spring.manage.service.ManageClubService;
import kr.spring.util.PagingUtil;


@Controller
public class ManageClubController {
	private Logger log = Logger.getLogger(this.getClass());
	private int rowCount = 10;
	private int pageCount = 10;

	@Resource
	private ManageClubService manageClubService;

	//자바빈 초기화
	@ModelAttribute
	public ManageClubVO initCommand() {
		return new ManageClubVO();
	}

	//목록
	@RequestMapping("/main/manage_club.do")
	public ModelAndView process(
			@RequestParam(value="pageNum", defaultValue="1") int currentPage) {

		//목록의 총 레코드 수 또는 검색 레코드 수 반환
		int count1 = manageClubService.selectRowCount(1);
		int count2 = manageClubService.selectRowCount(2);
		int count3 = manageClubService.selectRowCount(3);
		
		Map<String,Object> map = new HashMap<String,Object>();
	
		List<ManageClubVO> list1 = null;
		PagingUtil page1 = new PagingUtil(currentPage,count1,rowCount,pageCount,"manage_club.do");
		map.put("start", page1.getStartCount());
		map.put("end", page1.getEndCount());
		list1 = manageClubService.selectList1(map);

		
		List<ManageClubVO> list2 = null;
		PagingUtil page2 = new PagingUtil(currentPage,count2,rowCount,pageCount,"manage_club.do");
		map.put("start", page2.getStartCount());
		map.put("end", page2.getEndCount());
		list2 = manageClubService.selectList2(map);
		
		
		List<ManageClubVO> list3 = null;
		PagingUtil page3 = new PagingUtil(currentPage,count3,rowCount,pageCount,"manage_club.do");
		map.put("start", page3.getStartCount());
		map.put("end", page3.getEndCount());
		list3 = manageClubService.selectList3(map);

	
		ModelAndView mav = new ModelAndView();
		mav.setViewName("manageClub");
		mav.addObject("count1", count1);
		mav.addObject("count2", count2);
		mav.addObject("count3", count3);
		mav.addObject("list1", list1);
		mav.addObject("list2", list2);
		mav.addObject("list3", list3);
		mav.addObject("pagingHtml1", page1.getPagingHtml());
		mav.addObject("pagingHtml2", page2.getPagingHtml());
		mav.addObject("pagingHtml3", page3.getPagingHtml());

		return mav;
	}
	
	//클럽 신청 글 상세보기
	@RequestMapping("/main/manageClubDetail.do")
	public ModelAndView ClubDetail(@RequestParam("num") int num) {
	
	ManageClubVO manageClub = manageClubService.selectClubRequest(num);
	manageClub.setClub_detail(manageClub.getClub_detail().replace("\n", "<br>"));
	ModelAndView mav = new ModelAndView();
	mav.setViewName("ClubDetail");
	mav.addObject("manageClub",manageClub);
	
	return mav;
	
}
	
	//클럽 신청글 상태 변경시
	@RequestMapping(value="/main/status_change.do", method=RequestMethod.POST)
	public String status(HttpServletRequest request) {
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("num", Integer.parseInt(request.getParameter("num")));
		map.put("select_status",Integer.parseInt(request.getParameter("select_status")));
		
		
		manageClubService.updateStatus(map);		
		
		return "status_change";
	}
	
	//이미지 표시
	@RequestMapping("/main/imageView1.do")
	public ModelAndView viewImage(@RequestParam("num") int num) {
		
		ManageClubVO manageClubVO = manageClubService.selectClubRequest(num);
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("imageView");
		mav.addObject("imageFile",manageClubVO.getClub_img());
		mav.addObject("filename",manageClubVO.getFilename());

		
		if(log.isDebugEnabled()) {
			log.debug("파일파일 " + manageClubVO.getFilename() + " 파일파일 " + manageClubVO.getClub_img());
		}
		
		return mav;
	}
	
	
	
}
