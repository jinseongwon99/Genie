package model.oneOnOneModel;

public class Inquiry {	// 1대1 질문 - 문의 테이블 
	
	// 문의 id 
	private int inquiryId;
	
	// 사용자 id 
	private String userId; 
	
	/* 문의 분류
	 * 1. 도서 : book 
	 * 2. 주문 : order
	 * 3. 회원 : member
	 * 4. 배송 : delivery
	 * 5. 그 외 : etc
	 * */
	private String category;	
	
	// 주문 번호 
	private String orderId; 
	
	// 문의 제목 
	private String title; 
	
	// 문의 내용 
	private String content; 
	
	// 문의 작성 날짜 
	private String createDate;
	
	// 답변 여부 (0 : 답변 X , 1 : 답변 완료)
	private int ResponseStatus;

	
	
	
	// 생성자
	public Inquiry() {};
	
	public Inquiry(int inquiryId, String userId, String category, String orderId, String title, String content,
			String createDate, int responseStatus) {
		super();
		this.inquiryId = inquiryId;
		this.userId = userId;
		this.category = category;
		this.orderId = orderId;
		this.title = title;
		this.content = content;
		this.createDate = createDate;
		this.ResponseStatus = responseStatus;
	}

	public String getCategoryName(String category) {
		
		String name = "";
		
		switch(category) {
			case "book":
				name = "도서";
				break;
			case "order":
				name = "주문";
				break;
			case "member":
				name = "회원";
				break;
			case "delivery":
				name = "배송";
				break;
			case "etc":
				name = "기타";
				break;
		}
		
		return name;
	}
	
	// getter, setter
	public int getInquiryId() {
		return inquiryId;
	}

	public void setInquiryId(int inquiryId) {
		this.inquiryId = inquiryId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCreateDate() {
		return createDate.substring(0, 10);
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public int getResponseStatus() {
		return ResponseStatus;
	}

	public void setResponseStatus(int responseStatus) {
		ResponseStatus = responseStatus;
	}

	
	@Override
	public String toString() {
		return "Inquiry [inquiryId=" + inquiryId + ", userId=" + userId + ", category=" + category + ", orderId="
				+ orderId + ", title=" + title + ", content=" + content + ", createDate=" + createDate
				+ ", ResponseStatus=" + ResponseStatus + "]";
	}
	
	
	
}
