package kr.spring.manage.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.manage.dao.EditMainPictureMapper;

import kr.spring.manage.domain.EditMainPictureVO;

@Service("EditMainPictureService")
public class EditMainPictureServiceImpl implements EditMainPictureService{

	@Resource
	EditMainPictureMapper editMainPictureMapper;
	

	@Override
	public void update(EditMainPictureVO editMainPictureVO) {
		editMainPictureMapper.update(editMainPictureVO);
	}
	
	@Override
	public void update_url(Map<String,Object> map) {
		editMainPictureMapper.update_url(map);
	}

	@Override
	public EditMainPictureVO select1() {
		return editMainPictureMapper.select1();
	}

	@Override
	public EditMainPictureVO select2() {
		return editMainPictureMapper.select2();
	}

	@Override
	public EditMainPictureVO select3() {
		return editMainPictureMapper.select3();
	}

	@Override
	public EditMainPictureVO select4() {
		return editMainPictureMapper.select4();
	}

	@Override
	public void updateText1(Map<String,Object> map) {
		editMainPictureMapper.updateText1(map);
	
	}

	@Override
	public void updateText2(Map<String,Object> map) {
		editMainPictureMapper.updateText2(map);
	
	}

	
	
	
}
