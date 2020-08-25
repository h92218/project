package kr.spring.manage.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.manage.domain.ManageClubVO;



public interface ManageClubMapper {
	public List<ManageClubVO> selectList1(Map<String,Object> map);
	public List<ManageClubVO> selectList2(Map<String,Object> map);
	public List<ManageClubVO> selectList3(Map<String,Object> map);
	@Select("select count(*) from club where club_state=#{status}")
	public int selectRowCount(Integer status);
	@Select("select * from (select member.mem_id, club.* from member,club where member.mem_num=club.mem_num) where club_num=#{num}")
	public ManageClubVO selectClubRequest(Integer num);
	@Update("update club set club_state=#{select_status} where club_num=#{num}")
	public void updateStatus(Map<String,Integer> map);

}
