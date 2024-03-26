package model;

import java.util.Date;

public class Point {
	private int pointlogid;
	private String orderid;
	public String getOrderid() {
		return orderid;
	}
	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}
	private int orderlogid;
	private String userid;
	private int changepoint;
	private Date regdate;
	
	public int getPointlogid() {
		return pointlogid;
	}
	public void setPointlogid(int pointlogid) {
		this.pointlogid = pointlogid;
	}
	public int getOrderlogid() {
		return orderlogid;
	}
	public void setOrderlogid(int orderlogid) {
		this.orderlogid = orderlogid;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getChangepoint() {
		return changepoint;
	}
	public void setChangepoint(int changepoint) {
		this.changepoint = changepoint;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
}
