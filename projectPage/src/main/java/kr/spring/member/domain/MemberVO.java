package kr.spring.member.domain;

import java.io.IOException;
import java.sql.Date;
import java.util.Arrays;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class MemberVO {
	private int mem_num;
	@NotEmpty
	private String mem_id;
	private int mem_auth;
	private String detail_nick;
	@NotEmpty
	private String detail_name;
	@NotEmpty
	private String detail_passwd;
	@NotEmpty
	private String detail_cell;
	@Email
	@NotEmpty
	private String detail_email;
	private Date detail_date;
	private int detail_point;
	private String detail_img;
	private MultipartFile upload;
	private byte[] image;
	
	
	//비밀번호 인증
	public boolean isCheckedPasswd(String userPasswd) {
		if(mem_auth > 1 && detail_passwd.equals(userPasswd)) {
			return true;			}
		return false;
	}
	//아이디 인증
	public boolean isCheckedId(String userId) {
		if(mem_auth > 1 && mem_id.equals(userId)) {
			return true;			}
		return false;
	}
	
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) throws IOException{
		this.upload = upload;
		
		//byte[]로 반환
		setImage(upload.getBytes());
		//파일명 구하기
		setDetail_img(upload.getOriginalFilename());
		
	}
	public byte[] getImage() {
		return image;
	}
	public void setImage(byte[] image) {
		this.image = image;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public int getMem_auth() {
		return mem_auth;
	}
	public void setMem_auth(int mem_auth) {
		this.mem_auth = mem_auth;
	}
	public String getDetail_nick() {
		return detail_nick;
	}
	public void setDetail_nick(String detail_nick) {
		this.detail_nick = detail_nick;
	}
	public String getDetail_name() {
		return detail_name;
	}
	public void setDetail_name(String detail_name) {
		this.detail_name = detail_name;
	}
	public String getDetail_passwd() {
		return detail_passwd;
	}
	public void setDetail_passwd(String detail_passwd) {
		this.detail_passwd = detail_passwd;
	}
	public String getDetail_cell() {
		return detail_cell;
	}
	public void setDetail_cell(String detail_cell) {
		this.detail_cell = detail_cell;
	}
	public String getDetail_email() {
		return detail_email;
	}
	public void setDetail_email(String detail_email) {
		this.detail_email = detail_email;
	}
	public Date getDetail_date() {
		return detail_date;
	}
	public void setDetail_date(Date detail_date) {
		this.detail_date = detail_date;
	}
	public int getDetail_point() {
		return detail_point;
	}
	public void setDetail_point(int detail_point) {
		this.detail_point = detail_point;
	}
	
	
	public String getDetail_img() {
		return detail_img;
	}
	public void setDetail_img(String detail_img) {
		this.detail_img = detail_img;
	}
	@Override
	public String toString() {
		return "MemberVO [mem_num=" + mem_num + ", mem_id=" + mem_id + ", mem_auth=" + mem_auth + ", detail_nick="
				+ detail_nick + ", detail_name=" + detail_name + ", detail_passwd=" + detail_passwd + ", detail_cell="
				+ detail_cell + ", detail_email=" + detail_email + ", detail_date=" + detail_date + ", detail_point="
				+ detail_point + ", detail_img=" + detail_img + ", upload=" + upload + ", image="
				+ Arrays.toString(image) + "]";
	}
	
}
