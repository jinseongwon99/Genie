package model;

public class Notice {	// 공지사항 게시판 테이블 

	@Override
	public String toString() {
		return "Notice [noticeId=" + noticeId + ", title=" + title + ", content=" + content + ", createDate="
				+ createDate + "]";
	}

	// 공지사항 id 
	private int noticeId;
	
	// 공지사항 제목 
	private String title; 
	
	// 공지사항 내용 
	private String content;
	
	// 공지사항 마지막 수정날짜 
	private String createDate;

	
	public Notice() {}
	
	public Notice(int noticeId, String title, String content, String createDate) {
		super();
		this.noticeId = noticeId;
		this.title = title;
		this.content = content;
		this.createDate = createDate;
	}

	public int getNoticeId() {
		return noticeId;
	}

	public void setNoticeId(int noticeId) {
		this.noticeId = noticeId;
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
	
	
	
	
	
	
}
