package kr.or.redant.admin.stockPortfolio.controller;

import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.redant.admin.businessday.service.IBSDayService;
import kr.or.redant.admin.pfstrategy.service.IPFSService;
import kr.or.redant.admin.stockPortfolio.service.IPortfolioService;
import kr.or.redant.vo.BusinessDayVO;
import kr.or.redant.vo.PortfolioResultVO;
import kr.or.redant.vo.PortfolioVO;
import kr.or.redant.vo.QNAboardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/stockPortfolio/")
public class StockPortfolioController {
	@Autowired
	private IPortfolioService service;
	
	@Autowired
	private IPFSService service2;
	
	@RequestMapping("stockPortfolioList")
	public Model stockPortfolioList(Model model,HttpServletRequest request,
		      HttpServletResponse response,
		      Map<String, String> params) throws Exception{
		List<PortfolioVO> stockPortfolioList = this.service.portfolioList(params);
		model.addAttribute("stockPortfolioList",stockPortfolioList);
		
		return model;
	}
	
	@RequestMapping("portfolioForm")
	public void portfolioForm() throws Exception{
		
	}
	
	@RequestMapping("insertPortfolio")
	public String insertPortfolio(@RequestBody String queryString, PortfolioVO portfolioInfo, RedirectAttributes redirectAttributes) throws Exception{
		this.service.insertPortfolioInfo(portfolioInfo);
		String message = URLEncoder.encode("포트폴리오가 등록되었습니다.","UTF-8");
		
		return "redirect:/stockPortfolio/stockPortfolioList.do?message=" + message;
	}
	
	@RequestMapping("portfolioViewUpdate")
	@ModelAttribute("portfolioInfo")
	public PortfolioVO portfolioViewUpdate(String portfolio_code, Map<String,String> params, PortfolioVO portfolioInfo) throws Exception{
		params.put("portfolio_code", portfolio_code);
		portfolioInfo = this.service.portfolioInfo(params);
		
		return portfolioInfo;
	}
	
	@RequestMapping("updatePortfolio")
	public String portfolioUpdate(String portfolio_code, PortfolioVO portfolioInfo, RedirectAttributes redirectAttributes) throws Exception{
		this.service.updatePortfolioInfo(portfolioInfo);
		System.out.println("수정 완료");
		String message = URLEncoder.encode("포트폴리오가 수정되었습니다.", "UTF-8");
		return "forward:/stockPortfolio/stockPortfolioList.do?message=" + message;
	}
	
	@RequestMapping("deletePortfolio")
	public String portfolioDelete(String portfolio_code, Map<String,String> params, PortfolioVO portfolioInfo, RedirectAttributes redirectAttributes) throws Exception{
		params.put("portfolio_code", portfolio_code);
		
		this.service.deletePortfolioInfo(params);
		
		String message = URLEncoder.encode("포트폴리오가 삭제되었습니다.", "UTF-8");
		return "forward:/stockPortfolio/stockPortfolioList.do?message=" + message;
	}
	
	@Autowired
	private IBSDayService dayService;
	
	@RequestMapping("PFSForm")
	public Model selectYear(Model model,HttpServletRequest request,
		      HttpServletResponse response) throws Exception{
		List<BusinessDayVO> selectYear = this.dayService.selectYear();
		model.addAttribute("selectYear",selectYear);
		
		return model;
	}
	
	@RequestMapping("PFSView")
	public Model listView(Model model, HttpServletRequest request,
		      HttpServletResponse response, Map<String, String> params, String pfs_code)  throws Exception{
		params.put("pfs_code", pfs_code);
		
		List<PortfolioResultVO> listView = this.service2.listView(params);
		model.addAttribute("listView",listView);
		return model;
	}

}
