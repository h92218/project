package kr.spring.manage.service;

import java.util.Map;

import kr.spring.manage.domain.EditMainPictureVO;

public interface EditMainPictureService {
	public void update(EditMainPictureVO editMainPictureVO);
	public void update_url(Map<String,Object> map);
	public EditMainPictureVO select1();
	public EditMainPictureVO select2();
	public EditMainPictureVO select3();
	public EditMainPictureVO select4();
	public void updateText1(Map<String,Object> map);
	public void updateText2(Map<String,Object> map);
	
}
