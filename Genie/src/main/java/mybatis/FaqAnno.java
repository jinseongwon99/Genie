package mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Event;
import model.Faq;
import model.Search;

public interface FaqAnno {

	@Insert("insert into tpfaq values " + "(faqseq.nextval, #{category}, #{question}, #{answer}, sysdate) ")
	int insertFaq(Faq faq);

	// 전체 조회 + 페이징
	@Select("SELECT * FROM (" + "  SELECT rownum rn, a.* " + "  FROM (SELECT * FROM tpfaq ORDER BY faqid DESC) a" + ") "
			+ "WHERE rn BETWEEN #{startNum} AND #{endNum}")
	List<Faq> selectPageFaq(@Param("startNum") int startNum, @Param("endNum") int endNum);

	// 카테고리로 조회 + 페이징
	@Select("SELECT * FROM (" + "  SELECT rownum rn, a.* "
			+ "  FROM (SELECT * FROM tpfaq where category = #{category} ORDER BY faqid DESC) a" + ") "
			+ "WHERE rn BETWEEN #{startNum} AND #{endNum}")
	List<Faq> selectPageFaqCate(@Param("category") String category, @Param("startNum") int startNum,
			@Param("endNum") int endNum);

	@Select("select count(*) from tpfaq order by faqid ")
	int selectFaqCount();

	@Select("select count(*) from tpfaq where category = #{category} order by faqid ")
	int selectFaqCountCate(@Param("category") String category);

	@Select("select * from tpfaq where faqid = #{faqid} ")
	Faq selectFaqId(int faqid);

	@Update("update tpfaq set category = #{category}, question = #{question}, answer = #{answer}, createdate  = sysdate where faqid = #{faqId} ")
	int updateFaqId(Faq faq);

	@Delete("delete from tpfaq where faqid = #{faqid} ")
	int deleteFaqId(int faqid);

	// [search] 전체 + keyword 검색
	@Select("SELECT * FROM " + "( SELECT rownum rn, a.* " + "FROM (SELECT * FROM tpfaq "
			+ "where question Like '%' || #{keyword} || '%' or answer Like '%' || #{keyword} || '%' "
			+ "ORDER BY faqid DESC) a ) " + "WHERE rn BETWEEN #{startNum} AND #{endNum} ")
	List<Faq> searchAllFaq(@Param("keyword") String keyword, @Param("startNum") int startNum,
			@Param("endNum") int endNum);

	// ==> 위의 출력 총 개수
	@Select("SELECT count(*) FROM tpfaq " + "where question Like '%' || #{keyword} || '%' "
			+ " or answer Like '%' || #{keyword} || '%' " + "ORDER BY faqid DESC ")
	int searchAllFaqCount(@Param("keyword") String keyword);

	// [search] searchType + keyword 검색
	@Select("SELECT * FROM " + "( SELECT rownum rn, a.* " + "FROM (SELECT * FROM tpfaq "
			+ "where ( question Like '%' || #{search.searchKeyword} || '%' or answer Like '%' || #{search.searchKeyword} || '%' ) "
			+ "and category = #{search.searchType} "
			+ "ORDER BY faqid DESC) a ) "
			+ "WHERE rn BETWEEN #{startNum} AND #{endNum} ")
	List<Faq> searchOptionFaq(@Param("search") Search search, @Param("startNum") int startNum,
			@Param("endNum") int endNum);

	// ==> 위의 출력 총 개수
	@Select("SELECT count(*) FROM tpfaq " 
			+ "where ( question Like '%' || #{search.searchKeyword} || '%' or answer Like '%' || #{search.searchKeyword} || '%' ) "
			+ "and category = #{search.searchType} "
			+ "ORDER BY faqid DESC")
	int searchOptionFaqCount(@Param("search") Search search);

}
