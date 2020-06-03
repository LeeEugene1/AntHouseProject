package kr.or.redant.cloud;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.or.redant.crawler.Crawler;
import kr.or.redant.user.stockForum.service.IStockForumService;
import kr.or.redant.utiles.ProgramStartTest;
import kr.or.redant.utiles.RolePagingUtile;
import kr.or.redant.vo.StockForumVO;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/cloud/")
public class cloudController {
//	static Crawler crawler = new Crawler();
//	static Map<String, Object> crawlMap = new HashMap<String, Object>();
//	static String jsonData = null;
	
	@RequestMapping("cloudList")
	public void cloudList() throws Exception{
//		crawlMap = crawler.crawlSelector("side");
//		jsonData = new ObjectMapper().writeValueAsString(crawlMap);
//		jsonData = "";
//		return jsonData;
	}
	
}
