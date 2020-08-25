package kr.spring.clubqa.domain;

public class ClubAQVO {
	
	private int aq_num;
	private String aq_title;
	private String aq_content;
	private int mem_num;
	private int count;
	
	public int getAq_num() {
		return aq_num;
	}
	public void setAq_num(int aq_num) {
		this.aq_num = aq_num;
	}
	public String getAq_title() {
		return aq_title;
	}
	public void setAq_title(String aq_title) {
		this.aq_title = aq_title;
	}
	public String getAq_content() {
		return aq_content;
	}
	public void setAq_content(String aq_content) {
		this.aq_content = aq_content;
	}
	
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "ClubAQVO [aq_num=" + aq_num + ", aq_title=" + aq_title + ", aq_content=" + aq_content + "]";
	}
	
	
	
	
	

}
