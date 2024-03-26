package dao;

import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.CorpMember;
import mybatis.CorpMemberAnno;

@Component("cmd")
public class CorpMemberDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	private static final String ns = "member.";
	
	public int insertCorpMember(CorpMember mem) throws UnsupportedEncodingException, SQLException {
		System.out.println("insertMember");
		return sqlSession.getMapper(CorpMemberAnno.class).insertCorpMember(mem);
	}
	
	public CorpMember oneMember(String userid) throws SQLException {
		System.out.println(userid);
		CorpMember mem = sqlSession.getMapper(CorpMemberAnno.class).oneMember(userid);
		return mem;
	}
		
	public int updateCorpMember(CorpMember mem) throws UnsupportedEncodingException, SQLException{
		int num = sqlSession.getMapper(CorpMemberAnno.class).updateCorpMember(mem);
		return num;
	}
	
	public int deleteMember(String userid) throws UnsupportedEncodingException, SQLException {
		int num = sqlSession.getMapper(CorpMemberAnno.class).deleteMember(userid); 
		return num;
	}	
	
	public int passMember (String userid, String chgpass) throws UnsupportedEncodingException, SQLException {
		Map map = new HashMap();
		map.put("userid", userid);
		map.put("pass", chgpass);
		int num = sqlSession.getMapper(CorpMemberAnno.class).passMember(map); 
		return num;
	}	
	
	
}