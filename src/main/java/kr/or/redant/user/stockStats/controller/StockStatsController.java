package kr.or.redant.user.stockStats.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import kr.or.redant.user.member.service.IMemberService;
import kr.or.redant.user.stockStats.service.IStockStatsService;
import kr.or.redant.vo.DailyPriceVO;
import kr.or.redant.vo.QNAboardVO;
import kr.or.redant.vo.StatsVO;
import kr.or.redant.vo.StockStatsVO;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/stockStat/")
public class StockStatsController {
	@Autowired
	private IStockStatsService service;
	@Autowired
	private IMemberService memberService;
	
	@RequestMapping("statMake")
	public void statMake() throws Exception{
		
	}
	
	@RequestMapping("statList")
	public void statList() throws Exception{
		
	}
	
	@RequestMapping("statList_blueChip")
	public void statList_blueChip() throws Exception{
		
	}
	@RequestMapping("statList_bigGrowth")
	public void statList_bigGrowth() throws Exception{
		
	}
	@RequestMapping("statList_chipPrise")
	public void statList_chipPrise() throws Exception{
		
	}
	
	@RequestMapping("statChoice")
	@ResponseBody
	public ModelAndView statChoice(String[] max_series,
							 String[] min_series,
							 String min_size,
							 String max_size,
							 String min_vol,
							 String max_vol,
							 String min_mom,
							 String max_mom,
							 Map<String, String> params,
							 ModelAndView model) throws Exception{
		
		if(min_series[0].equals("1")){
			min_size = "0";
		}else if(min_series[0].equals("2")){
			min_size = "41";
		}else if(min_series[0].equals("3")){
			min_size = "81";
		}else if(min_series[0].equals("4")){
			min_size = "121";
		}else if(min_series[0].equals("5")){
			min_size = "161";
		}
		
		if(max_series[0].equals("1")){
			max_size = "40";
		}else if(max_series[0].equals("2")){
			max_size = "80";
		}else if(max_series[0].equals("3")){
			max_size = "120";
		}else if(max_series[0].equals("4")){
			max_size = "160";
		}else if(max_series[0].equals("5")){
			max_size = "200";
		}
		
		params.put("min_size", min_size);
		params.put("max_size", max_size);
		
		List<StockStatsVO> marcketStockStatsList = this.service.marcketStockStatsList(params);
		
		if(min_series[1].equals("1")){
			min_vol = "0";
		}else if(min_series[1].equals("2")){
			min_vol = "41";
		}else if(min_series[1].equals("3")){
			min_vol = "81";
		}else if(min_series[1].equals("4")){
			min_vol = "121";
		}else if(min_series[1].equals("5")){
			min_vol = "161";
		}
		
		if(max_series[1].equals("1")){
			max_vol = "40";
		}else if(max_series[1].equals("2")){
			max_vol = "80";
		}else if(max_series[1].equals("3")){
			max_vol = "120";
		}else if(max_series[1].equals("4")){
			max_vol = "160";
		}else if(max_series[1].equals("5")){
			max_vol = "200";
		}
		
		params.put("min_vol", min_vol);
		params.put("max_vol", max_vol);
		
		List<StockStatsVO> volumeStockStatsList = this.service.volumeStockStatsList(params);
		
		if(min_series[2].equals("1")){
			min_mom = "0";
		}else if(min_series[2].equals("2")){
			min_mom = "41";
		}else if(min_series[2].equals("3")){
			min_mom = "81";
		}else if(min_series[2].equals("4")){
			min_mom = "121";
		}else if(min_series[2].equals("5")){
			min_mom = "161";
		}
		
		if(max_series[2].equals("1")){
			max_mom = "40";
		}else if(max_series[2].equals("2")){
			max_mom = "80";
		}else if(max_series[2].equals("3")){
			max_mom = "120";
		}else if(max_series[2].equals("4")){
			max_mom = "160";
		}else if(max_series[2].equals("5")){
			max_mom = "200";
		}
		
		params.put("min_mom", min_mom);
		params.put("max_mom", max_mom);
		
		List<StockStatsVO> momStockStatsList = this.service.momStockStatsList(params);
		
		List<StockStatsVO> resultList = new ArrayList<StockStatsVO>();
		
		for(int i=0;i<marcketStockStatsList.size();i++){
			for(int j=0;j<volumeStockStatsList.size();j++){
				for(int k=0;k<momStockStatsList.size();k++){
					if(marcketStockStatsList.get(i).getStats_rnum().equals(volumeStockStatsList.get(j).getStats_rnum())){
						if(volumeStockStatsList.get(j).getStock_item_code().equals(momStockStatsList.get(k).getStock_item_code())){
							params.put("stock_item_code", marcketStockStatsList.get(i).getStock_item_code());
							marcketStockStatsList.get(i).setStock_item_name(memberService.getStockName(params));
							resultList.add(marcketStockStatsList.get(i));
							resultList.add(volumeStockStatsList.get(j));
							resultList.add(momStockStatsList.get(k));
						}
					}
				}
			}
		}
		
		model.addObject("resultList",resultList);
		
		model.setViewName("jsonConvertView");
		return model;
	}
}