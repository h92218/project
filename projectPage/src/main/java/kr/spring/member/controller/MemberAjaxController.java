package kr.spring.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.member.domain.MemberVO;
import kr.spring.member.service.MemberService;

@Controller
public class MemberAjaxController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	private MemberService memberService;
	
	//아이디 중복체크
	@RequestMapping("/mypage/confirmId.do")
	@ResponseBody
	public Map<String, String> process(@RequestParam String mem_id){
		
		//로그 표시
		if(log.isDebugEnabled()) {
			log.debug("<<id>> : " + mem_id);
		}
		
		Map<String, String> map = new HashMap<String, String>();
		
		MemberVO member = memberService.selectCheckMember(mem_id);
		
		if(member!=null) {
			//아이디 중복
			map.put("result", "idDuplicated");
		}else{
			//아이디 미중복
			map.put("result", "idNotFound");
		}
		return map;
	}
	
	//로그인 처리
	@RequestMapping("/main/mainLogin.do")
	@ResponseBody
	public Map<String, String> loginProcess(@RequestParam("mem_id1") String userId,
											@RequestParam("detail_passwd1") String userPasswd,
											HttpSession session){
		
		Map<String, String> map = new HashMap<String, String>();
		
		MemberVO member = memberService.selectCheckMember(userId);
		
		if(log.isDebugEnabled()) {
			log.debug("<<MemberVO>> : " + userId + userPasswd);
		}
		try {
		if(member.isCheckedId(userId) && member.isCheckedPasswd(userPasswd)) {
			map.put("result", "Check");
			session.setAttribute("user_id", member.getMem_id());
			session.setAttribute("user_num", member.getMem_num());
			session.setAttribute("user_auth", member.getMem_auth());
			
		}else if(userId == null && userPasswd == null){
			map.put("result", "NotCheck");
		}else if(userId == null) {
			map.put("result", "NotCheck");
		}else if(userPasswd == null) {
			map.put("result", "NotCheck");
		}
		}catch(NullPointerException e) {
			map.put("result", "emptyCheck");
		}
		
		return map;
	}
	
	//비밀번호 찾기(아이디 존재여부 확인)
	@RequestMapping("/mypage/findPasswdid.do")
	@ResponseBody
	public Map<String, String> findIdProcess(@RequestParam String id){
		
		Map<String, String> map = new HashMap<String, String>();
		
		MemberVO member = memberService.selectCheckMember(id);
		
		if(member!=null) {
			map.put("result", "idDuplicated");
		}else {
			map.put("result", "idNotFound");
		}
		return map;
	}
	
	
	
}
