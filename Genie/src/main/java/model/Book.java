package model;

import java.sql.Date;

public class Book {
	private int booknum;
	private String title;
	private int inventory;
	private String author;
	private String category;
	private int price;
	private String pubdate;
	private String bookimg;
	private String summary;
	private String publisher;
	private String userid;
	private Date expdate;
	private String bookstate;
	private int grade;
	private double reviewAvg;
	
	
	public double getReviewAvg() {
		return reviewAvg;
	}
	public void setReviewAvg(double reviewAvg) {
		this.reviewAvg = reviewAvg;
	}
	private String keyword;

	
	
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getBooknum() {
		return booknum;
	}
	public void setBooknum(int booknum) {
		this.booknum = booknum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getInventory() {
		return inventory;
	}
	public void setInventory(int inventory) {
		this.inventory = inventory;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPubdate() {
		return pubdate;
	}
	public void setPubdate(String pubdate) {
		this.pubdate = pubdate;
	}
	public String getBookimg() {
		return bookimg;
	}
	public void setBookimg(String bookimg) {
		this.bookimg = bookimg;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public Date getExpdate() {
		return expdate;
	}
	public void setExpdate(Date expdate) {
		this.expdate = expdate;
	}
	public String getBookstate() {
		return bookstate;
	}
	public void setBookstate(String bookstate) {
		this.bookstate = bookstate;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	@Override
	public String toString() {
		return "Book [booknum=" + booknum + ", title=" + title + ", inventory=" + inventory + ", author=" + author
				+ ", category=" + category + ", price=" + price + ", pubdate=" + pubdate + ", bookimg=" + bookimg
				+ ", summary=" + summary + ", publisher=" + publisher + ", userid=" + userid + ", expdate=" + expdate
				+ ", bookstate=" + bookstate + ", grade=" + grade + ", reviewAvg=" + reviewAvg + ", keyword=" + keyword
				+ "]";
	}
	
	
	
	
}
