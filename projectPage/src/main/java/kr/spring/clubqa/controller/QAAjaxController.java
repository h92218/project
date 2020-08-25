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
import kr.spring.clubqa.domain.ClubQAVO;
import kr.spring.clubqa.service.ClubQAService;
import kr.spring.member.domain.MemberVO;
import kr.spring.util.PagingUtil;

@Controller
public class QAAjaxController {
	private Logger log = Logger.getLogger(this.getClass());
	private int rowCount = 10;
	private int pageCount = 10;

	@Resource
	private ClubQAService clubQAService;

	//댓글 등록
	@RequestMapping("/ClubQA/QAlist/writeReply.do")
	@ResponseBody
	public Map<String,String> writeReply(
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
			clubQAService.insertReply(clubQAReplyVO);
			map.put("result", "success");
		}

		return map;
	}
	//댓글 목록 
	@RequestMapping("/ClubQA/QAlist/listReply.do")
	@ResponseBody
	public Map<String,Object> getList(
			@RequestParam(value="pageNum",defaultValue="1")
			int currentPage,
			@RequestParam("qa_num") int qa_num){
		if(log.isDebugEnabled()) {
			log.debug("<<currentPage>> : " + currentPage);
			log.debug("<<qa_num>> : " + qa_num);
		}

		Map<String,Object> map = 
				new HashMap<String,Object>();
		map.put("qa_num", qa_num);

		//총 글의 갯수
		int count = clubQAService.selectRowCountReply(map);

		PagingUtil page = new PagingUtil(currentPage,count,
				rowCount,pageCount,null);
		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());
		
		List<ClubQAReplyVO> list = null;
		if(count > 0) {
			list = clubQAService.selectListReply(map);
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
	@RequestMapping("/ClubQA/QAlist/deleteReply.do")
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
	//댓글 수정
	@RequestMapping("/ClubQA/QAlist/updateReply.do")
	@ResponseBody
	public Map<String,String> modifyReply(
			ClubQAReplyVO clubQAReplyVO,
			HttpSession session,
			HttpServletRequest request){

		if(log.isDebugEnabled()) {
			log.debug("<<boardReplyVO>> : " + 
					clubQAReplyVO);
		}

		Map<String,String> map = 
				new HashMap<String,String>();

		Integer user_num = 
				(Integer)session.getAttribute("user_num");
		if(user_num==null) {
			//로그인이 안 되어있는 경우
			map.put("result", "logout");
		}else if(user_num!=null && user_num==clubQAReplyVO.getMem_num()){
			//로그인 회원 번호와 작성자 회원번호 일치

			//댓글 수정
			clubQAService.updateReply(clubQAReplyVO);
			map.put("result", "success");
		}else {
			//로그인 아이디와 작성자 아이디 불일치
			map.put("result", "wrongAccess");
		}

		return map;
	}
}












