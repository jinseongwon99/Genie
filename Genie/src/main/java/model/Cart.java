package model;

public class Cart {
	private int cartid;
	private String userid;
	private int	booknum;
	private int amount;
	private int ischecked;
	public int getCartid() {
		return cartid;
	}
	public void setCartid(int cartid) {
		this.cartid = cartid;
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
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getIschecked() {
		return ischecked;
	}
	public void setIschecked(int ischecked) {
		this.ischecked = ischecked;
	}
	@Override
	public String toString() {
		return "Cart [cartid=" + cartid + ", userid=" + userid + ", booknum=" + booknum + ", amount=" + amount
				+ ", ischecked=" + ischecked + "]";
	}
	
	
}
