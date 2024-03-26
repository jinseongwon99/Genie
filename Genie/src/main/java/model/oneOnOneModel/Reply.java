package model.oneOnOneModel;

public class Reply {	// 1대1 질문 - 답변 테이블 
	
	// 답변 id 
	private int replyId;

	// 문의 id (문의 테이블 참조)
	private int inquiryId;
	
	// 답변 내용 
	private String replyContent;
	
	// 답변 작성 날짜 
	private String replyCreateDate;

	
	
	// 생성자, getter, setter
	public Reply() {
		
	}
	
	public Reply(int replyId, int inquiryId, String replyContent, String replyCreateDate) {
		super();
		this.replyId = replyId;
		this.inquiryId = inquiryId;
		this.replyContent = replyContent;
		this.replyCreateDate = replyCreateDate;
	}

	public int getReplyId() {
		return replyId;
	}

	public void setReplyId(int replyId) {
		this.replyId = replyId;
	}

	public int getInquiryId() {
		return inquiryId;
	}

	public void setInquiryId(int inquiryId) {
		this.inquiryId = inquiryId;
	}


	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public String getReplyCreateDate() {
		return replyCreateDate.substring(0, 10);
	}

	public void setReplyCreateDate(String replyCreateDate) {
		this.replyCreateDate = replyCreateDate;
	}
	
	
}
