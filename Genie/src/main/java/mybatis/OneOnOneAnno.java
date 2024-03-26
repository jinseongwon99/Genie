package mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import model.Event;
import model.OneOnOne;
import model.oneOnOneModel.Inquiry;
import model.oneOnOneModel.Reply;

public interface OneOnOneAnno {

	// inquiry 질문 작성
	@Insert("insert into tpinquiry values "
			+ "(inquiryseq.nextval, #{userId}, #{category}, #{orderId}, #{title}, #{content}, " + "sysdate, 0) ")
	int insertInquiry(Inquiry inquiry);

	// inquiry 수정 (답변 여부 수정)
	@Insert("update tpinquiry set " + "responsestatus = 1 where inquiryid = #{inquiryid} ")
	int updateInquiry(int inquiryid);

	// userId로 검색
	@Select("select * from tpinquiry where userid = #{userId}")
	List<OneOnOne> selectInquiryUserId();

	// [tpinquiry] inquiryId로 검색
	@Select("select * from tpinquiry where inquiryid = #{inquiryid}")
	Inquiry selectInquiryId(int inquiryid);

	// [tpinquiry] 기간 + 답변 여부로 검색
	@Select("select * from tpinquiry " + "where userid = #{userId} "
			+ "and (TRUNC(createdate) between #{fromDate} and #{toDate} or TRUNC(createdate) = #{toDate}) "
			+ "and responsestatus = #{responseStatus} " + "order by inquiryid")
	List<Inquiry> selectInquiryOptions(@Param("userId") String userId, @Param("fromDate") String fromDate,
			@Param("toDate") String toDate, @Param("responseStatus") int responseStatus);

	// [tpinquiry] 기간으로 검색 (답변여부 = all)
	@Select("select * from tpinquiry " + "where userid = #{userId} "
			+ "and (TRUNC(createdate) between #{fromDate} and #{toDate} " + "or TRUNC(createdate) = #{toDate}) "
			+ "order by inquiryid")
	List<Inquiry> selectInquiryOptionsAll(@Param("userId") String userId, @Param("fromDate") String fromDate,
			@Param("toDate") String toDate);

	// [tpreply] 질문id값으로 답변 조회
	@Select("select * from tpreply " + "where inquiryid = #{inquiryId} " + "order by inquiryid")
	Reply selectReply(int inquiryId);

	// [tpinquiry] 테이블의 responsestatus = 0인 데이터의 개수
	@Select("select count(*) from tpinquiry ")
	int selectInquriyCount();

	// [tpinquiry] 테이블의 responsestatus = 0인 데이터의 개수
	@Select("select count(*) from tpinquiry where responsestatus = 0 ")
	int selectInquriyResponseCount();

	// [tpinquiry] 테이블의 responseStatus = 0인 데이터 + 페이징
	@Select("SELECT * FROM (" + "  SELECT rownum rn, a.* "
			+ "  FROM (SELECT * FROM tpinquiry where responsestatus = 0 ORDER BY inquiryid asc) a" + ") "
			+ "WHERE rn BETWEEN #{startNum} AND #{endNum}")
	List<Inquiry> selectPageInquiry(@Param("startNum") int startNum, @Param("endNum") int endNum);

	// reply 답변 작성
	@Insert("insert into tpreply values " + "(replyseq.nextval, #{inquiryId}, #{replyContent}, sysdate) ")
	int insertReply(Reply reply);
}
