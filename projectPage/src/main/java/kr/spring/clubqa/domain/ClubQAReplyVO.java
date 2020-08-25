package kr.spring.clubqa.domain;

import kr.spring.util.DurationFromNow;

public class ClubQAReplyVO {
		
	private int qa_reply_num;
	private int mem_num;
	private int qa_num;
	private String qa_reply_content;
	private String qa_reply_datetime;
	private String mem_id;
	private int qa1_1num;
	
	
	public int getQa1_1num() {
		return qa1_1num;
	}
	public void setQa1_1num(int qa1_1num) {
		this.qa1_1num = qa1_1num;
	}
	public int getQa_reply_num() {
		return qa_reply_num;
	}
	public void setQa_reply_num(int qa_reply_num) {
		this.qa_reply_num = qa_reply_num;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public int getQa_num() {
		return qa_num;
	}
	public void setQa_num(int qa_num) {
		this.qa_num = qa_num;
	}
	public String getQa_reply_content() {
		return qa_reply_content;
	}
	public void setQa_reply_content(String qa_reply_content) {
		this.qa_reply_content = qa_reply_content;
	}
	
	public String getQa_reply_datetime() {
		return DurationFromNow.getTimeDiffLabel(qa_reply_datetime);
	}
	public void setQa_reply_datetime(String qa_reply_datetime) {
		this.qa_reply_datetime = qa_reply_datetime;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	@Override
	public String toString() {
		return "ClubQAReplyVO [qa_reply_num=" + qa_reply_num + ", mem_num=" + mem_num + ", qa_num=" + qa_num
				+ ", qa_reply_content=" + qa_reply_content + ", qa_reply_datetime=" + qa_reply_datetime + ", mem_id="
				+ mem_id + ", qa1_1num=" + qa1_1num + "]";
	}

}
