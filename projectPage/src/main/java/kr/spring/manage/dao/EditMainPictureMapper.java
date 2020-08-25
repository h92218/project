package kr.spring.manage.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.manage.domain.EditMainPictureVO;

public interface EditMainPictureMapper {

	public void update(EditMainPictureVO editMainPictureVO);
	public void update_url(Map<String,Object> map);
	@Select("select * from main_picture where picture_order='1'")
	public EditMainPictureVO select1();
	@Select("select * from main_picture where picture_order='2'")
	public EditMainPictureVO select2();
	@Select("select * from main_picture where picture_order='3'")
	public EditMainPictureVO select3();
	@Select("select * from main_picture where picture_order='4'")
	public EditMainPictureVO select4();
	@Update("update main_picture set text1=#{text1} where picture_order=#{picture_order}")
	public void updateText1(Map<String,Object> map);
	@Update("update main_picture set text2=#{text2} where picture_order=#{picture_order}")
	public void updateText2(Map<String,Object> map);
	
}
