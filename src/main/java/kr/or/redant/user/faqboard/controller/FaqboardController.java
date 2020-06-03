package kr.or.redant.user.faqboard.controller;

import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.redant.user.faqboard.service.IFaqboardService;
import kr.or.redant.utiles.RolePagingUtile;
import kr.or.redant.vo.FAQboardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/faqboard/")
public class FaqboardController {
	@Autowired
	private IFaqboardService service;
	
	@RequestMapping("faqboardList")
	public Model faqboardList(Model model,
						      String currentPage,
						      String totalCount,
						      String startCount,
						      String endCount,
						      HttpServletRequest request,
						      HttpServletResponse response,
						      Map<String, String> params) throws Exception{
		
		currentPage = request.getParameter("currentPage");
		
		if(currentPage == null){
			currentPage="1";
		}
		
		totalCount = this.service.totalCount(params);
		
		RolePagingUtile pagingUtil = new RolePagingUtile(request, Integer.parseInt(totalCount), Integer.parseInt(currentPage));
		
		startCount = String.valueOf(pagingUtil.getStartCount());
		endCount = String.valueOf(pagingUtil.getEndCount());
		
		params.put("startCount", startCount);
		params.put("endCount", endCount);
		
		List<FAQboardVO> faqboardList = this.service.faqboardList(params);
		
		String paginationHtmls = pagingUtil.getPagingHtmls();
		model.addAttribute("faqboardList",faqboardList);
		model.addAttribute("paginationHtmls",paginationHtmls);
		
		return model;
	}
	
	
	@RequestMapping("faqboardForm")
	public void faqboardForm() throws Exception{
		
	}
	
	@RequestMapping("insertFAQboard")
	public String insertFAQboard(@RequestBody String queryString, FAQboardVO faqboardInfo, RedirectAttributes redirectAttributes) throws Exception{
		this.service.insertFAQboardInfo(faqboardInfo);
		String message = URLEncoder.encode("게시글이 등록되었습니다.","UTF-8");
		
		return "redirect:/faqboard/faqboardList.do?message=" + message;
	}
	
	
	@RequestMapping("deleteFAQboard")
	public String faqboardDelete(String faq_no, Map<String,String> params, FAQboardVO faqboardInfo, RedirectAttributes redirectAttributes) throws Exception{
		params.put("faq_no", faq_no);
		
		this.service.deleteFAQboardInfo(params);
		
		String message = URLEncoder.encode("게시글이 삭제되었습니다.", "UTF-8");
		return "forward:/faqboard/faqboardList.do?message=" + message;
	}
	
//	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@RequestMapping("faqboardView")
	@ModelAttribute("faqboardInfo")
	public FAQboardVO faqboardView(String faq_no, 
			Map<String, String> params,FAQboardVO faqboardInfo) throws Exception{
		params.put("faq_no", faq_no);
		
		faqboardInfo = this.service.faqboardInfo(params);
		
		return faqboardInfo;
	}
	
	@RequestMapping("faqboardViewUpdate")
	@ModelAttribute("faqboardInfo")
	public FAQboardVO faqboardViewUpdate(String faq_no, Map<String,String> params, FAQboardVO faqboardInfo) throws Exception{
		params.put("faq_no", faq_no);
		
		faqboardInfo = this.service.faqboardInfo(params);
		
		return faqboardInfo;
	}
	
	@RequestMapping("updateFAQboard")
	public String faqboardUpdate(String faq_no, FAQboardVO faqboardInfo, RedirectAttributes redirectAttributes) throws Exception{
		this.service.updateFAQboardInfo(faqboardInfo);
		System.out.println("수정 완료");
		String message = URLEncoder.encode("게시글이 수정되었습니다.", "UTF-8");
		return "forward:/faqboard/faqboardList.do?message=" + message;
	}
	
	
	
}
