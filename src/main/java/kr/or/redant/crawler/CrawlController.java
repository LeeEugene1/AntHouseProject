package kr.or.redant.crawler;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/crawler/")
public class CrawlController {
	static Crawler crawler = new Crawler();
	static Map<String, Object> crawlMap = new HashMap<String, Object>();
	static Map<String, Object> sideMap = new HashMap<String, Object>();
	static String jsonData = null;
	static String sideData = null;
	
	@RequestMapping("side")
	@ResponseBody
	public String sideCrawler() throws Exception{
		sideMap = crawler.crawlSide();
		sideData = new ObjectMapper().writeValueAsString(sideMap);
		return sideData;
	}
	
	@RequestMapping("newsList")
	@ResponseBody
	public String newsList() throws Exception{
		crawlMap = crawler.crawlSelector("newsList");
		jsonData = new ObjectMapper().writeValueAsString(crawlMap);
		return jsonData;
	}
	
	@RequestMapping("newsView")
	@ResponseBody
	public String newsView(HttpServletRequest request) throws Exception{
		crawler.setURL("https://finance.naver.com/news/news_read.nhn?"+request.getQueryString());
		crawlMap = crawler.crawlSelector("newsView");
		jsonData = new ObjectMapper().writeValueAsString(crawlMap);
		return jsonData;
	}
	
	@RequestMapping("forumView")
	@ResponseBody
	public String forumView(HttpServletRequest request) throws Exception{
		crawler.setURL("https://finance.naver.com/item/board_read.nhn?"+request.getQueryString());
		crawlMap = crawler.crawlSelector("forumView");
		jsonData = new ObjectMapper().writeValueAsString(crawlMap);
		return jsonData;
	}
	
	@RequestMapping("main")
	@ResponseBody
	public String main() throws Exception{
		crawlMap = crawler.crawlSelector("main");
		jsonData = new ObjectMapper().writeValueAsString(crawlMap);
		return jsonData;
	}
	
	@RequestMapping("stockDetail")
	@ResponseBody
	public String stockDetail(HttpServletRequest request) throws Exception{
		crawler.setStockCode(request.getQueryString().substring(0, 11));
		System.out.println(request.getQueryString().substring(0, 11));
		crawlMap = crawler.crawlSelector("stockDetail");
		jsonData = new ObjectMapper().writeValueAsString(crawlMap);
		return jsonData;
	}
	
	@RequestMapping("cloud")
	@ResponseBody
	public String cloud() throws Exception{
		crawlMap = crawler.crawlSelector("cloud");
		jsonData = new ObjectMapper().writeValueAsString(crawlMap);
		return jsonData;
	}
}
