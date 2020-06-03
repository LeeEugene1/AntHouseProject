package kr.or.redant.user.qnaboard.controller;

import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.redant.user.qnaboard.service.IQnaboardService;
import kr.or.redant.utiles.RolePagingUtile;
import kr.or.redant.vo.QNAboardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/qnaboard/")
public class QnaboardController {
	@Autowired
	private IQnaboardService service;
	
	@RequestMapping("qnaboardList")
	public Model qnaboardList(Model model,
						      String currentPage,
						      String search_keycode,
						      String search_keyword,
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
		params.put("search_keycode", search_keycode);
		params.put("search_keyword", search_keyword);
		
		totalCount = this.service.totalCount(params);
		
		RolePagingUtile pagingUtil = new RolePagingUtile(request, Integer.parseInt(totalCount), Integer.parseInt(currentPage),search_keycode,search_keyword);
		
		startCount = String.valueOf(pagingUtil.getStartCount());
		endCount = String.valueOf(pagingUtil.getEndCount());
		
		params.put("startCount", startCount);
		params.put("endCount", endCount);
		
		List<QNAboardVO> qnaboardList = this.service.qnaboardList(params);
		
		String paginationHtmls = pagingUtil.getPagingHtmls();
		model.addAttribute("qnaboardList",qnaboardList);
		model.addAttribute("paginationHtmls",paginationHtmls);
		
		return model;
	}
	
	
	@RequestMapping("qnaboardForm")
	public void qnaboardForm() throws Exception{
		
	}
	@RequestMapping("qnaboardReplyForm")
	public void qnaboardReplyForm() throws Exception{
		
	}
	
	@RequestMapping("insertQNAboard")
	public String insertQNAboard(@RequestBody String queryString, QNAboardVO qnaboardInfo, RedirectAttributes redirectAttributes, @RequestParam("files") MultipartFile[] items ) throws Exception{
		if(items.length==1){
			this.service.insertQNAboardInfo(qnaboardInfo);
		}else{
			this.service.insertQNAboardInfo(qnaboardInfo, items);
		}
		String message = URLEncoder.encode("게시글이 등록되었습니다.","UTF-8");
		
		return "forward:/qnaboard/qnaboardList.do?message=" + message;
	}
	
	@RequestMapping("insertQNAReply")
	public String insertQNAboardReply(@RequestBody String queryString, QNAboardVO qnaboardInfo, RedirectAttributes redirectAttributes) throws Exception{
		this.service.insertQNAboardReply(qnaboardInfo);
		String message = URLEncoder.encode("답글이 등록되었습니다.","UTF-8");
		
		return "redirect:/qnaboard/qnaboardList.do?message=" + message;
	}
	
	
	@RequestMapping("deleteQNAboard")
	public String qnaboardDelete(String qna_no, Map<String,String> params, QNAboardVO qnaboardInfo, RedirectAttributes redirectAttributes) throws Exception{
		params.put("qna_no", qna_no);
		
		this.service.deleteQNAboardInfo(params);
		
		String message = URLEncoder.encode("게시글이 삭제되었습니다.", "UTF-8");
		return "forward:/qnaboard/qnaboardList.do?message=" + message;
	}
	
//	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@RequestMapping("qnaboardView")
	@ModelAttribute("qnaboardInfo")
	public QNAboardVO qnaboardView(String qna_no, 
			Map<String, String> params,QNAboardVO qnaboardInfo) throws Exception{
		params.put("qna_no", qna_no);
		
		qnaboardInfo = this.service.qnaboardInfo(params);
		
		return qnaboardInfo;
	}
	
	@RequestMapping("qnaboardViewUpdate")
	@ModelAttribute("qnaboardInfo")
	public QNAboardVO qnaboardViewUpdate(String qna_no, Map<String,String> params, QNAboardVO qnaboardInfo) throws Exception{
		params.put("qna_no", qna_no);
		
		qnaboardInfo = this.service.qnaboardInfo(params);
		
		return qnaboardInfo;
	}
	
	@RequestMapping("updateQNAboard")
	public String qnaboardUpdate(String qna_no, QNAboardVO qnaboardInfo, RedirectAttributes redirectAttributes) throws Exception{
		this.service.updateQNAboardInfo(qnaboardInfo);
		System.out.println("수정 완료");
		String message = URLEncoder.encode("게시글이 수정되었습니다.", "UTF-8");
		return "forward:/qnaboard/qnaboardList.do?message=" + message;
	}
	
	
	
}
