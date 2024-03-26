package mybatis;

import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.CorpMember;


public interface CorpMemberAnno {
	@Insert("insert into corpmember values (#{name}, #{userid}, #{regisnum}, #{pass}, "
			+ "	 #{tel}, #{addr}, 0)")
	int insertCorpMember(CorpMember mem);
	
	@Select("select * from corpmember where userid=#{userid}")
	CorpMember oneMember(String userid);
	
	@Update("update corpmember set "
			+ "name=#{name}, tel=#{tel}, #{addr}, "
			+ "where userid=#{userid}")
	int updateCorpMember(CorpMember mem);
	
	@Delete("delete corpmember where userid=#{userid}")
	int deleteMember(String userid);
	
	@Update("update corpmember set pass=#{pass} where userid=#{userid}")
	int passMember(Map map);
}
