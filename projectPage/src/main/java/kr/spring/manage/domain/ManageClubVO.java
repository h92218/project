package kr.spring.manage.domain;

import java.io.IOException;
import java.sql.Date;


import org.springframework.web.multipart.MultipartFile;

public class ManageClubVO {
	private int club_num;
	private int mem_num;
	private String mem_id;
	private String club_title;
	private String club_loc;
	private String club_name;
	private Date club_start;
	private String club_time;
	private String club_interval;
	private Date club_end;
	private String club_detail;
	private MultipartFile club_upload;
	private byte[] club_img;
	private String filename;
	private int club_state;
	private String return_message;
	private Date club_date;
	
	public int getClub_num() {
		return club_num;
	}
	public void setClub_num(int club_num) {
		this.club_num = club_num;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public String getClub_title() {
		return club_title;
	}
	public void setClub_title(String club_title) {
		this.club_title = club_title;
	}
	public String getClub_loc() {
		return club_loc;
	}
	public void setClub_loc(String club_loc) {
		this.club_loc = club_loc;
	}
	public String getClub_name() {
		return club_name;
	}
	public void setClub_name(String club_name) {
		this.club_name = club_name;
	}
	public Date getClub_start() {
		return club_start;
	}
	public void setClub_start(Date club_start) {
		this.club_start = club_start;
	}
	public String getClub_time() {
		return club_time;
	}
	public void setClub_time(String club_time) {
		this.club_time = club_time;
	}
	public String getClub_interval() {
		return club_interval;
	}
	public void setClub_interval(String club_interval) {
		this.club_interval = club_interval;
	}
	public Date getClub_end() {
		return club_end;
	}
	public void setClub_end(Date club_end) {
		this.club_end = club_end;
	}
	public MultipartFile getClub_upload() {
		//MultipartFile => byte[] 변환
		return club_upload;
	}
	
	//파일명 추출
	public void setClub_upload(MultipartFile club_upload) throws IOException {
		this.club_upload = club_upload;
		//다른 경로로 저장하고 싶으면 upload.transferTo()메서드를 이용한다.
	
		//byte[]변환
		setClub_img(club_upload.getBytes());
		//파일명 구하기
		setFilename(club_upload.getOriginalFilename());
	
	}
	public byte[] getClub_img() {
		return club_img;
	}
	public void setClub_img(byte[] club_img) {
		this.club_img = club_img;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getClub_state() {
		return club_state;
	}
	public void setClub_state(int club_state) {
		this.club_state = club_state;
	}
	public String getReturn_message() {
		return return_message;
	}
	public void setReturn_message(String return_message) {
		this.return_message = return_message;
	}
	public Date getClub_date() {
		return club_date;
	}
	public void setClub_date(Date club_date) {
		this.club_date = club_date;
	}
	
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	
	
	public String getClub_detail() {
		return club_detail;
	}
	public void setClub_detail(String club_detail) {
		this.club_detail = club_detail;
	}
	@Override
	public String toString() {
		return "ManageClubVO [club_num=" + club_num + ", mem_num=" + mem_num + ", mem_id=" + mem_id + ", club_title="
				+ club_title + ", club_loc=" + club_loc + ", club_name=" + club_name + ", club_start=" + club_start
				+ ", club_time=" + club_time + ", club_interval=" + club_interval + ", club_end=" + club_end
				+ ", club_detail=" + club_detail + ", club_upload=" + club_upload + ", filename=" + filename
				+ ", club_state=" + club_state + ", return_message=" + return_message + ", club_date=" + club_date
				+ "]"; //uploadfile 제외 
	}

	
	
	
	
	
	
	
}
