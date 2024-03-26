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

public interface AdminAnno {

	// [indimember] indimember 테이블의 전체 데이터 개수 (all count)
	@Select("select count(*) from indimember")
	int selectMemberAllCount();

	// [indimember] 테이블의 전체 데이터 페이징 (all + paging)
	@Select("SELECT * FROM (" + "  SELECT rownum rn, a.* " + "  FROM (SELECT * FROM indimember ORDER BY userid asc) a"
			+ ") " + "WHERE rn BETWEEN #{startNum} AND #{endNum}")
	List<Member> selectAllPaging(@Param("startNum") int startNum, @Param("endNum") int endNum);

	// [indimember - name] indimember 테이블의 name 검색 데이터 개수 (name count)
	@Select("select count(*) from indimember where name Like '%' || #{keyword} || '%'")
	int selectNameCount(String keyword);

	// [indimember - userid] indimember 테이블의 아이디 검색 데이터 개수 (userid count)
	@Select("select count(*) from indimember where userid Like '%' || #{keyword} || '%'")
	int selectIdCount(String keyword);

	// [indimember - name] 이름 검색 + 페이징 (name + paging)
	@Select("SELECT * FROM " + "( SELECT rownum rn, a.* " + "FROM (SELECT * FROM indimember "
			+ "where name Like '%' || #{keyword} || '%' " + "ORDER BY userid asc) a ) "
			+ "WHERE rn BETWEEN #{startNum} AND #{endNum} ")
	List<Member> selectNamePaging(@Param("keyword") String keyword, @Param("startNum") int startNum,
			@Param("endNum") int endNum);

	// [indimember - name] 아이디 검색 + 페이징 (name + paging)
	@Select("SELECT * FROM " + "( SELECT rownum rn, a.* " + "FROM (SELECT * FROM indimember "
			+ "where userid Like '%' || #{keyword} || '%' " + "ORDER BY userid asc) a ) "
			+ "WHERE rn BETWEEN #{startNum} AND #{endNum} ")
	List<Member> selectIdPaging(@Param("keyword") String keyword, @Param("startNum") int startNum,
			@Param("endNum") int endNum);

	// [indimember - all] 전체 카테고리 + 키워드 + 페이징 (all + keyword + paging)
	@Select("select count(*) from indimember where name Like '%' || #{keyword} || '%' or userid Like '%' || #{keyword} || '%' ")
	int selectAllCateCount(@Param("keyword") String keyword);

	// [indimember - all] 전체 검색 + 페이징 (name + userid + paging)
	@Select("SELECT * FROM " + "( SELECT rownum rn, a.* " + "FROM (SELECT * FROM indimember "
			+ "where name Like '%' || #{keyword} || '%' or userid Like '%' || #{keyword} || '%' ORDER BY userid asc) a ) "
			+ "WHERE rn BETWEEN #{startNum} AND #{endNum} ")
	List<Member> selectSearchAllPaging(@Param("keyword") String keyword, @Param("startNum") int startNum,
			@Param("endNum") int endNum);

	/* book */

	// [tpbook - all] 전체 데이터 개수
	@Select("select count(*) from tpbook ")
	int selectBookAllCount();

	// [tpbook - keyword] 키워드 검색 데이터 개수
	@Select("select count(*) from tpbook where title Like '%' || #{keyword} || '%' or author Like '%' || #{keyword} || '%' ")
	int selectBookAllKeywordCount(String keyword);

	// [tpbook - title + keyword] 책 제목 + 키워드 검색 데이터 개수
	@Select("select count(*) from tpbook where title Like '%' || #{keyword} || '%' ")
	int selectBookTitleCount(String keyword);

	// [tpbook - author + keyword] 저자 + 키워드 검색 데이터 개수
	@Select("select count(*) from tpbook where author Like '%' || #{keyword} || '%' ")
	int selectBookAuthorCount(String keyword);

	// [tpbook - all] 전체 데이터 출력
	@Select("select * from tpbook ")
	List<Book> selectBookAll();

	// [tpbook - all] 전체 검색 + 페이징
	@Select("SELECT * FROM " + "( SELECT rownum rn, a.* " + "FROM (SELECT * FROM tpbook "
			+ "where title Like '%' || #{keyword} || '%' or author Like '%' || #{keyword} || '%' ORDER BY title asc) a ) "
			+ "WHERE rn BETWEEN #{startNum} AND #{endNum} ")
	List<Book> selectBookSearchAllPaging(@Param("keyword") String keyword, @Param("startNum") int startNum,
			@Param("endNum") int endNum);

	// [tpbook - title] 책 제목 검색 + 페이징
	@Select("SELECT * FROM " + "( SELECT rownum rn, a.* " + "FROM (SELECT * FROM tpbook "
			+ "where title Like '%' || #{keyword} || '%' ORDER BY title asc) a ) "
			+ "WHERE rn BETWEEN #{startNum} AND #{endNum} ")
	List<Book> selectBookSearchTitlePaging(@Param("keyword") String keyword, @Param("startNum") int startNum,
			@Param("endNum") int endNum);

	// [tpbook - author] 저자 검색 + 페이징
	@Select("SELECT * FROM " + "( SELECT rownum rn, a.* " + "FROM (SELECT * FROM tpbook "
			+ "where author Like '%' || #{keyword} || '%' ORDER BY title asc) a ) "
			+ "WHERE rn BETWEEN #{startNum} AND #{endNum} ")
	List<Book> selectBookSearchAuthorPaging(@Param("keyword") String keyword, @Param("startNum") int startNum,
			@Param("endNum") int endNum);

	
	/* bookCheck */
	// [tpbook - all] 전체 데이터 개수
	@Select("select count(*) from tpbook where bookstate = '대기'")
	int selectBookAllCountCheck();

