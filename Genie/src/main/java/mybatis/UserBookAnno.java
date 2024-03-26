package mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import model.Book;
import model.Event;
import model.Member;
import model.OneOnOne;
import model.oneOnOneModel.Inquiry;
import model.oneOnOneModel.Reply;

public interface UserBookAnno {

	
	/* book */

	// [tpbook - all] 전체 데이터 개수
	@Select("select count(*) from tpbook where userid = #{userid}")
	int selectBookAllCount(String userid);

	// [tpbook - keyword] 키워드 검색 데이터 개수
	@Select("select count(*) from tpbook where userid = #{userid} and (title Like '%' || #{keyword} || '%' or author Like '%' || #{keyword} || '%') ")
	int selectBookAllKeywordCount(@Param("keyword") String keyword, @Param("userid") String userid);

	// [tpbook - title + keyword] 책 제목 + 키워드 검색 데이터 개수
	@Select("select count(*) from tpbook where userid = #{userid} and (title Like '%' || #{keyword} || '%') ")
	int selectBookTitleCount(@Param("keyword") String keyword, @Param("userid") String userid);

	// [tpbook - author + keyword] 저자 + 키워드 검색 데이터 개수
	@Select("select count(*) from tpbook where userid = #{userid} and (author Like '%' || #{keyword} || '%') ")
	int selectBookAuthorCount(@Param("keyword") String keyword, @Param("userid")  String userid);

	// [tpbook - all] 전체 데이터 출력
	@Select("SELECT * FROM ( SELECT rownum rn, a.* FROM (select * from tpbook where userid = #{userid} ORDER BY title ASC) a ) "
			+ "WHERE rn BETWEEN #{startNum} AND #{endNum} ")
	List<Book> selectBookAll(@Param("startNum") int startNum,
							@Param("endNum") int endNum,
							@Param("userid") String userid);

	// [tpbook - all] 전체 검색 + 페이징
	@Select("SELECT * FROM ( SELECT rownum rn, a.* FROM (SELECT * FROM tpbook "
			+ "	where userid = #{userid} and (title Like '%' || #{keyword} || '%' or author Like '%' || #{keyword} || '%') ORDER BY title asc) a ) "
			+ "	WHERE rn BETWEEN #{startNum} AND #{endNum} ")
	List<Book> selectBookSearchAllPaging(@Param("keyword") String keyword, @Param("startNum") int startNum,
			@Param("endNum") int endNum, @Param("userid") String userid);

	// [tpbook - title] 책 제목 검색 + 페이징
	@Select("SELECT * FROM " + "( SELECT rownum rn, a.* " + "FROM (SELECT * FROM tpbook "
			+ "where userid = #{userid} and (title Like '%' || #{keyword} || '%') ORDER BY title asc) a ) "
			+ "WHERE rn BETWEEN #{startNum} AND #{endNum} ")
	List<Book> selectBookSearchTitlePaging(@Param("keyword") String keyword, @Param("startNum") int startNum,
			@Param("endNum") int endNum, @Param("userid") String userid);

	// [tpbook - author] 저자 검색 + 페이징
	@Select("SELECT * FROM " + "( SELECT rownum rn, a.* " + "FROM (SELECT * FROM tpbook "
			+ "where userid = #{userid} and (author Like '%' || #{keyword} || '%') ORDER BY title asc) a ) "
			+ "WHERE rn BETWEEN #{startNum} AND #{endNum} ")
	List<Book> selectBookSearchAuthorPaging(@Param("keyword") String keyword, @Param("startNum") int startNum,
			@Param("endNum") int endNum, @Param("userid") String userid);
}
