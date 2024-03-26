package dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.Book;
import model.Event;
import model.Faq;
import model.Member;
import model.OneOnOne;
import model.Search;
import model.oneOnOneModel.Inquiry;
import model.oneOnOneModel.Reply;
import mybatis.AdminAnno;
import mybatis.EventAnno;
import mybatis.FaqAnno;
import mybatis.OneOnOneAnno;
import paging.Paging;

@Component
public class AdminDao {

	// mybatis DB연결
	@Autowired
	SqlSessionTemplate sqlSession;

	// indimember 테이블의 전체 데이터 개수
	public int selectMemberAllCount() {
		return sqlSession.getMapper(AdminAnno.class).selectMemberAllCount();
	}

	// indimember 출력 메소드 (전체 + 페이징)
	public List<Member> selectAllPaging(Paging paging) {
		int startNum = paging.getStartNum();
		int endNum = paging.getEndNum();
		return sqlSession.getMapper(AdminAnno.class).selectAllPaging(startNum, endNum);
	}

	// indimember 테이블의 카테고리 데이터 개수
	public int selectCountCate(Search search) {

		String keyword = search.getSearchKeyword();
		String category = search.getSearchType();

		if (category.equals("name")) { // 이름 값으로 검색
			return sqlSession.getMapper(AdminAnno.class).selectNameCount(keyword);
		}

		// id값으로 검색
		return sqlSession.getMapper(AdminAnno.class).selectIdCount(keyword);
	}

	// indimember 출력 메소드 (카테고리 + 페이징)
	public List<Member> selectSearchPaging(Paging paging, Search search) {
		int startNum = paging.getStartNum();
		int endNum = paging.getEndNum();

		String keyword = search.getSearchKeyword();
		String category = search.getSearchType();

		if (category.equals("name")) { // 이름 값으로 검색
			return sqlSession.getMapper(AdminAnno.class).selectNamePaging(keyword, startNum, endNum);
		}

		// id값으로 검색
		return sqlSession.getMapper(AdminAnno.class).selectIdPaging(keyword, startNum, endNum);
	}

	// indimember 테이블의 전체 카테고리 + 키워드 + 개수
	public int selectAllCateCount(Search search) {
		return sqlSession.getMapper(AdminAnno.class).selectAllCateCount(search.getSearchKeyword());
	}

	// indimember 출력 메소드 (전체 + 페이징)
	public List<Member> selectSearchAllPaging(Paging paging, Search search) {
		int startNum = paging.getStartNum();
		int endNum = paging.getEndNum();

		String keyword = search.getSearchKeyword();

		return sqlSession.getMapper(AdminAnno.class).selectSearchAllPaging(keyword, startNum, endNum);
	}

	// [tpbook] 테이블의 전체 카테고리 + 키워드 + 개수
	public int selectBookOptionCount(Search search) {

		String keyword = search.getSearchKeyword();
		String category = search.getSearchType();

		if (keyword == null || keyword.equals("null") || keyword.isEmpty()) { // 전체 book 데이터값
			return sqlSession.getMapper(AdminAnno.class).selectBookAllCount();
		} else if (!keyword.isEmpty() && category.isEmpty()) { // 키워드로만 검색
			return sqlSession.getMapper(AdminAnno.class).selectBookAllKeywordCount(keyword);
		} else { // 키워드 + 카테고리 검색

			if (category.equals("title")) { // 카테고리 - 책 제목 검색
				return sqlSession.getMapper(AdminAnno.class).selectBookTitleCount(keyword);
			} else { // 카테고리 - 저자 검색
				return sqlSession.getMapper(AdminAnno.class).selectBookAuthorCount(keyword);
			}

		}
	}