	// [tpbook - keyword] 키워드 검색 데이터 개수
	@Select("select count(*) from tpbook where (title like '%' || #{keyword} || '%' or author like '%' || #{keyword} || '%') and bookstate = '대기'")
	int selectBookAllKeywordCountCheck(String keyword);

	// [tpbook - title + keyword] 책 제목 + 키워드 검색 데이터 개수
	@Select("select count(*) from tpbook where title Like '%' || #{keyword} || '%' and bookstate = '대기'")
	int selectBookTitleCountCheck(String keyword);

	// [tpbook - author + keyword] 저자 + 키워드 검색 데이터 개수
	@Select("select count(*) from tpbook where userid Like '%' || #{keyword} || '%' and bookstate = '대기'")
	int selectBookAuthorCountCheck(String keyword);

	// [tpbook - all] 전체 데이터 출력
	@Select("select * from tpbook where bookstate = '대기'")
	List<Book> selectBookAllCheck();

	// [tpbook - all] 전체 검색 + 페이징
	@Select("SELECT * FROM " + 
	        "( SELECT rownum rn, a.* " + 
	        "FROM (SELECT * FROM tpbook " + 
	        "WHERE (title LIKE '%' || #{keyword} || '%' OR userid LIKE '%' || #{keyword} || '%') " + 
	        "AND bookstate = '대기' " + 
	        "ORDER BY title asc) a ) " + 
	        "WHERE rn BETWEEN #{startNum} AND #{endNum} ")
	List<Book> selectBookSearchAllPagingCheck(@Param("keyword") String keyword, @Param("startNum") int startNum,
			@Param("endNum") int endNum);

	// [tpbook - title] 책 제목 검색 + 페이징
	@Select("SELECT * FROM " + 
	        "( SELECT rownum rn, a.* " + 
	        "FROM (SELECT * FROM tpbook " + 
	        "WHERE title LIKE '%' || #{keyword} || '%' AND bookstate = '대기' " + 
	        "ORDER BY title asc) a ) " + 
	        "WHERE rn BETWEEN #{startNum} AND #{endNum} ")
	List<Book> selectBookSearchTitlePagingCheck(@Param("keyword") String keyword, @Param("startNum") int startNum,
			@Param("endNum") int endNum);

	// [tpbook - author] 저자 검색 + 페이징
	@Select("SELECT * FROM " + 
	        "( SELECT rownum rn, a.* " + 
	        "FROM (SELECT * FROM tpbook " + 
	        "WHERE userid LIKE '%' || #{keyword} || '%' AND bookstate = '대기' " + 
	        "ORDER BY title asc) a ) " + 
	        "WHERE rn BETWEEN #{startNum} AND #{endNum} ")

	List<Book> selectBookSearchAuthorPagingCheck(@Param("keyword") String keyword, @Param("startNum") int startNum,
			@Param("endNum") int endNum);
	
	/* inquiry */

	// [inquiry - 관리자] 답변여부 All 데이터 개수
	@Select("select count(*) from tpinquiry where "
			+ " (TRUNC(createdate) between #{fromDate} and #{toDate} or TRUNC(createdate) = #{toDate}) ")
	int selectInquriyAdminAllCount(@Param("fromDate") String fromDate, @Param("toDate") String toDate);

	// [inquiry - 관리자] 전체 데이터 - 답변여부 All
	@Select("SELECT * FROM " + "( SELECT rownum rn, a.* " + "FROM (SELECT * FROM tpinquiry "
			+ "where (TRUNC(createdate) between #{fromDate} and #{toDate} or TRUNC(createdate) = #{toDate}) "
			+ "	order by inquiryid) a ) " + "WHERE rn BETWEEN #{startNum} AND #{endNum} ")
	List<Inquiry> selectInquiryOptionsAll(@Param("fromDate") String fromDate, @Param("toDate") String toDate,
			@Param("startNum") int startNum, @Param("endNum") int endNum);

	// [inquiry - 관리자] 답변여부구분 총 데이터 개수
	@Select("select count(*) from tpinquiry where "
			+ " (TRUNC(createdate) between #{fromDate} and #{toDate} or TRUNC(createdate) = #{toDate})"
			+ " and responsestatus = #{responseStatus} ")
	int selectInquiryOptionsCount(@Param("fromDate") String fromDate, @Param("toDate") String toDate,
			@Param("responseStatus") int responseStatus);

	// [inquiry - 관리자] 전체 데이터 - 답변여부 All
	@Select("SELECT * FROM " + "( SELECT rownum rn, a.* " + "FROM (SELECT * FROM tpinquiry "
			+ "where (TRUNC(createdate) between #{fromDate} and #{toDate} or TRUNC(createdate) = #{toDate}) "
			+ "and responsestatus = #{responseStatus} "
			+ "	order by inquiryid) a ) " + "WHERE rn BETWEEN #{startNum} AND #{endNum} ")
	List<Inquiry> selectInquiryOptions(@Param("fromDate") String fromDate, @Param("toDate") String toDate,
			@Param("startNum") int startNum, @Param("endNum") int endNum, @Param("responseStatus") int responseStatus);
	
	

}
