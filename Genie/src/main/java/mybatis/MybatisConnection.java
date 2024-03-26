package mybatis;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MybatisConnection {

	private static SqlSessionFactory sqlmap;

	static {
		Reader reader;
		try {

			// MyBatis 설정파일을 읽어오기
			reader = Resources.getResourceAsReader("/mybatis/mybatis-config.xml");

			// SqlSessionFactory를 빌드하여 초기화
			sqlmap = new SqlSessionFactoryBuilder().build(reader);
			System.out.println("config ok");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// DB 연결
	public static SqlSession getConnection() {
		return sqlmap.openSession();
	}

	// DB 연결 종료
	public static void close(SqlSession session) {
		session.commit();
		session.close();
	}

	// 테스트 실행
	public static void main(String[] args) {
		SqlSession sqlsession = getConnection();
		System.out.println(sqlsession);
	}

}
