package kr.or.redant.user.stockForum.controller;

import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.or.redant.user.stockForum.service.IStockForumService;
import kr.or.redant.utiles.RolePagingUtile;
import kr.or.redant.vo.StockForumVO;

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
@RequestMapping("/stockForum/")
public class StockForumController {
	
	@Autowired
	private IStockForumService service;
	
	@RequestMapping("stockForumList")
	public Model stockForumList(Model model, HttpServletRequest request, Map<String, String> params, String search_keycode, String search_keyword) throws Exception{
		
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
		
		List<StockForumVO> stockForumList = this.service.stockForumList(params);
		
		String paginationHtmls = paginUtil.getPagingHtmls();
		
		model.addAttribute("stockForumList", stockForumList);
		model.addAttribute("paginationHtmls", paginationHtmls);
		return model; 
	}
	
	
	@RequestMapping("stockForumForm")
	public void stockForumForm() throws Exception{
		
	}
	
	@RequestMapping("stockForumView")
	@ModelAttribute("stockForumInfo")
	public StockForumVO stockForumView(String sf_rnum, String sf_no, Map<String,String> params, StockForumVO stockForumInfo) throws Exception{
		params.put("sf_no", sf_no);
		stockForumInfo = this.service.stockForumInfo(params);
		stockForumInfo.setSf_rnum(sf_rnum);
		
		return stockForumInfo;
		
	}
	
	@RequestMapping("stockForumViewUpdate")
	@ModelAttribute("stockForumInfo")
	public StockForumVO stockForumViewUpdate(String sf_rnum, String sf_no, Map<String,String> params, StockForumVO stockForumInfo) throws Exception{
		params.put("sf_no", sf_no);
		
		stockForumInfo = this.service.stockForumInfo(params);
		stockForumInfo.setSf_rnum(sf_rnum);
		return stockForumInfo;
		
	}
	
	
	@RequestMapping("updateStockForum")
	public String stockForumUpdate(String sf_no, StockForumVO stockForumInfo, RedirectAttributes redirectAttributes) throws Exception{
		this.service.updateStockForumInfo(stockForumInfo);
		String message = URLEncoder.encode("업데이트 완료", "UTF-8");
		return "forward:/stockForum/stockForumList.do?message=" + message;
	}
	
	
	
	@RequestMapping("deleteStockForum")
	public String stockForumDelete(String sf_no, Map<String,String> params, StockForumVO stockForumInfo, RedirectAttributes redirectAttributes) throws Exception{
		params.put("sf_no", sf_no);
		
		this.service.deleteStockForumInfo(params);
		
		String message = URLEncoder.encode("삭제 완료", "UTF-8");
		return "forward:/stockForum/stockForumList.do?message=" + message;
	}
	
	@RequestMapping("insertStockForum")
	public String insertStockForum(@RequestBody String queryString, StockForumVO stockForumInfo, RedirectAttributes redirectAttributes,@RequestParam("files") MultipartFile[] items) throws Exception{
		this.service.insertStockForumInfo(stockForumInfo, items);
		
		String message = URLEncoder.encode("글쓰기 성공","UTF-8");
		return "redirect:/stockForum/stockForumList.do?message=" + message;
	}
	
	@RequestMapping("stockForumReplyForm")
	public void stockForumReplyForm() throws Exception{
		
	}
	
	@RequestMapping("stockForumReplyInsert")
	public String stockForumReplyInsert(@RequestBody String queryString, StockForumVO stockForumInfo, RedirectAttributes redirectAttributes,@RequestParam("files") MultipartFile[] items) throws Exception{
		this.service.insertStockForumReply(stockForumInfo, items);
		
		String message = URLEncoder.encode("댓글 성공.","UTF-8");
		return "forward:/stockForum/stockForumList.do?message=" + message;
	}
}
