package dao;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.IndiMember;
import model.Point;
import model.Review;
import mybatis.EventAnno;
import mybatis.FaqAnno;
import mybatis.MemberAnno;

@Component()
public class MemberDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	
	//private static final String ns = "member.";
	
	public int insertindiMember(IndiMember mem) throws UnsupportedEncodingException, SQLException {
		System.out.println("insertMember");
		return sqlSession.getMapper(MemberAnno.class).insertindiMember(mem);
	}
	
	public IndiMember oneMember(String userid) throws SQLException {
		System.out.println(userid);
		IndiMember mem = sqlSession.getMapper(MemberAnno.class).oneMember(userid);
		return mem;
	}
		
	public int updateIndimember(IndiMember mem) throws UnsupportedEncodingException, SQLException{
		int num = sqlSession.getMapper(MemberAnno.class).updateIndimember(mem);
		return num;
	}
	
	public int deleteMember(String userid) throws UnsupportedEncodingException, SQLException {
		int num = sqlSession.getMapper(MemberAnno.class).deleteMember(userid); 
		return num;
	}	
	
	public int passMember (String userid, String chgpass) throws UnsupportedEncodingException, SQLException {
		Map map = new HashMap();
		map.put("userid", userid);
		map.put("pass", chgpass);
		int num = sqlSession.getMapper(MemberAnno.class).passMember(map); 
		return num;
	}
	
	public IndiMember findId(String name,String email) throws SQLException {
		Map map = new HashMap();
		map.put("name", name);
		map.put("email", email);
		IndiMember mem = sqlSession.getMapper(MemberAnno.class).findId(map);
		return mem;
	}
	
	public int updatePass(String userid, String email) throws UnsupportedEncodingException, SQLException {
		Map map = new HashMap();
		map.put("userid", userid);
		map.put("email", email);
		int num = sqlSession.getMapper(MemberAnno.class).updatePass(map); 
		return num;
	}
	
	public IndiMember findPass(String userid,String email) throws SQLException {
		Map map = new HashMap();
		map.put("userid", userid);
		map.put("email", email);
		IndiMember mem = sqlSession.getMapper(MemberAnno.class).findPass(map);
		return mem;
	}

	public int calcPoint(String userid) {
		int point = sqlSession.getMapper(MemberAnno.class).calcPoint(userid);
		return point;
	}
	public int accPoint(String userid) {
		int totalPoint = sqlSession.getMapper(MemberAnno.class).accPoint(userid);
		return totalPoint;
	}
	
	public List<Point> pointLogList(String userid) {
		return sqlSession.getMapper(MemberAnno.class).pointLogList(userid);
	}
	
	//내가 쓴 리뷰
	public List<Review> myReview(String userid){
		return sqlSession.getMapper(MemberAnno.class).myReview(userid);
	}
	

	
}