package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.Event;
import model.Faq;
import model.Notice;
import model.Search;
import mybatis.EventAnno;
import mybatis.FaqAnno;
import mybatis.NoticeAnno;
import paging.Paging;

@Component
public class FaqDao {

	// mybatis DB연결
	@Autowired
	SqlSessionTemplate sqlSession;

	// Faq 등록 메소드
	public int insertFaq(Faq faq) {
		return sqlSession.getMapper(FaqAnno.class).insertFaq(faq);
	}

	// Faq 출력 메소드 (전체 + 페이징)
	public List<Faq> selectPageFaq(Paging paging) {
		int startNum = paging.getStartNum();
		int endNum = paging.getEndNum();
		return sqlSession.getMapper(FaqAnno.class).selectPageFaq(startNum, endNum);
	}

	// Faq 출력 메소드 (카테고리별 + 페이징)
	public List<Faq> selectPageFaqCate(Paging paging, String category) {
		int startNum = paging.getStartNum();
		int endNum = paging.getEndNum();
		return sqlSession.getMapper(FaqAnno.class).selectPageFaqCate(category, startNum, endNum);
	}

	// Faq 총 개수 출력 메소드
	public int selectFaqCount() {
		return sqlSession.getMapper(FaqAnno.class).selectFaqCount();
	}

	// Faq 카테고리별 총 개수 출력 메소드
	public int selectFaqCountCate(String category) {
		return sqlSession.getMapper(FaqAnno.class).selectFaqCountCate(category);
	}

	// faqid 컬럼으로 데이터 찾기
	public Faq selectFaqId(int faqId) {
		return sqlSession.getMapper(FaqAnno.class).selectFaqId(faqId);
	}

	// Faq 수정
	public int updateFaqId(Faq faq) {
		return sqlSession.getMapper(FaqAnno.class).updateFaqId(faq);
	}

	// Faq 삭제
	public int deleteFaqId(int faqId) {
		return sqlSession.getMapper(FaqAnno.class).deleteFaqId(faqId);
	}

	// Faq 검색1 (전체 + 키워드)
	public List<Faq> searchAllFaq(String keyword, Paging paging) {
		int startNum = paging.getStartNum();
		int endNum = paging.getEndNum();

		return sqlSession.getMapper(FaqAnno.class).searchAllFaq(keyword, startNum, endNum);
	}

	// ==> Faq 검색1 - 총 개수
	public int searchAllFaqCount(String keyword) {
		return sqlSession.getMapper(FaqAnno.class).searchAllFaqCount(keyword);
	}

	// Faq 검색2 (카테고리 + 키워드)
	public List<Faq> searchOptionFaq(Search search, Paging paging) {
		int startNum = paging.getStartNum();
		int endNum = paging.getEndNum();
		
		return sqlSession.getMapper(FaqAnno.class).searchOptionFaq(search, startNum, endNum);
	}

	// ==> Faq 검색2 - 총 개수
	public int searchOptionFaqCount(Search search) {
		
		return sqlSession.getMapper(FaqAnno.class).searchOptionFaqCount(search);
	}

}
