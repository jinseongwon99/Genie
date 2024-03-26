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
import mybatis.UserBookAnno;
import paging.Paging;

@Component
public class UserBookDao {

	// mybatis DB연결
	@Autowired
	SqlSessionTemplate sqlSession;

	
	// [tpbook] 테이블의 전체 카테고리 + 키워드 + 개수
	public int selectBookOptionCount(Search search, String userid) {

		String keyword = search.getSearchKeyword();
		String category = search.getSearchType();

		if (keyword == null || keyword.equals("null") || keyword.isEmpty() ) { // 전체 book 데이터값
			return sqlSession.getMapper(UserBookAnno.class).selectBookAllCount(userid);
		} else if (!keyword.isEmpty() && category.isEmpty()) { // 키워드로만 검색
			return sqlSession.getMapper(UserBookAnno.class).selectBookAllKeywordCount(keyword, userid);
		} else { // 키워드 + 카테고리 검색

			if (category.equals("title")) { // 카테고리 - 책 제목 검색
				return sqlSession.getMapper(UserBookAnno.class).selectBookTitleCount(keyword, userid);
			} else { // 카테고리 - 저자 검색
				return sqlSession.getMapper(UserBookAnno.class).selectBookAuthorCount(keyword, userid);
			}

		}
	}

	// [tpbook] 테이블의 전체 카테고리 + 키워드 + 페이징
	public List<Book> selectBookSearchPaging(Paging paging, Search search, String userid) {
		int startNum = paging.getStartNum();
		int endNum = paging.getEndNum();

		String keyword = search.getSearchKeyword();
		String category = search.getSearchType();

		if (keyword == null || keyword.equals("null") || keyword.isEmpty()) { // 전체 book 데이터값
			return sqlSession.getMapper(UserBookAnno.class).selectBookAll(startNum, endNum, userid);
		} else if (!keyword.isEmpty() && category.isEmpty()) { // 키워드로만 검색
			return sqlSession.getMapper(UserBookAnno.class).selectBookSearchAllPaging(keyword, startNum, endNum, userid);
		} else { // 키워드 + 카테고리 검색

			if (category.equals("title")) { // 카테고리 - 책 제목 검색
				return sqlSession.getMapper(UserBookAnno.class).selectBookSearchTitlePaging(keyword, startNum, endNum, userid);
			} else { // 카테고리 - 저자 검색
				return sqlSession.getMapper(UserBookAnno.class).selectBookSearchAuthorPaging(keyword, startNum, endNum, userid);
			}

		}
	}

}
