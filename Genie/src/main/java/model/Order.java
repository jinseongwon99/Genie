package model;

import java.util.Date;

public class Order {
	private int booknum;
	private String bookimg;
	private String publisher;
	private String author;
	private String title;
	private int price;
	private String category;
	private int amount;
	private int total;
	private int ischecked;
	private int inventory;
	
	private int cartid;
	private String userid;
	
	private String ordername;
	private String ordertel;
	private String orderemail;
	private int discount;
	private int cashcard;
	private String orderaddr;
	
	private int slangid;
	
	public int getSlangid() {
		return slangid;
	}
	public void setSlangid(int slangid) {
		this.slangid = slangid;
	}
	public String getOrdertel() {
		return ordertel;
	}
	public void setOrdertel(String ordertel) {
		this.ordertel = ordertel;
	}
	public String getOrdername() {
		return ordername;
	}
	public void setOrdername(String ordername) {
		this.ordername = ordername;
	}
	public String getOrderemail() {
		return orderemail;
	}
	public void setOrderemail(String orderemail) {
		this.orderemail = orderemail;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public int getCashcard() {
		return cashcard;
	}
	public void setCashcard(int cashcard) {
		this.cashcard = cashcard;
	}
	public String getOrderaddr() {
		return orderaddr;
	}
	public void setOrderaddr(String orderaddr) {
		this.orderaddr = orderaddr;
	}
	public int getInventory() {
		return inventory;
	}
	public void setInventory(int inventory) {
		this.inventory = inventory;
	}
	//지울것 시작지점
	private String name;
	//private String userid;
	private String email;
	private String pass;
	private String tel;
	private String addr;
	private Date birthday;
	private int point;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	// 여기 위까지 member연동후 지울부분
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getCartid() {
		return cartid;
	}
	public void setCartid(int cartid) {
		this.cartid = cartid;
	}
	public int getBooknum() {
		return booknum;
	}
	public void setBooknum(int booknum) {
		this.booknum = booknum;
	}
	public int getIschecked() {
		return ischecked;
	}
	public void setIschecked(int ischecked) {
		this.ischecked = ischecked;
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
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	@Override
	public String toString() {
		return "Order [booknum=" + booknum + ", bookimg=" + bookimg + ", publisher=" + publisher + ", author=" + author
				+ ", title=" + title + ", price=" + price + ", category=" + category + ", amount=" + amount + ", total="
				+ total + ", ischecked=" + ischecked + ", inventory=" + inventory + ", cartid=" + cartid + ", userid="
				+ userid + ", ordername=" + ordername + ", ordertel=" + ordertel + ", orderemail=" + orderemail
				+ ", discount=" + discount + ", cashcard=" + cashcard + ", orderaddr=" + orderaddr + ", name=" + name
				+ ", email=" + email + ", pass=" + pass + ", tel=" + tel + ", addr=" + addr + ", birthday=" + birthday
				+ ", point=" + point + "]";
	}


	

}