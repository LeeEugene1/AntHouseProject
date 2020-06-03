package kr.or.redant.user.freeboard.controller;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.or.redant.user.freeboard.service.IFreeboardService;
import kr.or.redant.utiles.RolePagingUtile;
import kr.or.redant.vo.FreeboardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/freeboard/")
public class FreeboardController {
	@Autowired
	private IFreeboardService service;
	
	@RequestMapping("freeboardList")
	public Model freeboardList(Model model, HttpServletRequest request, Map<String, String> params, String search_keycode, String search_keyword) throws Exception{
		
		String currentPage = request.getParameter("currentPage");
		
		if (currentPage == null) {
			currentPage = "1";
		}
		
		params.put("search_keycode", search_keycode);
		params.put("search_keyword", search_keyword);
		
		String totalCount = this.service.totalCount(params);
		
		RolePagingUtile paginUtil = new RolePagingUtile(request, Integer.parseInt(totalCount), Integer.parseInt(currentPage),search_keycode,search_keyword);
		
		String startCount = String.valueOf(paginUtil.getStartCount());
		String endCount = String.valueOf(paginUtil.getEndCount());
		
		params.put("startCount", startCount);
		params.put("endCount", endCount);
		
		List<FreeboardVO> freeboardList = this.service.freeboardList(params);
		
		String paginationHtmls = paginUtil.getPagingHtmls();
		model.addAttribute("freeboardList", freeboardList);
		model.addAttribute("paginationHtmls", paginationHtmls);
		return model; 
	}
	
	
	@RequestMapping("freeboardForm")
	public void freeboardForm() throws Exception{
		
	}
	
	@RequestMapping("freeboardView")
	@ModelAttribute("freeboardInfo")
	public FreeboardVO freeboardView(String fr_bo_rnum, String fr_bo_no, Map<String,String> params, FreeboardVO freeboardInfo) throws Exception{
		params.put("fr_bo_no", fr_bo_no);
		
		freeboardInfo = this.service.freeboardInfo(params);
		freeboardInfo.setFr_bo_rnum(fr_bo_rnum);
		return freeboardInfo;
		
	}
	
	@RequestMapping("freeboardViewUpdate")
	@ModelAttribute("freeboardInfo")
	public FreeboardVO freeboardViewUpdate(String fr_bo_rnum, String fr_bo_no, Map<String,String> params, FreeboardVO freeboardInfo) throws Exception{
		params.put("fr_bo_no", fr_bo_no);
		
		freeboardInfo = this.service.freeboardInfo(params);
		freeboardInfo.setFr_bo_rnum(fr_bo_rnum);
		return freeboardInfo;
		
	}
	
	
	@RequestMapping("updateFreeboard")
	public String freeboardUpdate(String fr_bo_no, FreeboardVO freeboardInfo, RedirectAttributes redirectAttributes) throws Exception{
		this.service.updateFreeboardInfo(freeboardInfo);
		String message = URLEncoder.encode("업데이트 완료", "UTF-8");
		return "forward:/freeboard/freeboardList.do?message=" + message;
	}
	
	
	
	@RequestMapping("deleteFreeboard")
	public String freeboardDelete(String fr_bo_no, Map<String,String> params, FreeboardVO freeboardInfo, RedirectAttributes redirectAttributes) throws Exception{
		params.put("fr_bo_no", fr_bo_no);
		
		this.service.deleteFreeboardInfo(params);
		
		String message = URLEncoder.encode("삭제 완료", "UTF-8");
		return "forward:/freeboard/freeboardList.do?message=" + message;
	}
	
	@RequestMapping("insertFreeboard")
	public String insertFreeboard(@RequestBody String queryString, FreeboardVO freeboardInfo, RedirectAttributes redirectAttributes,@RequestParam("files") MultipartFile[] items) throws Exception{
		this.service.insertFreeboardInfo(freeboardInfo, items);
		String message = URLEncoder.encode("글쓰기 성공","UTF-8");
		return "redirect:/freeboard/freeboardList.do?message=" + message;
	}
	
	
	@RequestMapping("freeboardReplyForm")
	public void freeboardReplyForm() throws Exception{
		
	}
	
	@RequestMapping("freeboardReplyInsert")
	public String freeboardReplyInsert(@RequestBody String queryString, FreeboardVO freeboardInfo, RedirectAttributes redirectAttributes,@RequestParam("files") MultipartFile[] items) throws Exception{
		this.service.insertFreeboardReply(freeboardInfo, items);
		
		String message = URLEncoder.encode("댓글 작성완료","UTF-8");
		return "redirect:/freeboard/freeboardList.do?message=" + message;
	}
}
