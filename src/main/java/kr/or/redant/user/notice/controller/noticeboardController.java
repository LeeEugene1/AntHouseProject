package kr.or.redant.user.notice.controller;

import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.redant.user.notice.service.INoticeboardService;
import kr.or.redant.utiles.RolePagingUtile;
import kr.or.redant.vo.NoticeboardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/noticeboard/")
public class noticeboardController {
	@Autowired
	private INoticeboardService service;
	
	@RequestMapping("noticeboardList")
	public Model noticeboardList(Model model,
						      String currentPage,
						      String totalCount,
						      String startCount,
						      String endCount,
						      HttpServletRequest request,
						      HttpServletResponse response,
						      String search_keycode,
						      String search_keyword,
						      Map<String, String> params) throws Exception{
		
		currentPage = request.getParameter("currentPage");
		
		if(currentPage == null){
			currentPage="1";
		}
		
		params.put("search_keycode", search_keycode);
		params.put("search_keyword", search_keyword);
		
		totalCount = this.service.totalCount(params);
		
		RolePagingUtile pagingUtil = new RolePagingUtile(request, Integer.parseInt(totalCount), Integer.parseInt(currentPage),search_keycode,search_keyword);
		
		startCount = String.valueOf(pagingUtil.getStartCount());
		endCount = String.valueOf(pagingUtil.getEndCount());
		
		params.put("startCount", startCount);
		params.put("endCount", endCount);
		
		List<NoticeboardVO> noticeboardList = this.service.noticeboardList(params);
		
		String paginationHtmls = pagingUtil.getPagingHtmls();
		model.addAttribute("noticeboardList",noticeboardList);
		model.addAttribute("paginationHtmls",paginationHtmls);
		
		return model;
	}
	
	
	@RequestMapping("noticeboardForm")
	public void noticeboardForm() throws Exception{
		
	}
	
	@RequestMapping("insertNoticeboard")
	public String insertNoticeboard(@RequestBody String queryString, NoticeboardVO noticeboardInfo, RedirectAttributes redirectAttributes) throws Exception{
		this.service.insertNoticeboardInfo(noticeboardInfo);
		String message = URLEncoder.encode("게시글이 등록되었습니다.","UTF-8");
		
		return "forward:/noticeboard/noticeboardList.do?message=" + message;
	}
	
	
	@RequestMapping("deleteNoticeboard")
	public String noticeboardDelete(String notice_no, Map<String,String> params, NoticeboardVO noticeboardInfo, RedirectAttributes redirectAttributes) throws Exception{
		params.put("notice_no", notice_no);
		
		this.service.deleteNoticeboardInfo(params);
		
		String message = URLEncoder.encode("게시글이 삭제되었습니다.", "UTF-8");
		return "forward:/noticeboard/noticeboardList.do?message=" + message;
	}
	
//	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@RequestMapping("noticeboardView")
	@ModelAttribute("noticeboardInfo")
	public NoticeboardVO noticeboardView(String notice_no, String notice_rnum,
			Map<String, String> params,NoticeboardVO noticeboardInfo) throws Exception{
		params.put("notice_no", notice_no);
		
		noticeboardInfo = this.service.noticeboardInfo(params);
		noticeboardInfo.setNotice_rnum(notice_rnum);
		
		return noticeboardInfo;
	}
	
	@RequestMapping("noticeboardViewUpdate")
	@ModelAttribute("noticeboardInfo")
	public NoticeboardVO noticeboardViewUpdate(String notice_no, String notice_rnum, Map<String,String> params, NoticeboardVO noticeboardInfo) throws Exception{
		params.put("notice_no", notice_no);
		
		noticeboardInfo = this.service.noticeboardInfo(params);
		noticeboardInfo.setNotice_rnum(notice_rnum);
		
		return noticeboardInfo;
	}
	
	@RequestMapping("updateNoticeboard")
	public String noticeboardUpdate(String notice_no, NoticeboardVO noticeboardInfo, RedirectAttributes redirectAttributes) throws Exception{
		this.service.updateNoticeboardInfo(noticeboardInfo);
		System.out.println("수정 완료");
		String message = URLEncoder.encode("게시글이 수정되었습니다.", "UTF-8");
		return "forward:/noticeboard/noticeboardList.do?message=" + message;
	}
	
}
