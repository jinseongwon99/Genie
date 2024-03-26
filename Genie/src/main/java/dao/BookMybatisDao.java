package dao;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.Book;
import model.Cart;
import model.Member;
import model.Review;
import model.Slang;
import mybatis.MybatisConnection;

@Component("bd")
public class BookMybatisDao {	
	@Autowired
	SqlSessionTemplate sqlSession;
	private static final String ns = "book.";

	public int insertBook(Book book) throws UnsupportedEncodingException, SQLException {
		 return sqlSession.insert(ns+"insertBook", book);	
	}
	
	public Book oneBook(int booknum) throws UnsupportedEncodingException, SQLException {
		return sqlSession.selectOne(ns + "oneBook", booknum);
	}
	public List<Review> reviewload(int booknum,String userid) throws UnsupportedEncodingException, SQLException {
		Map map = new HashMap();
		map.put("booknum",booknum);
		map.put("userid",userid);
		return sqlSession.selectList(ns + "reviewload", map);
	}
	public String getBirth(String userid) throws UnsupportedEncodingException, SQLException {
		return sqlSession.selectOne(ns + "getBirth", userid);
	}

	public int insertReview(Review r) throws UnsupportedEncodingException, SQLException { 
		return sqlSession.insert(ns+"insertReview",r);
	}
	public int deleteReview(Review r) throws UnsupportedEncodingException, SQLException { 
		return sqlSession.delete(ns+"deleteReview",r);
	}
	public int UpdateReview(Review r) throws UnsupportedEncodingException, SQLException { 
		return sqlSession.update(ns+"UpdateReview",r);
	}

	public List<Review> reviewList(int booknum, int pageInt) throws UnsupportedEncodingException, SQLException { 
		Map map = new HashMap();
		map.put("booknum", booknum);
		map.put("max", (pageInt)*5);
		return sqlSession.selectList(ns + "reviewList", map);
	}
	public String checkReview(int booknum, String userid) throws UnsupportedEncodingException, SQLException {
        Map map = new HashMap();
        map.put("booknum", booknum);
        map.put("userid", userid);
		return sqlSession.selectOne(ns+"checkReview",map);
   }
	public int insertCart(Cart c) throws UnsupportedEncodingException, SQLException {
        return sqlSession.update(ns+"insertCart",c);
   }
   public int checkCart(Cart c) throws UnsupportedEncodingException, SQLException {
       return sqlSession.selectOne(ns+"checkCart",c);
  }
   public int updateCart(Cart c) throws UnsupportedEncodingException, SQLException {
       return sqlSession.update(ns+"updateCart",c);
  }

   
   public int checkSlang(Slang s) throws UnsupportedEncodingException, SQLException {
       return sqlSession.selectOne(ns+"checkSlang",s);
  }
   public int insertSlang(Slang s) throws UnsupportedEncodingException, SQLException { 
       return sqlSession.update(ns+"insertSlang",s);
   }

   public int insertSlangAsZero(Slang s) throws UnsupportedEncodingException, SQLException { 
       return sqlSession.update(ns+"insertSlangAsZero",s);
   }


	
	public int addBook(Book book)throws UnsupportedEncodingException, SQLException {
		
		return sqlSession.insert(ns+"addBook", book);
	}

	public List<Book> bookList(int pageInt,int limit,String category,String sortmap, String keyword) throws UnsupportedEncodingException, SQLException { 
		Map map = new HashMap();
		if (category!=null&&!category.equals("")) {
			map.put("category", category);
		}
		if (sortmap!=null&&!sortmap.equals("")) {
			map.put("sortmap", sortmap);	
		}		
		map.put("start", (pageInt-1)*limit+1);
		map.put("end", (pageInt * limit));
		map.put("keyword", keyword);

		return sqlSession.selectList(ns+"bookList", map);
	}
	public List<Book> Bookcheck(int pageInt,int limit,String sortmap,String bookstate) throws UnsupportedEncodingException, SQLException { 
		Map map = new HashMap();

		map.put("start", (pageInt-1)*limit+1);
		map.put("end", (pageInt * limit));
		map.put("bookstate", bookstate);

		return sqlSession.selectList(ns+"Bookcheck", map);
	}
	 
	public List<Book> newBookList() throws UnsupportedEncodingException, SQLException {
		return sqlSession.selectList(ns+"newBookList");
	}
	
	public List<Book> rankBookList(String inventory) throws UnsupportedEncodingException, SQLException {
		return sqlSession.selectList(ns+"rankBookList",inventory);
	}
	  
	public int updateBook(Book book) throws UnsupportedEncodingException, SQLException{
		return sqlSession.update(ns+"updateBook",book);
	}
	
	public int checkBook(Book book) throws UnsupportedEncodingException, SQLException{
		return sqlSession.update(ns+"checkBook",book);
	}
	public int bookDelete(int num) throws UnsupportedEncodingException, SQLException{
		return sqlSession.delete(ns+"deleteBook",num);
	}
	
	public int bookCount(String category,String keyword) throws UnsupportedEncodingException, SQLException{
		Map map = new HashMap();
		if (category!=null&&!category.equals("")) {
			map.put("category", category);
		}
		map.put("keyword", keyword);
		
		return sqlSession.selectOne(ns+"bookCount",map);
	}

	public int checkCount(String bookstate) throws UnsupportedEncodingException, SQLException{
		Map map = new HashMap();
		
		map.put("bookstate", bookstate);
		
		return sqlSession.selectOne(ns+"checkCount",map);
	}
		
	public double updateAvg(int booknum)throws UnsupportedEncodingException, SQLException{
	    return sqlSession.update(ns+"updateAvg",booknum);
	}

	
	
	
}
