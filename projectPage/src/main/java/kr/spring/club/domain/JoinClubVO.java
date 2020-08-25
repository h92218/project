package kr.spring.club.domain;

public class JoinClubVO {
	private int club_num;
	private int mem_num;
	
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
	
	@Override
	public String toString() {
		return "JoinClubVO [club_num=" + club_num + ", mem_num=" + mem_num + "]";
	}
	
}
