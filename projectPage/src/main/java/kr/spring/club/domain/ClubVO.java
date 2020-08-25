package kr.spring.club.domain;

import java.io.IOException;
import java.sql.Date;
import java.util.Arrays;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class ClubVO {
	private int club_num;
	private int mem_num;
	@NotEmpty
	private String club_title;
	@NotEmpty
	private String club_loc;
	@NotEmpty
	private String club_name;
	private Date club_start;
	@NotEmpty
	private String club_time;
	@NotEmpty
	private String club_interval;
	private Date club_end;
	@NotEmpty
	private String club_detail;
	private MultipartFile upload;
	private byte[] club_img;
	private String filename;
	private int club_state;
	private String return_message;
	private Date club_date;
	private String mem_id;
	private int mem_auth;
	@NotEmpty
	private String club_genre;	
	
	public String getClub_interval() {
		return club_interval;
	}
	public void setClub_interval(String club_interval) {
		this.club_interval = club_interval;
	}
	public String getClub_genre() {
		return club_genre;
	}
	public void setClub_genre(String club_genre) {
		this.club_genre = club_genre;
	}
	public int getMem_auth() {
		return mem_auth;
	}
	public void setMem_auth(int mem_auth) {
		this.mem_auth = mem_auth;
	}
	
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(Object object) {
		this.mem_id = (String) object;
	}
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

	public Date getClub_end() {
		return club_end;
	}
	public void setClub_end(Date club_end) {
		this.club_end = club_end;
	}
	public String getClub_detail() {
		return club_detail;
	}
	public void setClub_detail(String club_detail) {
		this.club_detail = club_detail;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	
	//MultipartFile -> byte[] 변환
	//파일명 추출
	public void setUpload(MultipartFile upload) throws IOException {
		this.upload = upload;
		//만약 다른 경로로 저장하고 싶다면 upload.transferTo() 메서드를 이용한다
		
		//byte[]로 변환
		setClub_img(upload.getBytes());
		//파일명 구하기
		setFilename(upload.getOriginalFilename());
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
	
	@Override
	public String toString() {
		return "ClubVO [club_num=" + club_num + ", mem_num=" + mem_num + ", club_title=" + club_title + ", club_loc="
				+ club_loc + ", club_name=" + club_name + ", club_start=" + club_start + ", club_time=" + club_time
				+ ", club_interval=" + club_interval + ", club_end=" + club_end + ", club_detail=" + club_detail
				+ ", upload=" + upload + ", club_img=" + Arrays.toString(club_img) + ", filename=" + filename
				+ ", club_state=" + club_state + ", return_message=" + return_message + ", club_date=" + club_date
				+ ", mem_id=" + mem_id + ", mem_auth=" + mem_auth + ", club_genre=" + club_genre + "]";
	}

}
