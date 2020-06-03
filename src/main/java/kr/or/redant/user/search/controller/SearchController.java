package kr.or.redant.user.search.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.or.redant.user.search.service.ISearchService;
import kr.or.redant.utiles.RolePagingUtile;
import kr.or.redant.vo.StockItemVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/search/")
public class SearchController {
	@Autowired
	private ISearchService service;
	
	@RequestMapping("searchList")
	public Model searchList(Model model, HttpServletRequest request, Map<String, String> params, String search_keyword) throws Exception{
		
		String currentPage = request.getParameter("currentPage");
		
		if (currentPage == null) {
			currentPage = "1";
		}
		
		params.put("search_keyword", search_keyword);
		
		String totalCount = this.service.totalCount(params);
		
		RolePagingUtile paginUtil = new RolePagingUtile(request, Integer.parseInt(totalCount), Integer.parseInt(currentPage),search_keyword);
		
		String startCount = String.valueOf(paginUtil.getStartCount());
		String endCount = String.valueOf(paginUtil.getEndCount());
		
		params.put("startCount", startCount);
		params.put("endCount", endCount);
		
		List<StockItemVO> stockItemList = this.service.stockItemList(params);
		if(search_keyword == null){
			stockItemList = null;
			totalCount = "0";
			
			paginUtil = new RolePagingUtile(request, Integer.parseInt(totalCount), Integer.parseInt(currentPage),search_keyword);
			
		}
		String paginationHtmls = paginUtil.getPagingHtmls();
		model.addAttribute("stockItemList", stockItemList);
		model.addAttribute("paginationHtmls", paginationHtmls);
		
		return model; 
	}
	
}
