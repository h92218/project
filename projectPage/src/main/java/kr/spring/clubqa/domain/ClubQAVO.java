package kr.spring.clubqa.domain;

import java.io.IOException;
import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class ClubQAVO {
	// QA_BOARD TABLE
	private int qa_num;
	private String qa_title;
	private String qa_content;
	private String qa_secret_key;
	private Date qa_datetime;
	private int qa_hit;
	private int mem_num;
	private String mem_id;
	private int re_cnt;
	private String qa_filename;
	private MultipartFile upload;
	private byte[] qa_uploadfile;
	// QA_BOARD TABLE
	
	public void setUpload(MultipartFile upload)throws IOException {
		this.upload = upload;
		
		setQa_uploadfile(upload.getBytes());
		setQa_filename(upload.getOriginalFilename());
	}
	
	public MultipartFile getUpload() {
		return upload;
	}

	public int getQa_num() {
		return qa_num;
	}
	public String getQa_filename() {
		return qa_filename;
	}
	public void setQa_filename(String qa_filename) {
		this.qa_filename = qa_filename;
	}
	public byte[] getQa_uploadfile() {
		return qa_uploadfile;
	}
	public void setQa_uploadfile(byte[] qa_uploadfile) {
		this.qa_uploadfile = qa_uploadfile;
	}
	public int getRe_cnt() {
		return re_cnt;
	}
	public void setRe_cnt(int re_cnt) {
		this.re_cnt = re_cnt;
	}
	public void setQa_num(int qa_num) {
		this.qa_num = qa_num;
	}
	public String getQa_title() {
		return qa_title;
	}
	public void setQa_title(String qa_title) {
		this.qa_title = qa_title;
	}
	public String getQa_content() {
		return qa_content;
	}
	public void setQa_content(String qa_content) {
		this.qa_content = qa_content;
	}
	public String getQa_secret_key() {
		return qa_secret_key;
	}
	public void setQa_secret_key(String qa_secret_key) {
		this.qa_secret_key = qa_secret_key;
	}
	public Date getQa_datetime() {
		return qa_datetime;
	}
	public void setQa_datetime(Date qa_datetime) {
		this.qa_datetime = qa_datetime;
	}
	public int getQa_hit() {
		return qa_hit;
	}
	public void setQa_hit(int qa_hit) {
		this.qa_hit = qa_hit;
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
		return "ClubQAVO [qa_num=" + qa_num + ", qa_title=" + qa_title + ", qa_content=" + qa_content
				+ ", qa_secret_key=" + qa_secret_key + ", qa_datetime=" + qa_datetime + ", qa_hit=" + qa_hit
				+ ", mem_num=" + mem_num + ", mem_id=" + mem_id + ", re_cnt=" + re_cnt + ", qa_filename=" + qa_filename
				+ ", upload=" + upload + "]";
	}
	
	
	
}
