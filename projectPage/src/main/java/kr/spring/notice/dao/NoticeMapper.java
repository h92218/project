package kr.spring.notice.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.notice.domain.NoticeVO;

public interface NoticeMapper {
	public List<NoticeVO> selectList(Map<String,Object> map); //BoardMapper.xml에서 작업
	public int selectRowCount(Map<String,Object> map); //BoardMapper.xml에서 작업
	@Insert("INSERT INTO notice (nt_num,mem_num,nt_title,nt_content,nt_img,nt_imgname,nt_datetime,nt_hit,nt_filename,nt_file,nt_category) VALUES (notice_seq.nextval,#{mem_num},#{nt_title},#{nt_content},#{nt_img},#{nt_imgname},SYSDATE,#{nt_hit},#{nt_filename},#{nt_file},#{nt_category})")
	public void insert(NoticeVO notice);
	@Select("SELECT * FROM notice b JOIN member m ON b.mem_num=m.mem_num WHERE b.nt_num=#{nt_num}")
	public NoticeVO selectNotice(Integer nt_num);
	@Update("UPDATE notice SET nt_hit=nt_hit+1 WHERE nt_num=#{nt_num}")
	public void updateHit(Integer nt_num);
	public void update(NoticeVO notice);
	@Delete("DELETE FROM notice WHERE nt_num=#{nt_num}")
	public boolean deleteNotice(Integer nt_num);
}
