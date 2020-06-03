package kr.or.redant.user.stockInfo.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/stockInfo/")
public class StockInfoController {
	
	@RequestMapping("newsList")
	public void newsList(){}
	
	@RequestMapping("newsView")
	public void newsView(HttpServletRequest request, HttpSession session){
		session.setAttribute("link", request.getQueryString());
	}
	
	@RequestMapping("stockDetail")
	public void stockDetail(HttpServletRequest request, HttpSession session){
		session.setAttribute("link", request.getQueryString());
	}
	
	@RequestMapping("stockMain")
	public void stockMain(){}
	
	@RequestMapping("forumView")
	public void forumView(HttpServletRequest request, HttpSession session){
		session.setAttribute("link", request.getQueryString());
	}
}
