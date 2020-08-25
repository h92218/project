package kr.spring.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.manage.service.ManageMemberService;
import kr.spring.member.domain.MemberVO;
import kr.spring.member.service.MemberService;

//회원 정보입니다.
@Controller
public class MemberController {
	
	@Resource
	MemberService memberService;
	@Resource
	ManageMemberService manageMemberService;
	
	//자바빈 초기화
	@ModelAttribute
	public MemberVO initCommand() {
		return new MemberVO();
	}
	
	//장소찾기 폼 호출
	@RequestMapping("/mypage/local.do")
	public String localForm() {
		return "local";
	}
	
	//회원가입 폼 호출
	@RequestMapping(value="/mypage/register.do", method=RequestMethod.GET)
	public String Registerform() {
		return "register";
	}
	
	//회원 가입 처리
	@RequestMapping(value="/mypage/register.do", method=RequestMethod.POST)
	public String submit(@Valid MemberVO memberVO, BindingResult result) {
		
		//유효성 체크 결과 에러가 있으면 폼 호출
		if(result.hasErrors()) {
			return Registerform();
		}
		
		//회원가입
		memberService.insert(memberVO);
		return "redirect:/main/main.do";
	}
	
	//로그인처리 ajax 방식으로 처리함
	
	//로그아웃
	@RequestMapping("/main/logout.do")
	public String processLogout(HttpSession session) {

		session.invalidate();

		return "redirect:/main/main.do";
	}
	
	//회원 정보입네다 동무
	@RequestMapping("/mypage/myPage.do")
	public String detailProcess(HttpSession session, Model model) {
		
		int mem_num = (Integer)session.getAttribute("user_num");
		MemberVO member = memberService.selectMember(mem_num);
		
		model.addAttribute("member",member);
		
		return "myPage";
		
	}
	//포인트
	@RequestMapping("/mypage/point.do")
	public String pointProcess(HttpSession session, Model model) {
		
		int mem_num = (Integer)session.getAttribute("user_num");
		MemberVO member = memberService.selectMember(mem_num);
		
		//회원 정보 불러오면 auth와 point 체크하여 point에 맞춰 등급 자동 조정 DB업데이트
		Map<String,Object> updatemap = new HashMap<String,Object>();
		int mem_auth;
		int detail_point;
		updatemap.put("mem_num", mem_num);
		
		mem_auth=member.getMem_auth();
		detail_point=member.getDetail_point();
		
		if(mem_auth==3 && detail_point<5000) {
			updatemap.put("mem_auth", 2);
		}
		else if(mem_auth==2 && detail_point>=5000) {
			updatemap.put("mem_auth", 3);
		}else {
			updatemap.put("mem_auth", mem_auth);
		}
		
		manageMemberService.updateMembership(updatemap);
		
		//업데이트 된 내용 다시불러오기
		member = memberService.selectMember(mem_num);
		
		model.addAttribute("member", member);
		
		return "point";
	}
	
	//이미지 처리
	@RequestMapping("/mypage/imageView.do")
	public ModelAndView viewImage(@RequestParam("mem_num") int mem_num) {
		
		MemberVO member = memberService.selectMember(mem_num);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("imageView");
		
		mav.addObject("imageFile",member.getImage());
		
		mav.addObject("filename",member.getDetail_img());
		
		return mav;
	}
	
	//회원 정보 수정 폼 호출
	@RequestMapping(value="/mypage/update.do", method=RequestMethod.GET)
	public String formUpdate(HttpSession session, Model model) {
		
		//세션에 저장되어있는 mem_num 반환
		int mem_num = (Integer)session.getAttribute("user_num");
		
		MemberVO memberVO = memberService.selectMember(mem_num);
		
		model.addAttribute("memberVO",memberVO);
		
		return "modify";
	}
	
	//회원 정보 수정
	@RequestMapping(value="/mypage/update.do", method=RequestMethod.POST)
	public String update(MemberVO memberVO, HttpServletRequest request) {
		try {
			memberService.update(memberVO);
		}catch(Exception e) {
			return "modify";
		}
		
		
		return "redirect:/mypage/myPage.do";
		
	}
	//회원 탈퇴 폼
	@RequestMapping(value="/mypage/delete.do", method=RequestMethod.GET)
	public String deleteForm(HttpSession session, Model model) {
		
		int mem_num = (Integer)session.getAttribute("user_num");
		MemberVO memberVO = new MemberVO();
		memberVO.setMem_num(mem_num);
		
		model.addAttribute("memberVO",memberVO);
		
		return "memberDelete";
	}
	//회원탈퇴
	@RequestMapping(value="/mypage/delete.do", method=RequestMethod.POST)
	public String delete(HttpSession session) {
		
		int mem_num = (Integer)session.getAttribute("user_num");
		memberService.delete(mem_num);
		
		//로그아웃
		session.invalidate();
		
		return "redirect:/main/main.do";
	}
		
}
