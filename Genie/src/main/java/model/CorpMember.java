package model;

public class CorpMember {

	private String name;
	private String userid;
	private String regisnum;
	private String pass;
	private String tel;
	private String addr;
	private int point;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getRegisnum() {
		return regisnum;
	}
	public void setRegisnum(String regisnum) {
		this.regisnum = regisnum;
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
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	@Override
	public String toString() {
		return "CorpMember [name=" + name + ", userid=" + userid + ", regisnum=" + regisnum + ", pass=" + pass
				+ ", tel=" + tel + ", addr=" + addr + ", point=" + point + "]";
	}
}