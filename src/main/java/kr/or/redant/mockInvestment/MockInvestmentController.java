package kr.or.redant.mockInvestment;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.or.redant.user.stockForum.service.IStockForumService;
import kr.or.redant.utiles.ProgramStartTest;
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
@RequestMapping("/MockInvestment/")
public class MockInvestmentController {
	
	@RequestMapping("start")
	public String start() throws Exception{
		System.out.println("=-==================================여기도착============================");
		ProgramStartTest test = new ProgramStartTest();
//		test.start();
		test.start2();
		String message = "모의투자 실행~~";
		return "forward:/main.do?message="+message;
	}
	
}
