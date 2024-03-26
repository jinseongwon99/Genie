package model;

public class Slang {
	private int slangid ;
	private String userid ;
	private int booknum ;
	private int ischecked ;
	public int getSlangid() {
		return slangid;
	}
	public void setSlangid(int slangid) {
		this.slangid = slangid;
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
	public int getIschecked() {
		return ischecked;
	}
	public void setIschecked(int ischecked) {
		this.ischecked = ischecked;
	}
	@Override
	public String toString() {
		return "Slang [slangid=" + slangid + ", userid=" + userid + ", booknum=" + booknum + ", ischecked=" + ischecked
				+ "]";
	}
	
	
	
}