	// [tpbook] 테이블의 전체 카테고리 + 키워드 + 페이징
	public List<Book> selectBookSearchPaging(Paging paging, Search search) {
		int startNum = paging.getStartNum();
		int endNum = paging.getEndNum();

		String keyword = search.getSearchKeyword();
		String category = search.getSearchType();

		if (keyword == null || keyword.equals("null") || keyword.isEmpty()) { // 전체 book 데이터값
			return sqlSession.getMapper(AdminAnno.class).selectBookAll();
		} else if (!keyword.isEmpty() && category.isEmpty()) { // 키워드로만 검색
			return sqlSession.getMapper(AdminAnno.class).selectBookSearchAllPaging(keyword, startNum, endNum);
		} else { // 키워드 + 카테고리 검색

			if (category.equals("title")) { // 카테고리 - 책 제목 검색
				return sqlSession.getMapper(AdminAnno.class).selectBookSearchTitlePaging(keyword, startNum, endNum);
			} else { // 카테고리 - 저자 검색
				return sqlSession.getMapper(AdminAnno.class).selectBookSearchAuthorPaging(keyword, startNum, endNum);
			}

		}
	}
	
//도서 등록
	// [tpbook] 테이블의 전체 카테고리 + 키워드 + 개수
	public int selectBookOptionCountCheck(Search search) {

		String keyword = search.getSearchKeyword();
		String category = search.getSearchType();

		if (keyword == null || keyword.equals("null") || keyword.isEmpty()) { // 전체 book 데이터값
			return sqlSession.getMapper(AdminAnno.class).selectBookAllCountCheck();
		} else if (!keyword.isEmpty() && category.isEmpty()) { // 키워드로만 검색
			return sqlSession.getMapper(AdminAnno.class).selectBookAllKeywordCountCheck(keyword);
		} else { // 키워드 + 카테고리 검색

			if (category.equals("title")) { // 카테고리 - 책 제목 검색
				return sqlSession.getMapper(AdminAnno.class).selectBookTitleCountCheck(keyword);
			} else { // 카테고리 - 저자 검색
				return sqlSession.getMapper(AdminAnno.class).selectBookAuthorCountCheck(keyword);
			}

		}
	}

	// [tpbook] 테이블의 전체 카테고리 + 키워드 + 페이징
	public List<Book> selectBookSearchPagingCheck(Paging paging, Search search) {
		int startNum = paging.getStartNum();
		int endNum = paging.getEndNum();

		String keyword = search.getSearchKeyword();
		String category = search.getSearchType();

		if (keyword == null || keyword.equals("null") || keyword.isEmpty()) { // 전체 book 데이터값
			return sqlSession.getMapper(AdminAnno.class).selectBookAllCheck();
		} else if (!keyword.isEmpty() && category.isEmpty()) { // 키워드로만 검색
			return sqlSession.getMapper(AdminAnno.class).selectBookSearchAllPagingCheck(keyword, startNum, endNum);
		} else { // 키워드 + 카테고리 검색

			if (category.equals("title")) { // 카테고리 - 책 제목 검색
				return sqlSession.getMapper(AdminAnno.class).selectBookSearchTitlePagingCheck(keyword, startNum, endNum);
			} else { // 카테고리 - 저자 검색
				return sqlSession.getMapper(AdminAnno.class).selectBookSearchAuthorPagingCheck(keyword, startNum, endNum);
			}

		}
	}

	/* inquiry */

	// 1대1문의 관리자 - 기간별 + 답변 여부 All inquiry 총 개수
	public int selectInquriyAdminAllCount(String fromDate, String toDate) {
		return sqlSession.getMapper(AdminAnno.class).selectInquriyAdminAllCount(fromDate, toDate);
	}

	// 1대1문의 관리자 - 답변여부 구분 + 기간별 inquiry 총 개수
	public int selectInquriyAdminCount(String fromDate, String toDate, String replyYn) {

		// 1. 1대1 질문 게시글 list 조회
		int responseStatus = 0;

		if (replyYn.equals("Y")) {
			responseStatus = 1;
		}

		int result = sqlSession.getMapper(AdminAnno.class).selectInquiryOptionsCount(fromDate, toDate, responseStatus);

		return result;
	}

	// 1대1문의 관리자 - 기간별로 inquiry 조회 메소드 (답변여부 = all) + 페이징
	public List<OneOnOne> selectInquiryAll(String fromDate, String toDate, Paging paging) {

		int startNum = paging.getStartNum();
		int endNum = paging.getEndNum();

		// 1. 1대1 질문 게시글 list 조회
		List<Inquiry> inquiryList = sqlSession.getMapper(AdminAnno.class).selectInquiryOptionsAll(fromDate, toDate,
				startNum, endNum);

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

	// 1대1문의 관리자 - 기간별로 inquiry 조회 메소드 (답변여부) + 페이징
	public List<OneOnOne> selectInquiryOptions(String fromDate, String toDate, Paging paging, String replyYn) {

		int startNum = paging.getStartNum();
		int endNum = paging.getEndNum();

		int responseStatus = 0;

		if (replyYn.equals("Y")) {
			responseStatus = 1;
		}

		// 1. 1대1 질문 게시글 list 조회
		List<Inquiry> inquiryList = sqlSession.getMapper(AdminAnno.class).selectInquiryOptions(fromDate, toDate,
				startNum, endNum, responseStatus);

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

}
