package kr.spring.club.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kr.spring.club.domain.ClubVO;


public interface ClubMapper {
	public List<ClubVO> selectList(Map<String,Object> map);
	public int selectRowCount(Map<String,Object> map);
	public void insert(ClubVO club);
	@Select("SELECT * FROM club c JOIN member m ON c.mem_num=m.mem_num WHERE c.club_num=#{club_num}")
	public ClubVO selectBoard(Integer club_num);
	public void adminUpdate(ClubVO club);
	public void update(ClubVO club);
	@Delete("DELETE FROM club WHERE club_num=#{club_num}")
	public void delete(Integer club);
	
	@Select("SELECT COUNT (*) FROM club c JOIN member m ON c.mem_num=m.mem_num AND club_state = 2")
	public int listRowCount();
	@Select("SELECT * FROM (SELECT a.* FROM (SELECT * FROM club c JOIN member m ON c.mem_num=m.mem_num ORDER BY c.club_num DESC) a) WHERE club_state = 2 AND club_end+1>=sysdate")
	public List<ClubVO> mainList();
	
	@Insert("INSERT INTO joinclub (join_num,club_num,mem_num) VALUES (joinclub_seq.nextval,#{club_num},#{mem_num})")
	public void joinClubInsert(@Param("club_num") Integer club_num, @Param("mem_num") Integer mem_num);
	
	public List<ClubVO> genreList(Map<String,Object> map);
}
