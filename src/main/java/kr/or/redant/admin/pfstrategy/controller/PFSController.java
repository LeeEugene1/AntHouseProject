package kr.or.redant.admin.pfstrategy.controller;

import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.redant.admin.businessday.service.IBSDayService;
import kr.or.redant.admin.pfstrategy.service.IPFSService;
import kr.or.redant.vo.BusinessDayVO;
import kr.or.redant.vo.PortfolioResultVO;
import kr.or.redant.vo.QNAboardVO;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/stockportfolio/")
public class PFSController {
	@Autowired
	private IPFSService service;
	
	private List<PortfolioResultVO> strategyList = null;
	
	@RequestMapping("strategyList")
	public ModelAndView strategyList(ModelAndView model,HttpServletRequest request,
		      HttpServletResponse response, Map<String, String> params,
		      String start_date, 
		      String end_date, 
		      String count,
		      String oneMonth,
		      String threeMonth,
		      String sixMonth,
		      String nineMonth,
		      String oneYear,
		      String twoYear,
		      String threeYear,
		      String oneMonthNull, 
		      String threeMonthNull, 
		      String sixMonthNull, 
		      String nineMonthNull, 
		      String oneYearNull, 
		      String twoYearNull, 
		      String threeYearNull,
		      String portfolio_code
		       ) throws Exception{
		params.put("pfs_start_date", start_date);
		
		params.put("pfs_end_date", end_date);
		params.put("pfs_1month", oneMonth);
		params.put("pfs_3month", threeMonth);
		params.put("pfs_6month", sixMonth);
		params.put("pfs_9month", nineMonth);
		params.put("pfs_1year", oneYear);
		params.put("pfs_2year", twoYear);
		params.put("pfs_3year", threeYear);
		params.put("pfs_1month_null", oneMonthNull);
		params.put("pfs_3month_null", threeMonthNull);
		params.put("pfs_6month_null", sixMonthNull);
		params.put("pfs_9month_null", nineMonthNull);
		params.put("pfs_1year_null", oneYearNull);
		params.put("pfs_2year_null", twoYearNull);
		params.put("pfs_3year_null", threeYearNull);
		params.put("pfs_count", count);
		
		if(portfolio_code.equals("13")){
			this.strategyList = this.service.strategyList(params);
			model.addObject("strategyList",strategyList);
		}else if(portfolio_code.equals("44")){
			this.strategyList = this.service.strategyLowList(params);
			model.addObject("strategyList",strategyList);
		}
		
		
		model.setViewName("jsonConvertView");
		
		return model;
	}
	
	@RequestMapping("insertsteategy")
	public String insertsteategy(@RequestBody String queryString, 
			     				 PortfolioResultVO pfsResultInfo, 
			     				 String pfs_code, 
			     				 String pfs_name, 
			     				 String portfolio_code, 
			     				 String pfs_start_date, 
			     				 String pfs_end_date,
			     				 RedirectAttributes redirectAttributes) throws Exception{
		pfsResultInfo.setPortfolio_code(portfolio_code);
		pfsResultInfo.setPfs_code(pfs_code);
		pfsResultInfo.setPfs_name(pfs_name);
		pfsResultInfo.setPfs_start_date(pfs_start_date);
		pfsResultInfo.setPfs_end_date(pfs_end_date);
		for(int i = 0; i<strategyList.size(); i++){
			pfsResultInfo.setPfs_1month_rr(strategyList.get(i).getPfs_1month_rr());
			pfsResultInfo.setPfs_3month_rr(strategyList.get(i).getPfs_3month_rr());
			pfsResultInfo.setPfs_6month_rr(strategyList.get(i).getPfs_6month_rr());
			pfsResultInfo.setPfs_9month_rr(strategyList.get(i).getPfs_9month_rr());
			pfsResultInfo.setPfs_1year_rr(strategyList.get(i).getPfs_1year_rr());
			pfsResultInfo.setPfs_2year_rr(strategyList.get(i).getPfs_2year_rr());
			pfsResultInfo.setPfs_3year_rr(strategyList.get(i).getPfs_3year_rr());
			pfsResultInfo.setPfs_rr(strategyList.get(i).getPfs_rr());
			pfsResultInfo.setStock_item_code(strategyList.get(i).getStock_item_code());
			this.service.insertsteategy(pfsResultInfo);
		}
		
		String message = URLEncoder.encode("게시글이 등록되었습니다.","UTF-8");
		return "redirect:/stockPortfolio/stockPortfolioList.do?message=" + message;
	}
	
	@RequestMapping("momList")
	@ResponseBody
	public String momList(Model model, HttpServletRequest request,
		      HttpServletResponse response)  throws Exception{
		String jsonData = null;
		
		List<PortfolioResultVO> momList = this.service.momList();
		
		jsonData = new ObjectMapper().writeValueAsString(momList);
		return jsonData;
	}
	
	@RequestMapping("deletePFS")
	public String deletePFS(String pfs_code, Map<String,String> params,RedirectAttributes redirectAttributes) throws Exception{
		params.put("pfs_code", pfs_code);
		
		this.service.deletePFS(params);
		
		String message = URLEncoder.encode("전략포트폴리오가 삭제되었습니다.", "UTF-8");
		return "redirect:/stockPortfolio/stockPortfolioList.do?message=" + message;
	}
	

}
