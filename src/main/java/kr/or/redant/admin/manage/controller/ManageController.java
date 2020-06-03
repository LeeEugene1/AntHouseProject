package kr.or.redant.admin.manage.controller;

import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.redant.admin.manage.service.IManageService;
import kr.or.redant.utiles.RolePagingUtile;
import kr.or.redant.vo.MemberVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/")
public class ManageController {
	@Autowired
	private IManageService service;
	
	@RequestMapping("userManagement")
	public Model userManagement(Model model, HttpServletRequest request, Map<String, String> params,
			String search_name, String search_id, String search_hp, String search_mail, String search_address,
			String search_date1, String search_date2) throws Exception{
		
		String currentPage = request.getParameter("currentPage");
		
		if (currentPage == null) {
			currentPage = "1";
		}
		
		params.put("search_name", search_name);
		params.put("search_id", search_id);
		params.put("search_hp", search_hp);
		params.put("search_mail", search_mail);
		params.put("search_address", search_address);
		params.put("search_date1", search_date1);
		params.put("search_date2", search_date2);
		
		String totalCount = this.service.totalCount(params);
		
		RolePagingUtile paginUtil = new RolePagingUtile(request, Integer.parseInt(totalCount), Integer.parseInt(currentPage));
		
		String startCount = String.valueOf(paginUtil.getStartCount());
		String endCount = String.valueOf(paginUtil.getEndCount());
		
		params.put("startCount", startCount);
		params.put("endCount", endCount);
		
		List<MemberVO> memberList = this.service.memberList(params);
		
		String paginationHtmls = paginUtil.getPagingHtmls();
		model.addAttribute("memberList", memberList);
		model.addAttribute("paginationHtmls", paginationHtmls);
		return model; 
	}
	
	@RequestMapping("memberDetail")
	@ModelAttribute("memberInfo")
	public MemberVO memberDetail(String mem_id,  Map<String,String> params, MemberVO memberInfo) throws Exception{
		params.put("mem_id", mem_id);
		
		memberInfo = this.service.getMemberInfo(params);
		return memberInfo;
	}
	
	@RequestMapping("memberDelete")
	public String memberDelete(String mem_id,  Map<String,String> params, MemberVO memberInfo) throws Exception{
		params.put("mem_id", mem_id);
		
		this.service.deleteMemberInfo(params);
		
		String message = URLEncoder.encode("삭제 완료", "UTF-8");
		return "forward:/admin/userManagement.do?message=" + message;
	}
	
	
}
