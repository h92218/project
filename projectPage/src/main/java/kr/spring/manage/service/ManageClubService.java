package kr.spring.manage.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import kr.spring.manage.domain.ManageClubVO;

public interface ManageClubService {
	public List<ManageClubVO> selectList1(Map<String,Object> map);
	public List<ManageClubVO> selectList2(Map<String,Object> map);
	public List<ManageClubVO> selectList3(Map<String,Object> map);
	public int selectRowCount(Integer status);
	public ManageClubVO selectClubRequest(Integer num);
	public void updateStatus(Map<String,Integer> map);
}
