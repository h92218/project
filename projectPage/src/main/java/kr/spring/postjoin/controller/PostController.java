package kr.spring.postjoin.controller;

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

import kr.spring.postjoin.domain.PostVO;
import kr.spring.postjoin.service.PostService;
import kr.spring.util.PagingUtil;

//Post
@Controller
public class PostController {

	@Resource
	private PostService postService;

	private Logger log = Logger.getLogger(this.getClass());
	private int rowCount = 10;
	private int pageCount = 10;

	@ModelAttribute
	public PostVO initCommand() {
		return new PostVO();
	}
	
	//목록1
	@RequestMapping("/post/post.do")
	public ModelAndView  processlist1(@RequestParam(value="pageNum",defaultValue="1") int currentpage,
			@RequestParam(value="keyfield",defaultValue="")String keyfield,
			@RequestParam(value="keyword",defaultValue="")String keyword) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyfield", keyfield);
		map.put("keyword",keyword);

		int count = postService.selectRowCount(map);

		if(log.isDebugEnabled())  {
			log.debug("<<count>>" + count);
		}

		PagingUtil page  = new PagingUtil(keyfield,
				keyword,
				currentpage
				,count,
				rowCount,
				pageCount,
				"post.do");

		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());

		List<PostVO> list = null;
		if(count >0) {
			list = postService.selectPostList(map);
		}

		ModelAndView mav = new ModelAndView();
		mav.setViewName("post");
		mav.addObject("count",count);
		mav.addObject("list",list);
		mav.addObject("pagingHtml",page.getPagingHtml());

		return mav;
	}
	//목록2
	@RequestMapping("/post/postlist.do")
	public ModelAndView  processlist2(@RequestParam(value="pageNum",defaultValue="1") int currentpage,
			@RequestParam(value="keyfield",defaultValue="")String keyfield,
			@RequestParam(value="keyword",defaultValue="")String keyword) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyfield", keyfield);
		map.put("keyword",keyword);

		int count = postService.selectRowCount(map);

		if(log.isDebugEnabled())  {
			log.debug("<<count>>" + count);
		}

		PagingUtil page  = new PagingUtil(keyfield,
				keyword,
				currentpage
				,count,
				rowCount,
				pageCount,
				"postlist.do");

		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());

		List<PostVO> list = null;
		if(count >0) {
			list = postService.selectPostList(map);
		}

		ModelAndView mav = new ModelAndView();
		mav.setViewName("postlist");
		mav.addObject("count",count);
		mav.addObject("list",list);
		mav.addObject("pagingHtml",page.getPagingHtml());

		return mav;
	}

	//목록3
	@RequestMapping("/post/postphoto.do")
	public ModelAndView  processlist3(@RequestParam(value="pageNum",defaultValue="1") int currentpage,
			@RequestParam(value="keyfield",defaultValue="")String keyfield,
			@RequestParam(value="keyword",defaultValue="")String keyword) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyfield", keyfield);
		map.put("keyword",keyword);

		int count = postService.selectRowCount(map);

		if(log.isDebugEnabled())  {
			log.debug("<<count>>" + count);
		}

		PagingUtil page  = new PagingUtil(keyfield,
				keyword,
				currentpage
				,count,
				rowCount,
				pageCount,
				"postphoto.do");

		map.put("start", page.getStartCount());
		map.put("end", page.getEndCount());

		List<PostVO> list = null;
		if(count >0) {
			list = postService.selectPostList(map);
		}

		ModelAndView mav = new ModelAndView();
		mav.setViewName("postphoto");
		mav.addObject("count",count);
		mav.addObject("list",list);
		mav.addObject("pagingHtml",page.getPagingHtml());

		return mav;
	}



	//글쓰기
	@RequestMapping(value="/post/postwrite.do",method=RequestMethod.GET)
	public String form() {
		
		return "postwrite";
	}

	//글쓰기 처리
	@RequestMapping(value="/post/postwrite.do",method=RequestMethod.POST)
	public String submit(@Valid PostVO postVO, BindingResult result, HttpSession session) {

		if(log.isDebugEnabled()) {
			log.debug("<<PostVO>> : " + postVO);
		}
		//유효성 체크 결과 에러가 있으면 폼을 호출
		if(result.hasErrors()) {
			return "postwrite";
		}
		//mem_num 반환
		postVO.setMem_num((Integer)session.getAttribute("user_num"));
		
		//글 등록
		postService.insertPost(postVO);

		return "redirect:/post/postlist.do";
	}

	//글 상세
	@RequestMapping("/post/postdetail.do")
	public ModelAndView process(@RequestParam("num") int num,HttpSession session) {

		//로그 표시
		if(log.isDebugEnabled()) {
			log.debug("<<num>> " + num);
		}

		//조회수 증가
		postService.updatePostHit(num);
		
		PostVO post = postService.selectPost(num);
		
		session.getAttribute("user_auth");
		
		//내용 띄어쓰기 허용
		post.setPost_board(post.getPost_board().replace("\n", "<br>"));
		

		return new ModelAndView("postView","post",post);
	}
	
	//이미지 처리
		@RequestMapping("/post/imageView.do")
		public ModelAndView viewImage(@RequestParam("post_num")int post_num) {
			
			PostVO post = postService.selectPost(post_num);
			
			ModelAndView mav = new ModelAndView();
			mav.setViewName("imageView");
			mav.addObject("imageFile",post.getPost_img());
			mav.addObject("filename",post.getPost_imgname());
			
			return mav;
		}
		
		//글 수정
		@RequestMapping(value="/post/postupdate.do", method=RequestMethod.GET)
		public String form(@RequestParam("num")int num, Model model) {

			PostVO postVO = postService.selectPost(num);

			model.addAttribute("postVO",postVO);

			return "postupdate";
		}
		//글 수정 처리
		@RequestMapping(value="post/postupdate.do", method=RequestMethod.POST)
		public String submitUpdate(@Valid PostVO postVO,
				BindingResult result,
				HttpServletRequest request) {

			//로그 표시
			if(log.isDebugEnabled()) {
				log.debug("<<PostVO>> : " + postVO);
			}

			//유효성 체크결과 에러가 있으면 폼
			if(result.hasErrors()) {
				return "postupdate";
			}
			postService.updatePost(postVO);

			return "redirect:/post/postlist.do";

		}

		//글 삭제 처리
		@RequestMapping(value="/post/postdelete.do")
		public String submit(@RequestParam("num")int num) {

			if(log.isDebugEnabled()) {
				log.debug("<<PostVO>>" + num);
			}

			postService.deletePost(num);

			return "redirect:/post/postlist.do";
		}
}
