package model;

import java.sql.Date;

public class Review {
	private int reviewid;
	private int booknum;
	private String userid;
	private int point;
	private String review;
	private Date reviewdate;
	private String title;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getReviewid() {
		return reviewid;
	}
	public void setReviewid(int reviewid) {
		this.reviewid = reviewid;
	}
	public int getBooknum() {
		return booknum;
	}
	public void setBooknum(int booknum) {
		this.booknum = booknum;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	

	public Date getReviewdate() {
		return reviewdate;
	}
	public void setReviewdate(Date reviewdate) {
		this.reviewdate = reviewdate;
	}
	@Override
	public String toString() {
		return "Review [reviewid=" + reviewid + ", booknum=" + booknum + ", userid=" + userid + ", point=" + point
				+ ", review=" + review + ", reviewdate=" + reviewdate + "]";
	}
	
	
}
