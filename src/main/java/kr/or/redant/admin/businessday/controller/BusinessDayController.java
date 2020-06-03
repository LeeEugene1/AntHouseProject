package kr.or.redant.admin.businessday.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.redant.admin.businessday.service.IBSDayService;
import kr.or.redant.vo.BusinessDayVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/stockportfolio/")
public class BusinessDayController {
	@Autowired
	private IBSDayService service;
	
	@RequestMapping("selectMonth")
	public ModelAndView selectMonth(ModelAndView model,HttpServletRequest request,
		      HttpServletResponse response, Map<String, String> params,
		      String start_year) throws Exception{
		params.put("bsYear", start_year);
		List<BusinessDayVO> selectMonth = this.service.selectMonth(params);
		
		model.addObject("selectMonth",selectMonth);
		
		model.setViewName("jsonConvertView");
		
		return model;
	}
	
	@RequestMapping("selectDate")
	public ModelAndView selectDate(ModelAndView model,HttpServletRequest request,
		      HttpServletResponse response, Map<String, String> params,
		      String start_year, String start_month) throws Exception{
		params.put("bsYear", start_year);
		params.put("bsMonth", start_month);
		List<BusinessDayVO> selectDate = this.service.selectDate(params);
		
		model.addObject("selectDate",selectDate);
		
		model.setViewName("jsonConvertView");
		
		return model;
	}
	

}
