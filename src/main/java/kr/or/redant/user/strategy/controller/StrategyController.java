package kr.or.redant.user.strategy.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.redant.user.search.service.ISearchService;
import kr.or.redant.utiles.RolePagingUtile;
import kr.or.redant.vo.StockItemVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/strategy/")
public class StrategyController {
	
	@Autowired
	private ISearchService service;
	
	@RequestMapping("investmentStrategy")
	public void investmentStrategyList(){}
	
	
	@RequestMapping("strategySimulator")
	public void strategySimulator(){
	}
	
	@RequestMapping("stockNamePopup")
	public Model stockNamePopup(Model model, HttpServletRequest request, Map<String, String> params, String search_keyword) throws Exception{
		
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
