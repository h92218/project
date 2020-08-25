package kr.spring.clubmanage.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.clubmanage.dao.ClubManageMapper;
import kr.spring.clubmanage.domain.ClubManageVO;

@Service("clubManageService")
public class ClubManageServiceImpl implements ClubManageService {

	@Resource
	private ClubManageMapper clubManageMapper;	
	
	@Override
	public List<ClubManageVO> selectValidList(int mem_num) {
		
		return clubManageMapper.selectValidList(mem_num);
	}

	@Override
	public List<ClubManageVO> selectPastList(int mem_num) {
		
		return clubManageMapper.selectPastList(mem_num);
	}

	@Override
	public List<ClubManageVO> selectLeadersValidList(int mem_num) {
		
		return clubManageMapper.selectLeadersValidList(mem_num);
	}

	@Override
	public List<ClubManageVO> selectLeadersPastList(int mem_num) {
		
		return clubManageMapper.selectLeadersPastList(mem_num);
	}

	@Override
	public List<ClubManageVO> selectManageMembers(int club_num) {
		
		return clubManageMapper.selectManageMembers(club_num);
	}

	@Override
	public ClubManageVO selectClub(int club_num) {
		
		return clubManageMapper.selectClub(club_num);
	}

	@Override
	public void updateParticipants(ClubManageVO memberVO) {
		
		clubManageMapper.updateParticipants(memberVO);
	}

	@Override
	public String selectJoinDate(Map<String,Object> map) {
		
		return clubManageMapper.selectJoinDate(map);
	}

	@Override
	public List<Integer> selectMembers(int club_num) {
		
		return clubManageMapper.selectMembers(club_num);
	}

	@Override
	public ClubManageVO selectMember(int mem_num) {
		
		return clubManageMapper.selectMember(mem_num);
	}

	@Override
	public void deleteMemberFromClub(Map<String, Integer> resign_map) {
		clubManageMapper.deleteMemberFromClub(resign_map);
		
	}


}
