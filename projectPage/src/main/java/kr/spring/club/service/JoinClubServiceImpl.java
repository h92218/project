package kr.spring.club.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.club.dao.JoinClubMapper;
import kr.spring.club.domain.JoinClubVO;

@Service("JoinClubService")
public class JoinClubServiceImpl implements JoinClubService{
	
	@Resource
	private JoinClubMapper joinClubMapper;


	@Override
	public JoinClubVO applyCheck(Integer club_num, Integer mem_num) {
		
		return joinClubMapper.applyCheck(club_num, mem_num);
	}

}
