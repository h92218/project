package kr.spring.club.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.club.dao.ClubMapper;
import kr.spring.club.domain.ClubVO;

@Service("clubService")
public class ClubServiceImpl implements ClubService{
	
	@Resource
	private ClubMapper clubMapper;

	@Override
	public List<ClubVO> selectList(Map<String, Object> map) {
		
		return clubMapper.selectList(map);
	}

	@Override
	public int selectRowCount(Map<String, Object> map) {
		
		return clubMapper.selectRowCount(map);
	}

	@Override
	public void insert(ClubVO club) {
		clubMapper.insert(club);
	}

	@Override
	public ClubVO selectBoard(Integer club_num) {
		
		return clubMapper.selectBoard(club_num);
	}

	@Override
	public void adminUpdate(ClubVO club) {
		clubMapper.adminUpdate(club);	
	}
	
	@Override
	public void update(ClubVO club) {
		clubMapper.update(club);
	}

	@Override
	public void delete(Integer club) {
		clubMapper.delete(club);	
	}

	@Override
	public List<ClubVO> mainList() {
		
		return clubMapper.mainList();
	}

	@Override
	public int listRowCount() {
		
		return clubMapper.listRowCount();
	}

	@Override
	public void joinClubInsert(Integer club_num, Integer mem_num) {
		clubMapper.joinClubInsert(club_num, mem_num);
	}

	@Override
	public List<ClubVO> genreList(Map<String,Object> map) {
		
		return clubMapper.genreList(map);
	}

}
