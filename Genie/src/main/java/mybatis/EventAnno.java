package mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Event;

public interface EventAnno {

	
	@Insert("insert into tpevent values "
			+ "(eventseq.nextval, #{category}, #{image}, #{title}, #{content}, #{startdate}, #{enddate}) ")
	int insertEvent(Event event);
	
	
	@Select("SELECT * FROM ("
	        + "  SELECT rownum rn, a.* "
	        + "  FROM (SELECT * FROM tpevent ORDER BY eventid DESC) a"
	        + ") "
	        + "WHERE rn BETWEEN #{startNum} AND #{endNum}")
	List<Event> selectPageEvent(@Param("startNum") int startNum, @Param("endNum") int endNum);
	
	@Select("select count(*) from tpevent order by eventid ")
	int selectEventCount();
	
	@Select("select * from tpevent where eventid = #{evenId} ")
	Event selectEventId(int eventid);
	
	
	@Update("update tpevent set category = #{category}, image = #{image}, title = #{title}, content = #{content}, startdate = #{startdate}, enddate = #{enddate} where eventid = #{eventId} ")
	int updateEvent(Event event);
	
	@Delete("delete from tpevent where eventid = #{eventId} ")
	int deleteEvent(int eventId);
	
	// 01.26 수정 // 
	@Select("SELECT a.* FROM ( SELECT * FROM tpevent ORDER BY eventid DESC ) a WHERE ROWNUM <= 3 ")
	List<Event> selectThree();
	// ======= //
}
