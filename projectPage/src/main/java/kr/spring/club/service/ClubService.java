package kr.spring.club.service;

import java.util.List;
import java.util.Map;

import kr.spring.club.domain.ClubVO;

public interface ClubService {
	public List<ClubVO> selectList(Map<String,Object> map);
	public int selectRowCount(Map<String,Object> map);
	public void insert(ClubVO club);
	public ClubVO selectBoard(Integer club_num);
	public void adminUpdate(ClubVO club);
	public void update(ClubVO club);
	public void delete(Integer club);
	
	public int listRowCount();
	public List<ClubVO> mainList();
	
	public void joinClubInsert(Integer club_num,Integer mem_num);
	
	public List<ClubVO> genreList(Map<String,Object> map);
}
