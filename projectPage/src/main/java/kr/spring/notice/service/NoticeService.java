package kr.spring.notice.service;

import java.util.List;
import java.util.Map;

import kr.spring.notice.domain.NoticeVO;


public interface NoticeService {
	public List<NoticeVO> selectList(Map<String,Object> map);
	public int selectRowCount(Map<String,Object> map);
	public void insert(NoticeVO notice);
	public NoticeVO selectNotice(Integer nt_num);
	public void updateHit(Integer nt_num);
	public void update(NoticeVO notice);
	public boolean deleteNotice(Integer nt_num);
}
