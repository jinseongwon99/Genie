package dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.Event;
import model.Notice;
import mybatis.EventAnno;
import mybatis.NoticeAnno;
import paging.Paging;

@Component
public class EventDao {

	// mybatis DB연결
	@Autowired
	SqlSessionTemplate sqlSession;

	// 이벤트 등록 메소드
	public int insertEvent(Event event) {
		return sqlSession.getMapper(EventAnno.class).insertEvent(event);
	}

	// 이벤트 출력 메소드
	public List<Event> selectPageEvent(Paging paging) {
		int startNum = paging.getStartNum();
		int endNum = paging.getEndNum();
		return sqlSession.getMapper(EventAnno.class).selectPageEvent(startNum, endNum);
	}

	// 이벤트 총 개수 출력 메소드
	public int selectEventCount() {
		return sqlSession.getMapper(EventAnno.class).selectEventCount();
	}

	// eventId 컬럼으로 데이터 찾기
	public Event selectEventId(int eventId) {
		return sqlSession.getMapper(EventAnno.class).selectEventId(eventId);
	}

	// 이벤트 수정
	public int updateEventId(Event event) {
		return sqlSession.getMapper(EventAnno.class).updateEvent(event);
	}

	// 이벤트 삭제
	public int deleteEventId(int eventId) {
		return sqlSession.getMapper(EventAnno.class).deleteEvent(eventId);
	}
	
	
	// 01.26 수정 // 
	// 이벤트 최신이벤트 3개 출력 (메인화면 배너 연결)
	public List<Event> selectThree() {
		return sqlSession.getMapper(EventAnno.class).selectThree();
	}
	// ====== //
	

}
