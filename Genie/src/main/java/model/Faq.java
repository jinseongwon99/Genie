package model;

public class Faq {	// FAQ 게시판 테이블 
	
	// FAQ글 id 
	private int faqId;
	
	// FAQ 카테고리
	/*
	 * 1. 주문 / 주문 변경 : order
	 * 2. 결제 : pay
	 * 3. 배송 : delivery
	 * 4. 반품 / 교환 : returns
	 * 5. 기타 : etc
	 * */
	private String category;

	// 질문 
	private String question; 
	
	// 답변 
	private String answer; 
	
	// FAQ 작성날짜 
	private String createDate;

	
	public Faq() {}
	
	public Faq(int faqId, String category, String question, String answer, String createDate) {
		super();
		this.faqId = faqId;
		this.category = category;
		this.question = question;
		this.answer = answer;
		this.createDate = createDate;
	}

	public int getFaqId() {
		return faqId;
	}

	public void setFaqId(int faqId) {
		this.faqId = faqId;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	} 
	
	
	
	
}
