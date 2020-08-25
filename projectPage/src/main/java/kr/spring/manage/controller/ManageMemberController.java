package kr.spring.manage.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import kr.spring.manage.domain.ManageMemberVO;
import kr.spring.manage.service.ManageMemberService;
import kr.spring.util.PagingUtil;

@Controller
public class ManageMemberController {
	private Logger log = Logger.getLogger(this.getClass());
	private int rowCount = 10;
	private int pageCount = 10;

	@Resource
	private ManageMemberService manageMemberService;

	//회원 목록 표시 
	@RequestMapping("/main/manage_member.do")
	public ModelAndView member(@RequestParam(value="pageNum", defaultValue="1") int currentPage,
						@RequestParam(value="keyfield", defaultValue="") String keyfield,
						@RequestParam(value="keyword", defaultValue="")	String keyword) {

		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyfield", keyfield);
		map.put("keyword", keyword);

		//게시판의 총 레코드 수 또는 검색 레코드 수 반환
		int count = manageMemberService.selectRowCount(map);
		
		//페이징 처리
		PagingUtil page = 
			new PagingUtil(keyfield,keyword,currentPage,count,rowCount,pageCount,"manage_member.do");
		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());
		
		List<ManageMemberVO> list1 = null; 
		list1 = manageMemberService.selectList(map); //불러오기 
		
		//회원 정보 불러와서 auth와 point 체크하여 point에 맞춰 등급 자동 조정
		Map<String,Object> updatemap = new HashMap<String,Object>();		
		int mem_auth;
		int detail_point;
		int mem_num;
		
		for(int i=0;i<list1.size();i++) {
			mem_auth=list1.get(i).getMem_auth();
			detail_point=list1.get(i).getDetail_point();
			mem_num=list1.get(i).getMem_num();
			
			updatemap.put("mem_num",mem_num);
			
			if(mem_auth==2 && detail_point>=5000) {
				updatemap.put("mem_auth",3);
			}
			else if(mem_auth==3 && detail_point<5000) {
				updatemap.put("mem_auth", 2);
			}
			else {
				updatemap.put("mem_auth",mem_auth);
			}
			manageMemberService.updateMembership(updatemap);//멤버등급 업데이트 
		}//for문 끝
		
		List<ManageMemberVO> list2 = null; 
		list2 = manageMemberService.selectList(map); // 업데이트 된 내역 다시 불러오기 
		
				
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("manageMember");
		mav.addObject("count",count);
		mav.addObject("list",list2);
		mav.addObject("pagingHtml",page.getPagingHtml());

		return mav;
	}
	
	//멤버 수정 폼 호출
	@RequestMapping(value="/main/modify_member.do", method=RequestMethod.POST)
	public ModelAndView modifyform(Integer[] mem_num) {
		if(log.isDebugEnabled()) {
			log.debug(mem_num);
		}
		
		List<ManageMemberVO> list  = new ArrayList<ManageMemberVO>();
		

		for(int i=0;i<mem_num.length;i++) {
		list.add(manageMemberService.modifyList(mem_num[i]));
	
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("modify_member");
		mav.addObject("list",list);
		
		return mav;
	}
	
	//멤버수정 처리
	@RequestMapping(value="/main/modify_process.do",method=RequestMethod.POST)
	public String modifyprocess(@RequestParam Integer[] mem_num,
									@RequestParam String[] mem_auth,
									@RequestParam Integer[] detail_point) {

	
		Map<String,Object> map1 = new HashMap<String,Object>(); 
		for(int i=0;i<mem_num.length;i++) {
		map1.put("mem_num",mem_num[i]);
		
		if(!(mem_auth[i].equals("0"))&&!(mem_auth[i].equals("1"))) { //일반회원, 우수회원의 포인트 변경 시 등급 자동변경 
			if(detail_point[i]>=0&&detail_point[i]<5000) {
				map1.put("mem_auth",2);
			}else if(detail_point[i]>=5000) {
				map1.put("mem_auth",3);	
			}	
		}else {
			map1.put("mem_auth",Integer.parseInt(mem_auth[i]));
					
			
		}
		manageMemberService.updateMembership(map1); //멤버 등급 업데이트
		
		if(log.isDebugEnabled()) {
			log.debug("세팅된 등급 : " + mem_auth[i]);
		}
		
		}
		
		
		
		Map<String,Object> map2 = new HashMap<String,Object>();
		for(int i=0;i<mem_num.length;i++) {
		map2.put("mem_num",mem_num[i]);
		map2.put("detail_point",detail_point[i]);
		manageMemberService.updatePoint(map2); //멤버 포인트 업데이트 
		}
		
		
		
		return "redirect:/main/manage_member.do";
	}
}
