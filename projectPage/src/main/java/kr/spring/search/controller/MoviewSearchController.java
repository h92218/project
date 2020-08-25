package kr.spring.search.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.spring.search.domain.MovieVO;

@Controller
public class MoviewSearchController {
	
	private Logger log=Logger.getLogger(this.getClass());
	
	@ModelAttribute
	public MovieVO initCommand() {
		return new MovieVO();
	}
	
	//영화 검색 폼 호출
	@RequestMapping("/movieSearch/movieSearchForm.do")
	public String searchForm() {
		
		return "movieSearchForm";
	}
	@RequestMapping("/movieSearch/movieSearch.do")
	public String searchResult(@RequestParam String query, Model model) {
		
		System.out.println("~~~~~~~~~~~~~" + query);
		
		 String clientId = "ckosxB4b0PqkmuZC4yML"; //애플리케이션 클라이언트 아이디값"
	        String clientSecret = "98jHfmZJh6"; //애플리케이션 클라이언트 시크릿값"

	        String text = null;
	        try {
	            text = URLEncoder.encode(query, "UTF-8");
	        } catch (UnsupportedEncodingException e) {
	            throw new RuntimeException("검색어 인코딩 실패",e);
	        }

	        String apiURL = "https://openapi.naver.com/v1/search/movie.xml?query=" + text;    

	        Map<String, String> requestHeaders = new HashMap<String, String>();
	        requestHeaders.put("X-Naver-Client-Id", clientId);
	        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
	        List<MovieVO> list = SearchMethod.get(apiURL,requestHeaders);
	        model.addAttribute("list",list);
	        System.out.println(list);
	        
		return "movieSearchResult";
	}
}
