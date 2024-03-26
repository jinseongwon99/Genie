package paging;

public class Paging {

	private int page; 			// 현재 페이지 번호 
	private int recordSize;		// 페이지당 출력할 데이터 개수 
	private int pageSize; 		// 총 페이지 사이즈
	private int startNum;		// 현재 페이지 시작 데이터 번호  
	private int endNum; 		// 현재 페이지 끝 데이터 번호 
	private int allData; 		// 총 데이터 개수 
	
	// 한페이지에 보이는 페이징 처리 개수 
	private int onePage; 
	
	// 현재 페이지에 출력할 페이지의 시작 번호 
	private int startPage;
	
	// 현재 페이지에 출력할 페이지의 끝 번호 
	private int endPage;
	
	public Paging (int page, int recordSize, int onePage, int allData) {
		this.page = page; 
		this.recordSize = recordSize; 
		this.allData = allData; 
		this.pageSize = (allData % recordSize == 0) ? allData / recordSize : (allData / recordSize) + 1; 
		this.startNum = (page * recordSize) - recordSize + 1;
		this.endNum = startNum + recordSize - 1;
		this.onePage = onePage;
		this.startPage = (this.page % this.onePage == 0) ? this.page - this.onePage + 1 : (this.page / this.onePage) * this.onePage + 1;
		this.endPage = this.startPage + this.onePage - 1; 
		
	}

	// getter, setter
	
	
	public int getPage() {
		return page;
	}


	public void setPage(int page) {
		this.page = page;
	}


	public int getRecordSize() {
		return recordSize;
	}


	public void setRecordSize(int recordSize) {
		this.recordSize = recordSize;
	}


	public int getPageSize() {
		return pageSize;
	}


	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}


	public int getStartNum() {
		return startNum;
	}


	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}


	public int getEndNum() {
		return endNum;
	}


	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}


	public int getAllData() {
		return allData;
	}


	public void setAllData(int allData) {
		this.allData = allData;
	}


	public int getOnePage() {
		return onePage;
	}


	public void setOnePage(int onePage) {
		this.onePage = onePage;
	}


	public int getStartPage() {
		return startPage;
	}


	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}


	public int getEndPage() {
		return endPage;
	}


	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	
}
