package kr.spring.notice.domain;

import java.io.IOException;
import java.sql.Date;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;


public class NoticeVO {
	private int nt_num;
	@NotEmpty
	private String nt_title;
	@NotEmpty
	private String nt_content;
	private MultipartFile upload;
	private byte[] nt_img; 
	private String nt_imgname;
	private MultipartFile upload2;
	private byte[] nt_file; 
	private String nt_filename;
	private Date nt_datetime;
	private int nt_hit;
	private int mem_num;
	private String mem_id;
	private int mem_auth;
	@NotEmpty
	private String nt_category;
	
	
	   
	public String getNt_category() {
		return nt_category;
	}

	public void setNt_category(String nt_category) {
		this.nt_category = nt_category;
	}

	public int getMem_auth() {
		return mem_auth;
	}

	public void setMem_auth(int mem_auth) {
		this.mem_auth = mem_auth;
	}

	public void setUpload(MultipartFile upload) throws IOException {
		this.upload = upload;
		//byte[]로 변환
		setNt_img(upload.getBytes());
		//파일명 추출
		setNt_imgname(upload.getOriginalFilename());
	}
	
	public void setUpload2(MultipartFile upload2) throws IOException {
		this.upload2 = upload2;
		
		//byte[]로 변환
		setNt_file(upload2.getBytes());
		//파일명 추출
		setNt_filename(upload2.getOriginalFilename());
	}
	
	public int getNt_num() {
		return nt_num;
	}
	public void setNt_num(int nt_num) {
		this.nt_num = nt_num;
	}
	public String getNt_title() {
		return nt_title;
	}
	public void setNt_title(String nt_title) {
		this.nt_title = nt_title.trim();
	}
	public String getNt_content() {
		return nt_content;
	}
	public void setNt_content(String nt_content) {
		this.nt_content = nt_content;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public byte[] getNt_img() {
		return nt_img;
	}
	public void setNt_img(byte[] nt_img) {
		this.nt_img = nt_img;
	}
	public String getNt_imgname() {
		return nt_imgname;
	}
	public void setNt_imgname(String nt_imgname) {
		this.nt_imgname = nt_imgname;
	}
	public MultipartFile getUpload2() {
		return upload2;
	}
	public byte[] getNt_file() {
		return nt_file;
	}
	public void setNt_file(byte[] nt_file) {
		this.nt_file = nt_file;
	}
	public String getNt_filename() {
		return nt_filename;
	}
	public void setNt_filename(String nt_filename) {
		this.nt_filename = nt_filename;
	}
	public Date getNt_datetime() {
		return nt_datetime;
	}
	public void setNt_datetime(Date nt_datetime) {
		this.nt_datetime = nt_datetime;
	}
	public int getNt_hit() {
		return nt_hit;
	}
	public void setNt_hit(int nt_hit) {
		this.nt_hit = nt_hit;
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

	@Override
	public String toString() {
		return "NoticeVO [nt_num=" + nt_num + ", nt_title=" + nt_title + ", nt_content=" + nt_content + ", upload="
				+ upload + ", nt_imgname=" + nt_imgname + ", upload2=" + upload2 + ", nt_filename=" + nt_filename
				+ ", nt_datetime=" + nt_datetime + ", nt_hit=" + nt_hit + ", mem_num=" + mem_num + ", mem_id=" + mem_id
				+ ", mem_auth=" + mem_auth + ", nt_category=" + nt_category + "]";
	}

}
