package kr.spring.member.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.member.dao.MemberMapper;
import kr.spring.member.domain.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Resource
	private MemberMapper memberMapper;
	
	@Override
	public void insert(MemberVO member) {
		//시퀀스를 이용해서 mem_num 구하기
		member.setMem_num(memberMapper.selectMem_num());
		//member 테이블에 데이터 저장
		memberMapper.insert(member);
		//member_detail 테이블에 데이터 저장
		memberMapper.insertDetail(member);
	}
	
	@Override
	public MemberVO selectCheckMember(String mem_id) {
		return memberMapper.selectCheckMember(mem_id);
	}

	@Override
	public MemberVO selectMember(Integer mem_num) {
		return memberMapper.selectMember(mem_num);
	}

	@Override
	public void update(MemberVO member) {
		memberMapper.update(member);
	}

	@Override
	public void updatePassword(MemberVO member) {
		memberMapper.updatePassword(member);
	}

	@Override
	public void delete(Integer mem_num) {
		memberMapper.delete(mem_num);
		memberMapper.deleteDetail(mem_num);
	}

	@Override
	public void updateRandomPasswd(MemberVO member) {
		memberMapper.updateRandomPasswd(member);
	}
}