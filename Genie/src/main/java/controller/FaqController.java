package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dao.FaqDao;
import model.Faq;
import model.Search;
import paging.Paging;

@Controller
@RequestMapping("/board/faq/")
public class FaqController { // faq 게시판 controller

	@Autowired
	FaqDao faqDao;
	HttpSession session;
	HttpServletRequest request;

	@ModelAttribute
	protected void init(HttpServletRequest request) throws ServletException, IOException {
		this.request = request;
		request.setCharacterEncoding("utf-8");
		this.session = request.getSession();
	}

	// 페이징 처리 메소드
	public Paging paging(int page, int recordSize, int onePage, int allData) {
		Paging paging = new Paging(page, recordSize, onePage, allData);
		return paging;
	}

	// faq 검색 기능
	@RequestMapping("main")
	public String search(@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "category", defaultValue = "") String category,
			@RequestParam(name = "key", defaultValue = "") String key, Search search, Model model) throws Exception {

		List<Faq> faqList = null;
		Paging paging;

		if (!category.isEmpty()) {
			search.setSearchType(category);
		}

		if (!key.isEmpty()) {
			search.setSearchKeyword(key);
		}

		// 검색 키워드 확인
		if (search.getSearchKeyword() != null && search.getSearchKeyword().trim().length() != 0) { // 검색어가 있을 때

			// 카테고리 선택 O
			if (search.getSearchType() != null && !search.getSearchType().isEmpty()) {
				paging = paging(page, 5, 5, faqDao.searchOptionFaqCount(search));
				faqList = faqDao.searchOptionFaq(search, paging);
			} else { // 카테고리 선택 X
				paging = paging(page, 5, 5, faqDao.searchAllFaqCount(search.getSearchKeyword()));
				faqList = faqDao.searchAllFaq(search.getSearchKeyword(), paging);
			}
		} else { // 검색 키워드 없을 경우

			if (search.getSearchType() != null && !search.getSearchType().isEmpty()) { // 카테고리만 있을 경우

				paging = paging(page, 5, 5, faqDao.selectFaqCountCate(category));
				faqList = faqDao.selectPageFaqCate(paging, category);

			} else { // 전체 리스트
				paging = paging(page, 5, 5, faqDao.selectFaqCount());
				faqList = faqDao.selectPageFaq(paging);
			}

		}

		// 데이터 저장
		model.addAttribute("paging", paging);
		model.addAttribute("faqList", faqList);
		model.addAttribute("search", search);
		model.addAttribute("key1", search.getSearchKeyword());
		model.addAttribute("category", search.getSearchType());

		return "view/board/boardMain";
	}

	// faq 게시판 작성
	@RequestMapping("writeForm")
	public String writeForm() throws Exception {

		return "view/board/writeFaq";

	}

	// faq 등록 Pro
	@RequestMapping("writePro")
	public String writePro(Faq faq, Model model) throws Exception {

		int num = faqDao.insertFaq(faq);

		String msg = "FAQ 등록 실패";
		String url = "writeForm";

		if (num > 0) {
			msg = "FAQ 등록 성공";
			url = "main";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "alert1";
	}

	// faq 수정
	@RequestMapping("updateForm")
	public String updateForm(@RequestParam(name = "faqid") int faqId, Model model) throws Exception {

		// faqId 값으로 찾기
		Faq faq = faqDao.selectFaqId(faqId);

		model.addAttribute("faq", faq);

		return "view/board/updateFaq";

	}

	// faq 수정 Pro
	@RequestMapping("updatePro")
	public String updatePro(@RequestParam(name = "faqid") int faqId, Faq faq, Model model) throws Exception {

		faq.setFaqId(faqId);

		int num = faqDao.updateFaqId(faq);

		String msg = "FAQ 수정 실패";
		String url = "main";

		if (num > 0) {
			msg = "FAQ 수정 성공";
			url = "main";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "alert1";
	}

	// faq 삭제
	@RequestMapping("deletePro")
	public String deleteForm(@RequestParam(name = "faqid") int faqId) throws Exception {

		int num = faqDao.deleteFaqId(faqId);

		String msg = "FAQ 삭제 실패";
		String url = "main";

		if (num > 0) {
			msg = "FAQ 삭제 성공";
			url = "main";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "alert1";

	}

}
