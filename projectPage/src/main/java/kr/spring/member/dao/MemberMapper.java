package kr.spring.member.dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.member.domain.MemberVO;

public interface MemberMapper {
	@Select("SELECT member_seq.nextval FROM dual")
	public Integer selectMem_num();
	@Insert("INSERT INTO member (mem_num, mem_id) VALUES (#{mem_num}, #{mem_id})")
	public void insert(MemberVO member);
	@Insert("INSERT INTO member_detail (mem_num,detail_nick,detail_name,detail_passwd,detail_cell,detail_email,detail_date,detail_point,detail_img,image) VALUES (#{mem_num},#{detail_nick},#{detail_name},#{detail_passwd},#{detail_cell},#{detail_email},SYSDATE,#{detail_point},#{detail_img},#{image})")
	public void insertDetail(MemberVO member);
	@Select("SELECT * FROM member m LEFT OUTER JOIN member_detail d ON m.mem_num = d.mem_num WHERE m.mem_id=#{mem_id}")
	public MemberVO selectCheckMember(String mem_id);
	@Select("SELECT * FROM member m JOIN member_detail d ON m.mem_num = d.mem_num WHERE m.mem_num=#{mem_num}")
	public MemberVO selectMember(Integer mem_num);
	public void update(MemberVO member);
	@Update("UPDATE member_detail SET detail_passwd=#{detail_passwd} WHERE mem_num=#{mem_num}")
	public void updateRandomPasswd(MemberVO member);
	public void updatePassword(MemberVO member);
	@Update("UPDATE member SET mem_auth=0 WHERE mem_num=#{mem_num}")
	public void delete(Integer mem_num);
	@Delete("DELETE FROM member_detail WHERE mem_num=#{mem_num}")
	public void deleteDetail(Integer mem_num);
	
}
