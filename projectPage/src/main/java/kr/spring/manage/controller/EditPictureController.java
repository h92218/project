package kr.spring.manage.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.servlet.ModelAndView;

import kr.spring.manage.domain.EditMainPictureVO;
import kr.spring.manage.service.EditMainPictureService;

@Controller
public class EditPictureController {

	@Value("${file_path}")
	private String path;
	
	@Resource
	private EditMainPictureService editMainPictureService;
	
	private Logger log = Logger.getLogger(this.getClass());
	
	//편집 페이지
	@RequestMapping("/main/EditPicture.do")
	public ModelAndView editpicture() {	
		ModelAndView mav = new ModelAndView();
		EditMainPictureVO editMainPictureVO = editMainPictureService.select1();
		
		mav.setViewName("EditPicture");
		mav.addObject("editMainPictureVO",editMainPictureVO);
	
		return mav;
	}
	
	
	//파일로 올리는 경우 사진을 DB에 등록 처리 
	@RequestMapping("/main/pic_process.do")
	public String pic_process(EditMainPictureVO editMainPictureVO) {
		
		//사진등록
		editMainPictureService.update(editMainPictureVO);
		
		return "redirect:/main/main.do";
		
	}
	
	//첫번째 사진및 텍스트 표시 처리 
	@RequestMapping("/main/pic_view1.do")
	public ModelAndView pic_view1() {
	
		EditMainPictureVO editMainPictureVO1 = editMainPictureService.select1();
		ModelAndView mav1 = new ModelAndView();
		
		mav1.setViewName("imageView");
		mav1.addObject("imageFile",editMainPictureVO1.getImage());
		mav1.addObject("filename",editMainPictureVO1.getFilename());
		
		if(log.isDebugEnabled()) {
			log.debug("텍스트 표시 로그 : " +editMainPictureVO1.getText1()+ editMainPictureVO1.getText2());
		}
		return mav1;
	}
	
	//두번째 사진 표시 처리 
	@RequestMapping("/main/pic_view2.do")
	public ModelAndView pic_view2() {
	
		EditMainPictureVO editMainPictureVO2 = editMainPictureService.select2();
		ModelAndView mav2 = new ModelAndView();
		
		mav2.setViewName("imageView");
		mav2.addObject("imageFile",editMainPictureVO2.getImage());
		mav2.addObject("filename",editMainPictureVO2.getFilename());
		
		if(log.isDebugEnabled()) {
			log.debug("파일파일이름 " + editMainPictureVO2.getFilename() + " 파일파일 " + editMainPictureVO2.getImage());
		}
		return mav2;
	}
	
	//세번째 사진 표시 처리 
	@RequestMapping("/main/pic_view3.do")
	public ModelAndView pic_view3() {
	
		EditMainPictureVO editMainPictureVO3 = editMainPictureService.select3();
		ModelAndView mav3 = new ModelAndView();
		
		mav3.setViewName("imageView");
		mav3.addObject("imageFile",editMainPictureVO3.getImage());
		mav3.addObject("filename",editMainPictureVO3.getFilename());
		
		if(log.isDebugEnabled()) {
			log.debug("파일파일이름 " + editMainPictureVO3.getFilename() + " 파일파일 " + editMainPictureVO3.getImage());
		}
		return mav3;
	}
	
	//네번째 사진 표시 처리 
	@RequestMapping("/main/pic_view4.do")
	public ModelAndView pic_view4() {
	
		EditMainPictureVO editMainPictureVO4 = editMainPictureService.select4();
		ModelAndView mav4 = new ModelAndView();
		
		mav4.setViewName("imageView");
		mav4.addObject("imageFile",editMainPictureVO4.getImage());
		mav4.addObject("filename",editMainPictureVO4.getFilename());
		
		if(log.isDebugEnabled()) {
			log.debug("파일파일이름 " + editMainPictureVO4.getFilename() + " 파일파일 " + editMainPictureVO4.getImage());
		}
		return mav4;
	}
	
	
	
	//사진 url 처리
	@RequestMapping("/main/url_process.do")
	public String pic_url(String filename,String picture_order) {
		
		if(log.isDebugEnabled()) {
			log.debug("파일파일이름  : " + filename + " 몇번째 파일 :  " + picture_order);
		}
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("filename", filename);
		map.put("picture_order", picture_order);
		
		//DB에 url 등록
		editMainPictureService.update_url(map);
			
		return "redirect:/main/main.do";
	}
	
	//url로 올리는 경우 미리보기
	@RequestMapping("/main/url_preview.do")
	public ModelAndView url_preview(String filename,String picture_order) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("manager/url_preview");
		mav.addObject("filename",filename);
		mav.addObject("picture_order",picture_order);
		
		return mav;
	}
	
	//파일로 올리는 경우 미리보기
	@RequestMapping("/main/pic_preview.do")
	public String pic_preview(EditMainPictureVO editMainPictureVO) throws IllegalStateException, IOException {
		
		
		//파일업로드
		File file=new File(path+"/"+editMainPictureVO.getPic_upload().getOriginalFilename());
		editMainPictureVO.getPic_upload().transferTo(file);
		

		return 	"manager/pic_preview";
	}
	
	//텍스트 편집 미리보기
	@RequestMapping("/main/text_preview.do")
	public ModelAndView text_preview(String text1,String text2) {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("manager/text_preview");
		mav.addObject("text1",text1);
		mav.addObject("text2",text2);
		
		return mav;
	}
	
	//텍스트 DB업데이트 처리
	@RequestMapping("/main/text_process.do")
	public String text_process(String text1,String text2,int picture_order) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("picture_order", picture_order);
		map.put("text1",text1);
		map.put("text2",text2);
		
		editMainPictureService.updateText1(map);
		editMainPictureService.updateText2(map);
		
		
		return "redirect:/main/main.do";
	}
	
	
}
