package test.mapper;

public class MemberDTO {
	private int memCode;
	private String memId;
	private String memPw;
	private String memName;
	private String phoneNumber;
	private String emailId;
	private String postNum;
	public int getMemCode() {
		return memCode;
	}
	public void setMemCode(int memCode) {
		this.memCode = memCode;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemPw() {
		return memPw;
	}
	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getPostNum() {
		return postNum;
	}
	public void setPostNum(String postNum) {
		this.postNum = postNum;
	}
	public String getRoadAddress() {
		return roadAddress;
	}
	public void setRoadAddress(String roadAddress) {
		this.roadAddress = roadAddress;
	}
	public String getAddressDetail() {
		return addressDetail;
	}
	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}
	private String roadAddress;
	private String addressDetail;
    
	// 데이터 접근 메서드, 값을 저장하는 메서드 set, 값을 가져오는 메서드 get
	
}
