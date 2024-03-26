package mybatis;

import java.util.Map;

import org.apache.ibatis.annotations.Insert;

import model.Book;
import model.Review;


public interface TpBookAnno {
	@Insert(" insert into tpbook values (tpbookseq.nextval ,#{title},#{inventory},#{author},#{category},#{price},#{pubdate},#{bookimg},#{summary},#{publisher},#{userid},sysdate+100,#{bookstate},#{grade})")
	int insertBook(Book book);
	@Insert("insert into review values (tpreviewseq.nextval,#{booknum},#{userid},#{point},#{review},sysdate)" )
	int insertreview(Map map);
}
