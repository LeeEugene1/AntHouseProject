package kr.or.redant.admin.stockLecture.controller;

import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.or.redant.admin.stockLecture.service.IStockLectureService;
import kr.or.redant.utiles.RolePagingUtile;
import kr.or.redant.vo.QNAboardVO;
import kr.or.redant.vo.StockForumVO;
import kr.or.redant.vo.StockLectureVO;

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
@RequestMapping("/stockLecture/")
public class StockLectureController {
	@Autowired
	private IStockLectureService service;
	
	@RequestMapping("stockLectureList")
	public Model stockLectureList(Model model,
								  HttpServletRequest request,
								  Map<String, String> params,
								  String search_keycode,
								  String search_keyword) throws Exception{
		String currentPage = request.getParameter("currentPage");
		
		if (currentPage == null) {
			currentPage = "1";
		}
		
		params.put("search_keycode", search_keycode);
		params.put("search_keyword", search_keyword);
		
		String totalCount = this.service.totalCount(params);
		
		RolePagingUtile paginUtil = new RolePagingUtile(request, Integer.parseInt(totalCount), Integer.parseInt(currentPage));
		
		String startCount = String.valueOf(paginUtil.getStartCount());
		String endCount = String.valueOf(paginUtil.getEndCount());
		
		params.put("startCount", startCount);
		params.put("endCount", endCount);
		
		List<StockLectureVO> stockLectureList = this.service.stockLectureList(params);
		
		String paginationHtmls = paginUtil.getPagingHtmls();
		model.addAttribute("stockLectureList", stockLectureList);
		model.addAttribute("paginationHtmls", paginationHtmls);
		return model; 
	}
	
	@RequestMapping("stockLectureForm")
	public void stockLectureForm() throws Exception{}
	
	@RequestMapping("insertStockLecture")
	public String insertStockLecture(@RequestBody String queryString,
									 StockLectureVO stockLectureInfo,
									 RedirectAttributes redirectAttributes,
									 @RequestParam("files") MultipartFile[] items ) throws Exception{
		this.service.insertStockLecturInfo(stockLectureInfo, items);
		
		String message = URLEncoder.encode("게시글이 등록되었습니다.","UTF-8");
		
		return "forward:/stockLecture/stockLectureList.do?message=" + message;
	}
	
	@RequestMapping("stockLectureView")
	@ModelAttribute("stockLectureInfo")
	public StockLectureVO stockLectureView(String sl_no,
										   Map<String, String> params,
										   StockLectureVO stockLectureInfo) throws Exception{
		params.put("sl_no", sl_no);
		
		stockLectureInfo = this.service.stockLectureInfo(params);
		
		return stockLectureInfo;
	}
	
	@RequestMapping("deleteStockLecture")
	public String deleteStockLecture(String sl_no,
									 Map<String,String> params) throws Exception{
		params.put("sl_no", sl_no);
		
		this.service.deleteStockLecturInfo(params);
		
		String message = URLEncoder.encode("삭제 완료", "UTF-8");
		return "forward:/stockLecture/stockLectureList.do?message=" + message;
	}
	
	@RequestMapping("stockLectureViewUpdate")
	@ModelAttribute("stockLectureInfo")
	public StockLectureVO stockLectureViewUpdate(String sl_no, 
										   Map<String,String> params,
										   StockLectureVO stockLectureInfo) throws Exception{
		params.put("sl_no", sl_no);
		stockLectureInfo = this.service.stockLectureInfo(params);
		return stockLectureInfo;
	}
	
	@RequestMapping("updateStockLecture")
	public String updateStockLecture(StockLectureVO stockLectureInfo) throws Exception{
		this.service.updateStockLecturInfo(stockLectureInfo);
		String message = URLEncoder.encode("업데이트 완료", "UTF-8");
		return "forward:/stockLecture/stockLectureList.do?message=" + message;
	}
	
}
