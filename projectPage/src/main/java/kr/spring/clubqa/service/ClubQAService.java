package kr.spring.clubqa.service;

import java.util.List;
import java.util.Map;

import kr.spring.clubqa.domain.ClubAQVO;
import kr.spring.clubqa.domain.ClubQA1_1VO;
import kr.spring.clubqa.domain.ClubQAReplyVO;
import kr.spring.clubqa.domain.ClubQAVO;

public interface ClubQAService {
	public List<ClubQAVO> selectList(Map<String, Object> map);
	public int selectRowCount(Map<String, Object> map);
	public void insert(ClubQAVO clubqa);
	public ClubQAVO selectQABoard(Integer num);
	public void updateQAhit(Integer num);
	public void update(ClubQAVO clubqa);
	public void delete(Integer num);
	
	//댓글
	public List<ClubQAReplyVO> selectListReply(Map<String,Object> map);
	public int selectRowCountReply(Map<String,Object> map);
	public void insertReply(ClubQAReplyVO clubQAReplyVO);
	public void updateReply(ClubQAReplyVO clubQAReplyVO);
	public void deleteReply(Integer qa_reply_num);
	//부모글 삭제시 댓글이 존재하면 부모글 삭제전 댓글 삭제
	public void deleteReplyByBoardNum(Integer qa_num);
	
	//질문 게시판
	public List<ClubQA1_1VO> select1_1List(Map<String, Object> map);
	public int select1_1RowCount(Map<String, Object> map);
	public void insert1_1(ClubQA1_1VO clubqa1_1);
	public ClubQA1_1VO select1_1QABoard(Integer num);
	public void update1_1QAhit(Integer num);
	public void update1_1(ClubQA1_1VO clubqa1_1);
	public void delete1_1(Integer num);
	
	//질문 게시판 댓글
	public List<ClubQAReplyVO> select1_1ListReply(Map<String,Object> map);
	public int select1_1RowCountReply(Map<String,Object> map);
	public void insert1_1Reply(ClubQAReplyVO clubQAReplyVO);
	public void update1_1Reply(ClubQAReplyVO clubQAReplyVO);
	public void delete1_1Reply(Integer qa_reply_num);
	//부모글 삭제시 댓글이 존재하면 부모글 삭제전 댓글 삭제
	public void delete1_1ReplyByBoardNum(Integer qa_num);
	
	//자주하는 질문 게시판 
	public List<ClubAQVO> selectaqList(Map<String, Object> map);
	public int selectaqRowCount(Map<String, Object> map);
	public void insertaq(ClubAQVO clubaq);
	public ClubAQVO selectAQBoard(Integer num);
	public void updateaq(ClubAQVO clubaq);
	public void deleteaq(Integer num);

}
