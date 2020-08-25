package kr.spring.manage.service;

import java.util.List;
import java.util.Map;

import kr.spring.manage.domain.ManageMemberVO;

public interface ManageMemberService{
	public List<ManageMemberVO> selectList(Map<String,Object> map);
	public int selectRowCount(Map<String,Object> map);
	public ManageMemberVO modifyList(Integer num);
	public void updateMembership(Map<String,Object> map);
	public void updatePoint(Map<String,Object> map);
}
