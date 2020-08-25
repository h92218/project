package kr.spring.club.service;

import kr.spring.club.domain.JoinClubVO;

public interface JoinClubService {
	public JoinClubVO applyCheck(Integer club_num,Integer mem_num);
}
