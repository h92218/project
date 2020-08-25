package kr.spring.manage.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Update;

import kr.spring.manage.domain.ManageMemberVO;

public interface ManageMemberMapper {
	public List<ManageMemberVO> selectList(Map<String,Object> map);
	public int selectRowCount(Map<String,Object> map);
	public ManageMemberVO modifyList(Integer num);
	@Update("update member set mem_auth=#{mem_auth} where mem_num=#{mem_num}")
	public void updateMembership(Map<String,Object> map);
	@Update("update member_detail set detail_point=#{detail_point} where mem_num=#{mem_num}")
	public void updatePoint(Map<String,Object> map);
}
