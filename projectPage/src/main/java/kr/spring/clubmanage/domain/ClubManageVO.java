package kr.spring.clubmanage.domain;

import java.sql.Date;


public class ClubManageVO {  
	
	private int club_num;
	private int mem_num;
	private String club_title;
	private String club_loc;
	private String club_name;
	private Date club_start;
	private String club_time;
	private String club_interval;
	private Date club_end;
	private String club_detail;
	private byte[] club_img;
	private String filename;
	private int club_state;
	private String return_message;
	private Date club_date;
	private String detail_name;
	private String detail_nick;
	private String detail_cell;
	private String detail_email;
	private String detail_img;
	private float attendance_rate;
	public float getAttendance_rate() {
		return attendance_rate;
	}
	public void setAttendance_rate(float attendance_rate) {
		this.attendance_rate = attendance_rate;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getDetail_img() {
		return detail_img;
	}
	public void setDetail_img(String detail_img) {
		this.detail_img = detail_img;
	}
	public byte[] getImage() {
		return image;
	}
	public void setImage(byte[] image) {
		this.image = image;
	}
	private byte[] image;
	
	private String join_date;
	public String getJoin_date() {
		return join_date;
	}
	public void setJoin_date(String join_date) {
		this.join_date = join_date;
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
	public String getClub_detail() {
		return club_detail;
	}
	public void setClub_detail(String club_detail) {
		this.club_detail = club_detail;
	}
	public byte[] getClub_img() {
		return club_img;
	}
	public void setClub_img(byte[] club_img) {
		this.club_img = club_img;
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
	public void setReturn_message(String retrun_message) {
		this.return_message = retrun_message;
	}
	public Date getClub_date() {
		return club_date;
	}
	public void setClub_date(Date club_date) {
		this.club_date = club_date;
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
	
	
	
}