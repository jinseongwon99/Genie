package dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.Event;
import model.OneOnOne;
import model.oneOnOneModel.Inquiry;
import model.oneOnOneModel.Reply;
import mybatis.EventAnno;
import mybatis.OneOnOneAnno;
import paging.Paging;

@Component
public class OneOnOneDao {

	// mybatis DB연결
	@Autowired
	SqlSessionTemplate sqlSession;

	// inquiry 등록 메소드
	public int insertInquiry(Inquiry inquiry) {
		return sqlSession.getMapper(OneOnOneAnno.class).insertInquiry(inquiry);
	}

	// 기간별, 답변여부로 inquiry 조회 메소드
	public List<OneOnOne> selectInquiry(String userId, String fromDate, String toDate, String replyYn) {

		// 1. 1대1 질문 게시글 list 조회
		int responseStatus = 0;

		if (replyYn.equals("Y")) {
			responseStatus = 1;
		}

		List<Inquiry> inquiryList = sqlSession.getMapper(OneOnOneAnno.class).selectInquiryOptions(userId, fromDate,
				toDate, responseStatus);

		// 3. 1대1 답변 게시글 list 조회
		List<OneOnOne> result = new ArrayList<>();
		for (Inquiry inquiry : inquiryList) {
			Reply reply = sqlSession.getMapper(OneOnOneAnno.class).selectReply(inquiry.getInquiryId());
			result.add(new OneOnOne(inquiry, reply));
		}

		return result;
	}

	// 기간별로 inquiry 조회 메소드 (답변여부 = all)
	public List<OneOnOne> selectInquiryAll(String userId, String fromDate, String toDate) {

		// 1. 1대1 질문 게시글 list 조회
		List<Inquiry> inquiryList = sqlSession.getMapper(OneOnOneAnno.class).selectInquiryOptionsAll(userId, fromDate,
				toDate);

		// 2. 1대1 답변 게시글 list 조회
		List<OneOnOne> result = new ArrayList<>();
		for (Inquiry inquiry : inquiryList) {

			if (inquiry.getResponseStatus() == 0) { // 답변 X
				result.add(new OneOnOne(inquiry, null));
			} else { // 답변 O
				Reply reply = sqlSession.getMapper(OneOnOneAnno.class).selectReply(inquiry.getInquiryId());
				result.add(new OneOnOne(inquiry, reply));
			}

		}

		return result;
	}

	// inquiryid 값으로 tpinquiry 조회 
	public Inquiry selectInquriyId(int inquiryid) {
		return sqlSession.getMapper(OneOnOneAnno.class).selectInquiryId(inquiryid);
	}

	// inquiry 답변 안된 질문 select 전체 개수
	public int selectInquriyResponseCount() {
		return sqlSession.getMapper(OneOnOneAnno.class).selectInquriyResponseCount();
	}

	// 질문 출력 메소드 + 페이징
	public List<Inquiry> selectPageInquiry(Paging paging) {
		int startNum = paging.getStartNum();
		int endNum = paging.getEndNum();
		return sqlSession.getMapper(OneOnOneAnno.class).selectPageInquiry(startNum, endNum);
	}

	// inquiry 수정 메소드 - 답변 여부 수정
	public int updateInquiry(int inquiryid) {
		return sqlSession.getMapper(OneOnOneAnno.class).updateInquiry(inquiryid);
	}

	// [reply] 답변 등록 메소드
	public int insertReply(Reply reply) {
		return sqlSession.getMapper(OneOnOneAnno.class).insertReply(reply);
	}

}
