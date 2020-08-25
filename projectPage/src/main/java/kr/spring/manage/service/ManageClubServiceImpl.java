package kr.spring.manage.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.manage.dao.ManageClubMapper;
import kr.spring.manage.domain.ManageClubVO;

@Service("manageClubService")
public class ManageClubServiceImpl implements ManageClubService{

	@Resource
	private ManageClubMapper manageClubMapper;

	@Override
	public List<ManageClubVO> selectList1(Map<String, Object> map) {
		return manageClubMapper.selectList1(map);
	}
	
	@Override
	public List<ManageClubVO> selectList2(Map<String, Object> map) {
		return manageClubMapper.selectList2(map);
	}
	
	@Override
	public List<ManageClubVO> selectList3(Map<String, Object> map) {
		return manageClubMapper.selectList3(map);
	}

	@Override
	public int selectRowCount(Integer status) {
		return manageClubMapper.selectRowCount(status);
	}

	@Override
	public ManageClubVO selectClubRequest(Integer num) {
		return manageClubMapper.selectClubRequest(num);
	}

	@Override
	public void updateStatus(Map<String,Integer> map) {
		manageClubMapper.updateStatus(map);
		
	}

	
	
}
