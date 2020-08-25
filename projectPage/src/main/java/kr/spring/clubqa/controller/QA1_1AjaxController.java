package kr.spring.clubqa.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.clubqa.domain.ClubQAReplyVO;
import kr.spring.clubqa.service.ClubQAService;
import kr.spring.util.PagingUtil;

@Controller
public class QA1_1AjaxController {
	
	private Logger log = Logger.getLogger(this.getClass());
	private int rowCount = 10;
	private int pageCount = 10;

	@Resource
	private ClubQAService clubQAService;
	
	//질문 게시판 댓글 등록
			@RequestMapping("/ClubQA/QA1_1/writeReply.do")
			@ResponseBody
			public Map<String,String> writeReply1_1(
					ClubQAReplyVO clubQAReplyVO,
					HttpSession session,
					HttpServletRequest request){

				if(log.isDebugEnabled()) {
					log.debug("<<ClubQAReplyVO>> : " + 
							clubQAReplyVO);
				}

				Map<String,String> map = 
						new HashMap<String,String>();
				
				Integer user_num = 
						(Integer)session.getAttribute("user_num");
				if(user_num==null) {
					//로그인 안 됨
					map.put("result", "logout");
				}else {
					
					//댓글 등록
					clubQAService.insert1_1Reply(clubQAReplyVO);
					map.put("result", "success");
				}

				return map;
			}
		
		//질문 게시판 댓글 목록 
			@RequestMapping("/ClubQA/QA1_1/listReply.do")
			@ResponseBody
			public Map<String,Object> getList1_1(
					@RequestParam(value="pageNum",defaultValue="1")
					int currentPage,
					@RequestParam(value="qa1_1num") int qa1_1num){
				if(log.isDebugEnabled()) {
					log.debug("<<currentPage>> : " + currentPage);
					log.debug("<<qa1_1num>> : " + qa1_1num);
				}

				Map<String,Object> map = 
						new HashMap<String,Object>();
				map.put("qa1_1num", qa1_1num);

				//총 글의 갯수
				int count = clubQAService.select1_1RowCountReply(map);

				PagingUtil page = new PagingUtil(currentPage,count,
						rowCount,pageCount,null);
				map.put("start", page.getStartCount());
				map.put("end", page.getEndCount());
				
				List<ClubQAReplyVO> list = null;
				if(count > 0) {
					list = clubQAService.select1_1ListReply(map);
				}else {
					list = Collections.emptyList();
				}

				Map<String,Object> mapJson = 
						new HashMap<String,Object>();
				mapJson.put("count", count);
				mapJson.put("rowCount", rowCount);
				mapJson.put("list", list);

				return mapJson;
			}
			
			
			//댓글 삭제
			@RequestMapping("/ClubQA/QA1_1/deleteReply.do")
			@ResponseBody
			public Map<String,String> deleteReply(
					@RequestParam("qa_reply_num") int qa_reply_num,
					@RequestParam("mem_num") int mem_num,
					HttpSession session){
		   
				if(log.isDebugEnabled()) {
					log.debug("<<qa_reply_num>> : " + qa_reply_num);
					log.debug("<<mem_num>> : " + mem_num);
				}

				Map<String,String> map = 
						new HashMap<String,String>();

				Integer user_num = 
						(Integer)session.getAttribute("user_num");
				if(user_num==null) {
					//로그인이 되어있지 않음
					map.put("result", "logout");
				}else if(user_num!=null && user_num==mem_num) {
					//로그인 되어 있고 로그인한 아이디와 작성자 아이디 일치
					clubQAService.deleteReply(qa_reply_num);
					map.put("result", "success");
				}else {
					//로그인 아이디와 작성자 아이디 불일치
					map.put("result", "wrongAccess");
				}		
				return map;
			}


}
