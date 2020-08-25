package kr.spring.club.dao;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kr.spring.club.domain.JoinClubVO;

public interface JoinClubMapper {
	
	@Select("SELECT club_num, mem_num FROM joinclub WHERE club_num=#{club_num} AND mem_num=#{mem_num}")
	public JoinClubVO applyCheck(@Param("club_num") Integer club_num, @Param("mem_num") Integer mem_num);
}
