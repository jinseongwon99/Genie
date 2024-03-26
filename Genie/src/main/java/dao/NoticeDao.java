package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.Notice;
import model.Search;
import mybatis.NoticeAnno;
import paging.Paging;

@Component
public class NoticeDao {

	// mybatis DB연결
	@Autowired
	SqlSessionTemplate sqlSession;

	// 공지사항 등록 메소드
	public int insertNotice(Notice notice) {
		return sqlSession.getMapper(NoticeAnno.class).insertNotice(notice);
	}

	// 공지사항 출력 메소드
	public List<Notice> selectPageNotice(Paging paging) {
		int startNum = paging.getStartNum();
		int endNum = paging.getEndNum();
		return sqlSession.getMapper(NoticeAnno.class).selectPageNotice(startNum, endNum);
	}

	// 공지사항 총 개수 출력 메소드
	public int selectNoticeCount() {
		return sqlSession.getMapper(NoticeAnno.class).selectNoticeCount();
	}

	// noticeid 컬럼으로 데이터 찾기
	public Notice selectNoticeId(int noticeId) {
		return sqlSession.getMapper(NoticeAnno.class).selectNoticeId(noticeId);
	}

	// 공지사항 수정
	public int updateNoticeId(Notice notice) {
		return sqlSession.getMapper(NoticeAnno.class).updateNotice(notice);
	}

	// 공지사항 삭제
	public int deleteNoticeId(int noticeId) {
		return sqlSession.getMapper(NoticeAnno.class).deleteNotice(noticeId);
	}

	// 공지사항 검색1 (전체 + 키워드)
	public List<Notice> searchAllNotice(String keyword, Paging paging) {
		int startNum = paging.getStartNum();
		int endNum = paging.getEndNum();
		return sqlSession.getMapper(NoticeAnno.class).searchAllNotice(keyword, startNum, endNum);
	}

	// 공지사항 검색1 - 총 개수 출력 메소드
	public int searchAllNoticeCount(String keyword) {
		return sqlSession.getMapper(NoticeAnno.class).searchAllNoticeCount(keyword);
	}

	// 공지사항 검색2 (searchType + 키워드)
	public List<Notice> searchOptionNotice(Search search, Paging paging) {
		int startNum = paging.getStartNum();
		int endNum = paging.getEndNum();
		
		if (search.getSearchType().equals("title")) {	// 검색 조건이 title일 경우 
			return sqlSession.getMapper(NoticeAnno.class).searchTitleNotice(search, startNum, endNum);
		} else {
			return sqlSession.getMapper(NoticeAnno.class).searchContentNotice(search, startNum, endNum);
		}
	}

	// 공지사항 검색2 - 총 개수 출력 메소드
	public int searchOptionNoticeCount(Search search) {
		if (search.getSearchType().equals("title")) {
			return sqlSession.getMapper(NoticeAnno.class).searchTitleNoticeCount(search);
		} else {
			return sqlSession.getMapper(NoticeAnno.class).searchContentNoticeCount(search);
		}
	}
	
	//최신 공지사항 한줄 출력
	public Notice getOneNotice() {
		return sqlSession.getMapper(NoticeAnno.class).getOneNotice();
	}

}
