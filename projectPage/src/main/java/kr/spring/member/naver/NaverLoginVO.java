package kr.spring.member.naver;

public class NaverLoginVO {
	private String resultcode;
	private String message;
	private NaverUserVO response;
	
	public String getResultcode() {
		return resultcode;
	}
	public void setResultcode(String resultcode) {
		this.resultcode = resultcode;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public NaverUserVO getResponse() {
		return response;
	}
	public void setResponse(NaverUserVO response) {
		this.response = response;
	}
	@Override
	public String toString() {
		return "NaverLoginCommand [resultcode=" + resultcode + ", message=" + message + ", response=" + response + "]";
	}
}
