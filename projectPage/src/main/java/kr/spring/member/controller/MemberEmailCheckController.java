package kr.spring.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.member.domain.MemberVO;
import kr.spring.member.email.Email;
import kr.spring.member.email.EmailSender;
import kr.spring.member.service.MemberService;

@Controller
public class MemberEmailCheckController {

	private Logger log = Logger.getLogger(this.getClass());

	@Resource
	private EmailSender emailSender;
	@Resource
	private Email email;
	@Resource
	private MemberService memberService;
	
	//자바빈 초기화
	@ModelAttribute
	public MemberVO initCommand() {
		return new MemberVO();
	}
	
	//비밀번호 찾기 폼 호출
	@RequestMapping(value="mypage/findPasswd.do", method=RequestMethod.GET)
	public String findPasswdForm() {
		return "findPasswd";
	}
	//비밀번호 찾기
	@RequestMapping(value="mypage/findPasswd.do",method=RequestMethod.POST)
	public String findPasswd(MemberVO memberVO) throws Exception {
		
		MemberVO member = memberService.selectCheckMember(memberVO.getMem_id());
		if(member!=null && member.getDetail_email().equals(memberVO.getDetail_email())) {
			//기존 비밀번호를 임시 비밀번호로 변경
			String passwd = randomPassword(10);
			member.setDetail_passwd(passwd);
			//변경된 비밀번호를 데이터 베이스에 저장
			memberService.updateRandomPasswd(member);
			
			
			email.setContent("임시 비밀번호는 " + passwd +" 입니다.");
			email.setReceiver(member.getDetail_email());
			email.setSubject(member.getDetail_name()+" 님 비밀번호 찾기 메일입니다.");
			
			emailSender.sendEmail(email);
			
			return "redirect:/main/main.do";
			
		}else {
			
			return findPasswdForm();
			
		}
		
	}
	
	//이메일 인증번호 발송
	@RequestMapping(value="/mypage/emailcheck.do")
	@ResponseBody
	public Map<String,String> sendEmailAction(@RequestParam String name, @RequestParam String send_email, HttpSession session) throws Exception{

		if(log.isDebugEnabled()) {
			log.debug("<<전송된 정보>> : " + name + ", " + send_email);
		}
		
		
		Map<String, String> map = new HashMap<String, String>();

		if(name!=null && send_email!=null) {
			
			String checkedKey = randomPassword(10);

			email.setContent("인증 번호는 " + checkedKey +" 입니다.");
			email.setReceiver(send_email);
			email.setSubject(name+" 님 회원가입 인증번호 입니다.");

			if(log.isDebugEnabled()){
				log.debug("<<인증키>> : " +checkedKey);
			}

			emailSender.sendEmail(email);
			
			session.setAttribute("checkedKey", checkedKey);
			
			map.put("result", "success");
		}else {
			map.put("result", "failure");
		}
		
		return map;
		
	}
	
	
	@RequestMapping(value="/mypage/emailcodecheck.do")
	@ResponseBody
	public Map<String, String> checkEmailAction(@RequestParam String emailcode, HttpSession session){
		
		Map<String, String> map = new HashMap<String, String>();
		
		String checkedKey = (String)session.getAttribute("checkedKey");
		
		if(emailcode.equals(checkedKey)) {
			
			map.put("result", "good");
		}else {
			map.put("result", "fail");
		}
		
		return map;
	}
	

	//비밀번호 보안을 위한 난수 발생 메소드
	public String randomPassword(int length){
		int index = 0;
		char[] charSet = new char[]{
				'0','1','2','3','4','5','6','7','8','9'
				,'A','B','C','D','E','F','G','H','I','J','K','L','M'
				,'N','O','P','Q','R','S','T','U','V','W','X','Y','Z'
				,'a','b','c','d','e','f','g','h','i','h','k','l','m'
				,'n','o','p','q','r','s','t','u','v','w','x','y','z'
		};

		StringBuffer sb = new StringBuffer();

		for(int i=0;i<length;i++){
			index = (int)(charSet.length * Math.random());
			sb.append(charSet[index]);
		}

		return sb.toString();
	}
}
