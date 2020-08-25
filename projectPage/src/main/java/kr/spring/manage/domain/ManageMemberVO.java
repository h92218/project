package kr.spring.manage.domain;

import java.io.IOException;
import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class ManageMemberVO {
	private int mem_num;
	private String mem_id;
	private int mem_auth;
	private String detail_nick;
	private String detail_name;
	private String detail_passwd;
	private String detail_cell;
	private String detail_email;
	private Date detail_date;
	private int detail_point;
	private MultipartFile detail_upload;
	private byte[] detail_uploadfile;
	private String filename;
	
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
	public void setDetail_email(String detail_mail) {
		this.detail_email = detail_mail;
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
	public MultipartFile getDetail_upload() {
		return detail_upload;
	}
	public void setDetail_upload(MultipartFile detail_upload) throws IOException {
		this.detail_upload = detail_upload;
		
		//byte[] 변환
		setDetail_uploadfile(detail_upload.getBytes());
		
		//파일명 구하기
		setFilename(detail_upload.getOriginalFilename());
	}
	public byte[] getDetail_uploadfile() {
		return detail_uploadfile;
	}
	public void setDetail_uploadfile(byte[] detail_uploadfile) {
		this.detail_uploadfile = detail_uploadfile;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	
	
}
