package model;

public class Search {
	
	private String searchType;	// [notice] all, title, content	// [faq] order, pay, delivery, returns, etc
	private String searchKeyword;
	
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	
	@Override
	public String toString() {
		return "Search [searchType=" + searchType + ", searchKeyword=" + searchKeyword + "]";
	}
	
	
}
