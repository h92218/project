package kr.spring.manage.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.manage.dao.ManageMemberMapper;
import kr.spring.manage.domain.ManageMemberVO;

@Service("manageMemberService")
public class ManageMemberServiceImpl implements ManageMemberService{

	@Resource
	ManageMemberMapper manageMemberMapper;
	
	@Override
	public List<ManageMemberVO> selectList(Map<String, Object> map) {
		return manageMemberMapper.selectList(map);
	}

	@Override
	public int selectRowCount(Map<String, Object> map) {
		return manageMemberMapper.selectRowCount(map);
	}

	@Override
	public ManageMemberVO modifyList(Integer num) {
		return manageMemberMapper.modifyList(num);
	}

	@Override
	public void updateMembership(Map<String, Object> map) {
		manageMemberMapper.updateMembership(map);
		
	}

	@Override
	public void updatePoint(Map<String, Object> map) {
		manageMemberMapper.updatePoint(map);
		

	}

}
