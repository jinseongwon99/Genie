package model;

import java.util.Date;

public class OrderLog {
	private Date regdate;
	private String orderid;
	private String orderstate;
	private int total;
	private int orderlogid;
	
	private int amount;
	private int discount;
	private String cashcard;
	
	private Date paydate;
	private String orderstatedetail;
	
	
	public String getOrderstatedetail() {
		return orderstatedetail;
	}
	public void setOrderstatedetail(String orderstatedetail) {
		this.orderstatedetail = orderstatedetail;
	}
	public String getCashcard() {
		return cashcard;
	}
	public void setCashcard(String cashcard) {
		this.cashcard = cashcard;
	}

	private String orderaddr;
	
	private String bookimg;
	private String publisher;
	private String author;
	private String title;
	private int price;
	public Date getPaydate() {
		return paydate;
	}
	public void setPaydate(Date paydate) {
		this.paydate = paydate;
	}

	private String category;
	
	private String userid;
	private int booknum;
	private String ordername;
	private String ordertel;
	private String orderemail;
	
	


	public String getOrderemail() {
		return orderemail;
	}
	public void setOrderemail(String orderemail) {
		this.orderemail = orderemail;
	}
	public int getOrderlogid() {
		return orderlogid;
	}
	public void setOrderlogid(int orderlogid) {
		this.orderlogid = orderlogid;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}


	public String getOrderaddr() {
		return orderaddr;
	}
	public void setOrderaddr(String orderaddr) {
		this.orderaddr = orderaddr;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getBooknum() {
		return booknum;
	}
	public void setBooknum(int booknum) {
		this.booknum = booknum;
	}
	public String getOrdername() {
		return ordername;
	}
	public void setOrdername(String ordername) {
		this.ordername = ordername;
	}
	public String getOrdertel() {
		return ordertel;
	}
	public void setOrdertel(String ordertel) {
		this.ordertel = ordertel;
	}
	public String getBookimg() {
		return bookimg;
	}
	public void setBookimg(String bookimg) {
		this.bookimg = bookimg;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	public String getOrderstate() {
		return orderstate;
	}
	public void setOrderstate(String orderstate) {
		this.orderstate = orderstate;
	}
	@Override
	public String toString() {
		return "OrderLog [orderid=" + orderid + ", orderlogid=" + orderlogid + ", amount=" + amount
				+ ", orderstatedetail=" + orderstatedetail + ", userid=" + userid + ", booknum=" + booknum + "]";
	}

	
	
	
	
	
	
}
