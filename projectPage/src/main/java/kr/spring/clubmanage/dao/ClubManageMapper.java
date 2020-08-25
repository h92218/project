package kr.spring.clubmanage.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.clubmanage.domain.ClubManageVO;

public interface ClubManageMapper {
	//dB에서 date를 해당 날짜의 00시00분00초로 인식함
	@Select("select * from joinclub j join club c on j.club_num=c.club_num where j.mem_num=#{mem_num} and c.club_end+1>=sysdate")
	public List<ClubManageVO> selectValidList(int mem_num);
	@Select("select * from joinclub j join club c on j.club_num=c.club_num where j.mem_num=#{mem_num} and c.club_end+1<sysdate")
	public List<ClubManageVO> selectPastList(int mem_num);
	@Select("select * from club where mem_num=#{mem_num} and club_end+1>=sysdate")
	public List<ClubManageVO> selectLeadersValidList(int mem_num);
	@Select("select * from club where mem_num=#{mem_num} and club_end+1<sysdate")
	public List<ClubManageVO> selectLeadersPastList(int mem_nu);
	@Select("select * from joinclub j join member_detail m on j.mem_num=m.mem_num where j.club_num=#{club_num}")
	public List<ClubManageVO> selectManageMembers(int club_num);
	@Select("select * from club where club_num=#{club_num}")
	public ClubManageVO selectClub(int club_num);
	@Update("update joinclub set join_date=#{join_date}, attendance_rate=#{attendance_rate} where mem_num=#{mem_num} and club_num=#{club_num}")
	public void updateParticipants(ClubManageVO memberVO);
	@Select("select join_date from joinclub where mem_num=#{mem_num} and club_num=#{club_num}")
	public String selectJoinDate(Map<String,Object> map);
	@Select("select mem_num from joinclub where club_num=#{club_num}")
	public List<Integer> selectMembers(int club_num);
	@Select("select * from member_detail where mem_num=#{mem_num}")
	public ClubManageVO selectMember(int mem_num);
	@Delete("delete from joinclub where mem_num=#{mem_num} and club_num=#{club_num}")
	public void deleteMemberFromClub(Map<String, Integer> resign_map);
}
