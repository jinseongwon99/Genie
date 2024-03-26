package mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Notice;
import model.Search;
import paging.Paging;

public interface NoticeAnno {

	@Insert("insert into tpnotice values " + "(noticeseq.nextval, #{title}, #{content}, sysdate) ")
	int insertNotice(Notice notice);

	@Select("select * from tpnotice order by noticeid desc")
	List<Notice> selectAllNotice();

	/*
	 * @Select("select * from " + "(select rownum rn, a.* " +
	 * "  from ( select * from tpnotice order by noticeid desc ) a ) " +
	 * "  where rn > #{startNum} and rn <= #{endNum};") List<Notice>
	 * selectPageNotice(@Param("startNum") int startNum, @Param("endNum") int
	 * endNum);
	 */

	@Select("SELECT * FROM (" + "  SELECT rownum rn, a.* " + "  FROM (SELECT * FROM tpnotice ORDER BY noticeid DESC) a"
			+ ") " + "WHERE rn BETWEEN #{startNum} AND #{endNum}")
	List<Notice> selectPageNotice(@Param("startNum") int startNum, @Param("endNum") int endNum);

	@Select("select count(*) from tpnotice order by noticeid ")
	int selectNoticeCount();

	@Select("select * from tpnotice where noticeid = #{noticeId} ")
	Notice selectNoticeId(int noticeId);

	@Update("update tpnotice set title = #{title}, content = #{content}, createDate = sysdate where noticeid = #{noticeId} ")
	int updateNotice(Notice notice);

	@Delete("delete from tpnotice where noticeid = #{noticeId} ")
	int deleteNotice(int noticeId);

	// [search] 전체 + keyword 검색 + notice
	@Select("SELECT * FROM " + "( SELECT rownum rn, a.* " + "FROM (SELECT * FROM tpnotice "
			+ "where title Like '%' || #{keyword} || '%' " + " or content Like '%' || #{keyword} || '%' "
			+ "ORDER BY noticeid DESC) a ) " + "WHERE rn BETWEEN #{startNum} AND #{endNum} ")
	List<Notice> searchAllNotice(@Param("keyword") String keyword, @Param("startNum") int startNum,
			@Param("endNum") int endNum);

	// ==> 위의 출력 총 개수
	@Select("SELECT count(*) FROM tpnotice " + "where title Like '%' || #{keyword} || '%' "
			+ " or content Like '%' || #{keyword} || '%' " + "ORDER BY noticeid DESC ")
	int searchAllNoticeCount(@Param("keyword") String keyword);

	// 1. title 일 때
	// [search] searchType + keyword 검색 + notice
	@Select("SELECT * FROM " + "( SELECT rownum rn, a.* " + "FROM (SELECT * FROM tpnotice "
			+ "where title Like '%' || #{search.searchKeyword} || '%' " + "ORDER BY noticeid DESC) a ) "
			+ "WHERE rn BETWEEN #{startNum} AND #{endNum} ")
	List<Notice> searchTitleNotice(@Param("search") Search search, @Param("startNum") int startNum,
			@Param("endNum") int endNum);

	// ==> 위의 출력 총 개수
	@Select("SELECT count(*) FROM tpnotice " + "where title Like '%' || #{search.searchKeyword} || '%' "
			+ "ORDER BY noticeid DESC")
	int searchTitleNoticeCount(@Param("search") Search search);

	// 2. content 일 때
	// [search] searchType + keyword 검색 + notice
	@Select("SELECT * FROM " + "( SELECT rownum rn, a.* " + "FROM (SELECT * FROM tpnotice "
			+ "where content Like '%' || #{search.searchKeyword} || '%' " + "ORDER BY noticeid DESC) a ) "
			+ "WHERE rn BETWEEN #{startNum} AND #{endNum} ")
	List<Notice> searchContentNotice(@Param("search") Search search, @Param("startNum") int startNum,
			@Param("endNum") int endNum);

	// ==> 위의 출력 총 개수
	@Select("SELECT count(*) FROM tpnotice " + "where content Like '%' || #{search.searchKeyword} || '%' "
			+ "ORDER BY noticeid DESC")
	int searchContentNoticeCount(@Param("search") Search search);

	@Select("SELECT * FROM (SELECT * FROM tpnotice ORDER BY noticeid desc) WHERE ROWNUM = 1")
	Notice getOneNotice();
}
