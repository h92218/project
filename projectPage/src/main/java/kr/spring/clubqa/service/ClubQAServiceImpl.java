package kr.spring.clubqa.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.clubqa.dao.ClubQaMapper;
import kr.spring.clubqa.domain.ClubAQVO;
import kr.spring.clubqa.domain.ClubQA1_1VO;
import kr.spring.clubqa.domain.ClubQAReplyVO;
import kr.spring.clubqa.domain.ClubQAVO;

@Service("clubqaService")
public class ClubQAServiceImpl implements ClubQAService{
	
	@Resource
	private ClubQaMapper clubqaMapper;
	
	@Override
	public List<ClubQAVO> selectList(Map<String, Object> map) {
		return clubqaMapper.selectList(map);
	}

	@Override
	public int selectRowCount(Map<String, Object> map) {
		return clubqaMapper.selectRowCount(map);
	}

	@Override
	public void insert(ClubQAVO clubqa) {
		clubqaMapper.insert(clubqa);
		
	}

	@Override
	public ClubQAVO selectQABoard(Integer num) {
		return clubqaMapper.selectQABoard(num);
	}

	@Override
	public void updateQAhit(Integer num) {
		clubqaMapper.updateQAhit(num);
		
	}

	@Override
	public void update(ClubQAVO clubqa) {
		clubqaMapper.update(clubqa);
		
	}

	@Override
	public void delete(Integer num) {
		clubqaMapper.delete(num);
		
	}

    //댓글

	@Override
	public List<ClubQAReplyVO> selectListReply(Map<String, Object> map) {
		return clubqaMapper.selectListReply(map);
	}

	@Override
	public int selectRowCountReply(Map<String, Object> map) {
		return clubqaMapper.selectRowCountReply(map);
	}

	@Override
	public void insertReply(ClubQAReplyVO clubQAReplyVO) {
		clubqaMapper.insertReply(clubQAReplyVO);
	}

	@Override
	public void updateReply(ClubQAReplyVO clubQAReplyVO) {
		clubqaMapper.updateReply(clubQAReplyVO);
		
	}

	@Override
	public void deleteReply(Integer qa_reply_num) {
		clubqaMapper.deleteReply(qa_reply_num);
		
	}

	@Override
	public void deleteReplyByBoardNum(Integer qa_num) {
		clubqaMapper.deleteReplyByBoardNum(qa_num);
		
	}

	
	
	
	
	@Override
	public List<ClubQA1_1VO> select1_1List(Map<String, Object> map) {
		return clubqaMapper.select1_1List(map);
	}

	@Override
	public void insert1_1(ClubQA1_1VO clubqa1_1) {
		clubqaMapper.insert1_1(clubqa1_1);
		
	}

	@Override
	public ClubQA1_1VO select1_1QABoard(Integer num) {
		return clubqaMapper.select1_1QABoard(num);
	}

	@Override
	public void update1_1QAhit(Integer num) {
		clubqaMapper.update1_1QAhit(num);
		
	}

	@Override
	public void update1_1(ClubQA1_1VO clubqa1_1) {
		clubqaMapper.update1_1(clubqa1_1);
		
	}

	@Override
	public void delete1_1(Integer num) {
		clubqaMapper.delete1_1(num);
		
	}

	@Override
	public int select1_1RowCount(Map<String, Object> map) {
		return clubqaMapper.select1_1RowCount(map);
	}

	@Override
	public List<ClubQAReplyVO> select1_1ListReply(Map<String, Object> map) {
		return clubqaMapper.select1_1ListReply(map);
	}

	@Override
	public int select1_1RowCountReply(Map<String, Object> map) {
		return clubqaMapper.select1_1RowCountReply(map);
	}

	@Override
	public void insert1_1Reply(ClubQAReplyVO clubQAReplyVO) {
		clubqaMapper.insert1_1Reply(clubQAReplyVO);
		
	}

	@Override
	public void update1_1Reply(ClubQAReplyVO clubQAReplyVO) {
		clubqaMapper.insert1_1Reply(clubQAReplyVO);
		
	}

	@Override
	public void delete1_1Reply(Integer qa_reply_num) {
		clubqaMapper.delete1_1Reply(qa_reply_num);
		
	}

	@Override
	public void delete1_1ReplyByBoardNum(Integer qa_num) {
		clubqaMapper.delete1_1ReplyByBoardNum(qa_num);
		
	}

	@Override
	public List<ClubAQVO> selectaqList(Map<String, Object> map) {
		return clubqaMapper.selectaqList(map);
	}

	@Override
	public int selectaqRowCount(Map<String, Object> map) {
		return clubqaMapper.selectaqRowCount(map);
	}

	@Override
	public void insertaq(ClubAQVO clubaq) {
		clubqaMapper.insertaq(clubaq);
		
	}

	@Override
	public ClubAQVO selectAQBoard(Integer num) {
		return clubqaMapper.selectAQBoard(num);
	}

	@Override
	public void updateaq(ClubAQVO clubaq) {
		clubqaMapper.updateaq(clubaq);
		
	}

	@Override
	public void deleteaq(Integer num) {
		clubqaMapper.deleteaq(num);
		
	}
}
