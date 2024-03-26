package mybatis;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Faq;
import model.IndiMember;
import model.Point;
import model.Review;


public interface MemberAnno {
	@Insert("insert into indimember values (#{name}, #{userid}, #{email}, #{pass}, "
			+ "	 #{tel}, #{addr}, #{birthday}, 0, 0, #{gender})")
	int insertindiMember(IndiMember mem);
	
	@Select("select * from indimember where userid=#{userid}")
	IndiMember oneMember(String login);
	
	@Update("update indimember set "
			+ "name=#{name}, email=#{email}, tel=#{tel}, addr=#{addr}, point=#{point} "
			+ "where userid=#{userid}")
	int updateIndimember(IndiMember mem);
	
	@Delete("delete indimember where userid=#{userid}")
	int deleteMember(String userid);
	
	@Update("update indimember set pass=#{pass} where userid=#{userid}")
	int passMember(Map map);
	
	@Select("select * from indimember where name=#{name} and email=#{email}")
	IndiMember findId(Map map);
	
	@Select("select * from indimember where userid=#{userid} and email=#{email}")
	IndiMember findPass(Map map);
	@Update("update indimember set pass=#{pass} where userid=#{userid} and email=#{email}")
	int updatePass(Map map);
	
	//아이디 중복체크
	@Select("select count(*) from indimember where userid=#{userid}")
	int useridConfirm(String userid);
	
	//보유 포인트 출력
	@Select("SELECT POINT FROM INDIMEMBER WHERE USERID = #{userid}")
	int calcPoint(String userid);
	//누적 포인트 계산
	@Select("SELECT NVL(SUM(CHANGEPOINT),0) AS TOTALPOINT FROM TPPOINTLOG WHERE USERID = #{userid} AND CHANGEPOINT > 0")
	int accPoint(String userid);
	
	@Select("SELECT * FROM TPPOINTLOG WHERE USERID = #{userid}")
	List<Point> pointLogList(@Param("userid") String userid);
	
	//내가 쓴 리뷰
	@Select("select a.*,b.title from"
			+ "(SELECT booknum,point,review,reviewdate FROM TPREVIEW WHERE USERID = #{userid})a,tpbook b "
			+ "where a.booknum = b.booknum") 
	List<Review> myReview(@Param("userid") String userid);
}
