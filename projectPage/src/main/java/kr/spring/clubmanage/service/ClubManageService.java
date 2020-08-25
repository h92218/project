package kr.spring.clubmanage.service;

import java.util.List;
import java.util.Map;

import kr.spring.clubmanage.domain.ClubManageVO;

public interface ClubManageService {
	public List<ClubManageVO> selectValidList(int mem_num);
	public List<ClubManageVO> selectPastList(int mem_num);
	public List<ClubManageVO> selectLeadersValidList(int mem_num);
	public List<ClubManageVO> selectLeadersPastList(int mem_num);
	public List<ClubManageVO> selectManageMembers(int club_num);
	public ClubManageVO selectClub(int club_num);
	public void updateParticipants(ClubManageVO memberVO);
	public List<Integer> selectMembers(int club_num);
	String selectJoinDate(Map<String, Object> map);
	public ClubManageVO selectMember(int mem_num);
	public void deleteMemberFromClub(Map<String, Integer> resign_map);
}
