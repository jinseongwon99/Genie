package model;


public class Event {	// 이벤트 게시판 테이블 
	
	// 이벤트 id 
	private int eventId; 
	
	// 이벤트 카테고리 
	/*
	 * 1. 신작 이벤트 : new 
	 * 2. 결제 이벤트 : pay
	 * 3. 기타 이벤트 : etc
	 * */
	private String category;
	
	// 이벤트 배너 이미지 
	private String image; 
	
	// 이벤트 제목 
	private String title;
	
	// 이벤트 내용 (이미지 or 문자 형식)
	private String content;
	
	// 이벤트 시작 날짜 
	private String startdate;
	
	// 이벤트 종료 날짜 
	private String enddate;

	
	public Event() {}
	
	public Event(int eventId, String category, String image, String title, String content, String startDate,
			String endDate) {
		super();
		this.eventId = eventId;
		this.category = category;
		this.image = image;
		this.title = title;
		this.content = content;
		this.startdate = startDate;
		this.enddate = endDate;
	}

	public int getEventId() {
		return eventId;
	}

	public void setEventId(int eventId) {
		this.eventId = eventId;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
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

	public String getStartDate() {
		return startdate.substring(0, 10);
	}

	public void setStartDate(String startDate) {
		this.startdate = startDate;
	}

	public String getEndDate() {
		return enddate.substring(0, 10);
	}

	public void setEndDate(String endDate) {
		this.enddate = endDate;
	}	
	
	
}
