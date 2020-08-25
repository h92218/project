package kr.spring.main.controller;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.club.domain.ClubVO;
import kr.spring.club.service.ClubService;
import kr.spring.manage.domain.EditMainPictureVO;
import kr.spring.manage.service.EditMainPictureService;

//main!
@Controller
public class MainController {
	private Logger log = Logger.getLogger(this.getClass());
	@Resource
	private ClubService clubService;
	@Resource
	private EditMainPictureService editMainPictureService;


	//메인페이지
	@RequestMapping("/main/main.do")
	public ModelAndView process2() {

		int count = clubService.listRowCount();

		List<ClubVO> list = null;

		if(count>0) {
			list = clubService.mainList();
		}

		//메인 이미지 url 가져오기 //파일 표시는 EditMainPictureController에서 함 
		EditMainPictureVO editMainPictureVO1 = new EditMainPictureVO();
		EditMainPictureVO editMainPictureVO2 = new EditMainPictureVO();
		EditMainPictureVO editMainPictureVO3 = new EditMainPictureVO();
		EditMainPictureVO editMainPictureVO4 = new EditMainPictureVO();


		editMainPictureVO1 = editMainPictureService.select1();
		editMainPictureVO2 = editMainPictureService.select2();
		editMainPictureVO3 = editMainPictureService.select3();
		editMainPictureVO4 = editMainPictureService.select4();

		if(log.isDebugEnabled()) {
			log.debug("파일파일 " + editMainPictureVO1.getFilename());
		}

		ModelAndView mav = new ModelAndView();
		mav.setViewName("main");
		mav.addObject("count",count);
		mav.addObject("list",list);
		mav.addObject("editMainPictureVO1",editMainPictureVO1);
		mav.addObject("editMainPictureVO2",editMainPictureVO2);
		mav.addObject("editMainPictureVO3",editMainPictureVO3);
		mav.addObject("editMainPictureVO4",editMainPictureVO4);
		
		return mav;
	}

	//모바일용 메인페이지
	@RequestMapping("/main/mobileMain.do")
	public ModelAndView process3() {

		int count = clubService.listRowCount();

		List<ClubVO> list = null;

		if(count>0) {
			list = clubService.mainList();
		}

		//메인 이미지 url 가져오기 //파일 표시는 EditMainPictureController에서 함 
		EditMainPictureVO editMainPictureVO1 = new EditMainPictureVO();
		EditMainPictureVO editMainPictureVO2 = new EditMainPictureVO();
		EditMainPictureVO editMainPictureVO3 = new EditMainPictureVO();
		EditMainPictureVO editMainPictureVO4 = new EditMainPictureVO();


		editMainPictureVO1 = editMainPictureService.select1();
		editMainPictureVO2 = editMainPictureService.select2();
		editMainPictureVO3 = editMainPictureService.select3();
		editMainPictureVO4 = editMainPictureService.select4();

		if(log.isDebugEnabled()) {
			log.debug("파일파일 " + editMainPictureVO1.getFilename());
		}

		ModelAndView mav = new ModelAndView();
		mav.setViewName("mobileMain");
		mav.addObject("count",count);
		mav.addObject("list",list);
		mav.addObject("editMainPictureVO1",editMainPictureVO1);
		mav.addObject("editMainPictureVO2",editMainPictureVO2);
		mav.addObject("editMainPictureVO3",editMainPictureVO3);
		mav.addObject("editMainPictureVO4",editMainPictureVO4);

		return mav;
	}

	//	@RequestMapping(value="/ClubQA/QAmainForm.do", method=RequestMethod.GET)
	//	public String QAform() {
	//		return "QAmain";
	//	}

	@RequestMapping("/main/introduce.do")
	public String introduce() {
		return "introduce";
	}


}
