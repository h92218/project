package kr.spring.member.naver;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.model.OAuth2AccessToken;

import kr.spring.member.domain.MemberVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class NaverLoginController {

	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	//로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/mypage/naver_login.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {
		
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);
		
		//네이버 
		model.addAttribute("url", naverAuthUrl);

		/* 생성한 인증 URL을 View로 전달 */
		return "mypage/naver_login";
	}

	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/mypage/callback.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException {
		System.out.println("여기는 callback");
		OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
        //로그인 사용자 정보를 읽어온다.
	    apiResult = naverLoginBO.getUserProfile(oauthToken);
		model.addAttribute("result", apiResult);

		ObjectMapper objectMapper = new ObjectMapper();
		NaverLoginVO naverLoginCommand = objectMapper.readValue(apiResult, NaverLoginVO.class);
		
		System.out.println("<<전송된 데이터>> : " + naverLoginCommand);
		System.out.println("<<oauth_state>> : " + session.getAttribute("oauth_state"));
		
		MemberVO member = new MemberVO();
		member.setMem_id(naverLoginCommand.getResponse().getId());
		member.setMem_auth(5);//소셜 로그인 대상자는 5번
		
		session.setAttribute("user_id", member.getMem_id());
		session.setAttribute("user_auth", member.getMem_auth());
		session.setAttribute("oauthToken", oauthToken);
		
        /* 네이버 로그인 성공 페이지 View 호출 */
		return "mypage/naverSuccess";
	}
		
}