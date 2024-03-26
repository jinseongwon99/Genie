package model;

import model.oneOnOneModel.Inquiry;
import model.oneOnOneModel.Reply;

public class OneOnOne {		// 1대1문의 질문 + 답변 model
	
	private Inquiry inquiry;
	private Reply reply;
	
	
	public OneOnOne(Inquiry inquiry, Reply reply) {
		this.inquiry = inquiry;
		this.reply = reply;
	}
	
	public Inquiry getInquiry() {
		return inquiry;
	}
	public void setInquiry(Inquiry inquiry) {
		this.inquiry = inquiry;
	}
	public Reply getReply() {
		return reply;
	}
	public void setReply(Reply reply) {
		this.reply = reply;
	}

	
	
	
}
