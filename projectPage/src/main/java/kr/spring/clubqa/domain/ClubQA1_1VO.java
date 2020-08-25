package kr.spring.clubqa.domain;

import java.io.IOException;
import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class ClubQA1_1VO {
	// QA_BOARD TABLE
	private int qa1_1num;
	private String qa1_1title;
	private String qa1_1content;
	private String qa1_1secret_key;
	private Date qa1_1datetime;
	private int qa1_1hit;
	private int mem_num;
	private String mem_id;
	private int re_cnt;
	private String qa1_1filename;
	private MultipartFile upload;
	private byte[] qa1_1uploadfile;
	// QA_BOARD TABLE
	
	public void setUpload1_1(MultipartFile upload)throws IOException {
		this.upload = upload;
		
		setQa1_1uploadfile(upload.getBytes());
		setQa1_1filename(upload.getOriginalFilename());
	}
	
	
	public int getQa1_1num() {
		return qa1_1num;
	}
	public void setQa1_1num(int qa1_1num) {
		this.qa1_1num = qa1_1num;
	}
	public String getQa1_1title() {
		return qa1_1title;
	}
	public void setQa1_1title(String qa1_1title) {
		this.qa1_1title = qa1_1title;
	}
	public String getQa1_1content() {
		return qa1_1content;
	}
	public void setQa1_1content(String qa1_1content) {
		this.qa1_1content = qa1_1content;
	}
	public String getQa1_1secret_key() {
		return qa1_1secret_key;
	}
	public void setQa1_1secret_key(String qa1_1secret_key) {
		this.qa1_1secret_key = qa1_1secret_key;
	}
	public Date getQa1_1datetime() {
		return qa1_1datetime;
	}
	public void setQa1_1datetime(Date qa1_1datetime) {
		this.qa1_1datetime = qa1_1datetime;
	}
	public int getQa1_1hit() {
		return qa1_1hit;
	}
	public void setQa1_1hit(int qa1_1hit) {
		this.qa1_1hit = qa1_1hit;
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
	public int getRe_cnt() {
		return re_cnt;
	}
	public void setRe_cnt(int re_cnt) {
		this.re_cnt = re_cnt;
	}
	public String getQa1_1filename() {
		return qa1_1filename;
	}
	public void setQa1_1filename(String qa1_1filename) {
		this.qa1_1filename = qa1_1filename;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	public byte[] getQa1_1uploadfile() {
		return qa1_1uploadfile;
	}
	public void setQa1_1uploadfile(byte[] qa1_1uploadfile) {
		this.qa1_1uploadfile = qa1_1uploadfile;
	}
	
	

}
