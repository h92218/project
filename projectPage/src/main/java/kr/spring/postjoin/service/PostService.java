package kr.spring.postjoin.service;

import java.util.List;
import java.util.Map;

import kr.spring.postjoin.domain.PostVO;

public interface PostService {
	public List<PostVO> selectPostList(Map<String,Object> map);
	public int selectRowCount(Map<String,Object> map);
	public void insertPost(PostVO post);
	public PostVO selectPost(Integer post_num);
	public void updatePostHit(Integer post_num);
	public void updatePost(PostVO post);
	public void deletePost(Integer post_num);
	

}
