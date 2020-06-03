package kr.or.redant.user.member.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.redant.user.member.service.IMemberService;
import kr.or.redant.vo.FreeboardVO;
import kr.or.redant.vo.InterestItemVO;
import kr.or.redant.vo.MemberVO;
import kr.or.redant.vo.StockForumVO;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/member/")
public class MemberController {
	@Autowired
	private IMemberService service;
	@Autowired
	private IMemberService memberService;
	
	@RequestMapping("memberView")
	@ModelAttribute("memberInfo")
	public MemberVO memberView(MemberVO memberInfo,
							   HttpSession session,
							   HttpServletRequest request) throws Exception{
		session = request.getSession();
		
		memberInfo = (MemberVO)session.getAttribute("LOGIN_MEMBERINFO");
		
		return memberInfo;
	}
	
	@RequestMapping("memberUpdateView")
	@ModelAttribute("memberInfo")
	public MemberVO memberUpdateView(MemberVO memberInfo,
			   					 	 HttpSession session,
			   					 	 HttpServletRequest request){
		session = request.getSession();
		
		memberInfo = (MemberVO)session.getAttribute("LOGIN_MEMBERINFO");
		
		return memberInfo;
	}
	
	@RequestMapping("updateMemberInfo")
	public String updateMemberInfo(@RequestBody String queryString,
							   MemberVO memberInfo,
							   RedirectAttributes redirectAttributes,
							   HttpServletRequest request,
							   HttpSession session) throws Exception{
		request.setCharacterEncoding("UTF-8");
		
		BeanUtils.populate(memberInfo, request.getParameterMap());
		
		this.service.updateMemberInfo(memberInfo);
		
		Map<String, String> params = new HashMap<String, String>();
		
		params.put("mem_id", memberInfo.getMem_id());
		params.put("mem_pass", memberInfo.getMem_pass());
		
		memberInfo = this.service.getMemberInfo(params);
		
		session.setAttribute("LOGIN_MEMBERINFO", memberInfo);
		
		String message = URLEncoder.encode("수정 완료", "UTF-8");
		return "redirect:/main.do?message=" + message;
	}
	
	@RequestMapping("updateMemberInfoAdmin")
	public String updateMemberInfoAdmin(@RequestBody String queryString,
			MemberVO memberInfo,
			RedirectAttributes redirectAttributes,
			HttpServletRequest request,
			HttpSession session) throws Exception{
		request.setCharacterEncoding("UTF-8");
		
		BeanUtils.populate(memberInfo, request.getParameterMap());
		
		this.service.updateMemberInfo(memberInfo);
		
//		Map<String, String> params = new HashMap<String, String>();
//		params.put("mem_id", memberInfo.getMem_id());
//		params.put("mem_pass", memberInfo.getMem_pass());
//		memberInfo = this.service.getMemberInfo(params);
//		session.setAttribute("LOGIN_MEMBERINFO", memberInfo);
		
		String message = URLEncoder.encode("수정 완료", "UTF-8");
		return "redirect:/admin/userManagement.do?message=" + message;
	}
	
	@RequestMapping("hpChange")
	@ModelAttribute("memberInfo")
	public MemberVO hpChange(MemberVO memberInfo,
						 HttpSession session,
						 HttpServletRequest request){
		session = request.getSession();
		
		memberInfo = (MemberVO)session.getAttribute("LOGIN_MEMBERINFO");
		
		return memberInfo;
	}
	
	@RequestMapping("memberUpdate")
	public String memberUpdate(HttpSession session,
			String mem_id,
			String mem_hp,
			String mem_name,
			String mem_pass,
			HttpServletRequest request,
			MemberVO memberInfo) throws Exception{
		Map<String, String> params = new HashMap<String, String>();
		
		session = request.getSession();
		
		memberInfo = (MemberVO)session.getAttribute("LOGIN_MEMBERINFO");
		mem_id = memberInfo.getMem_id();
		mem_pass = memberInfo.getMem_pass();
		
		params.put("mem_id", mem_id);
		params.put("mem_hp", mem_hp);
		params.put("mem_name", mem_name);
		
		this.service.updateMemberHp(params);
		
		params.put("mem_id", mem_id);
		params.put("mem_pass", mem_pass);
		
		memberInfo = this.service.getMemberInfo(params);
		
		session.setAttribute("LOGIN_MEMBERINFO", memberInfo);
		
		return "redirect:/member/memberUpdateView.do";
	}
	
	@RequestMapping("pleaseOut")
	public String pleaseOut(String mem_id, Map<String,String> params, RedirectAttributes redirectAttributes) throws Exception{
		params.put("mem_id", mem_id);
		
		this.service.deleteMemberInfo(params);
		
		String message = URLEncoder.encode("탈퇴 요청 완료", "UTF-8");
		return "forward:/main.do?message=" + message;
	}
	
	@RequestMapping("deleteTest")
	public String deleteTest(String mem_id, String stock_item_code, Map<String,String> params, RedirectAttributes redirectAttributes, HttpSession session, HttpServletRequest request) throws Exception{
		params.put("mem_id", mem_id);
		params.put("stock_item_code", stock_item_code);
		int count = this.service.deleteInterestItemInfo(params);
//		System.out.println("삭제된 데이터 값 =========" + count);
		List<InterestItemVO> interestItemList  = this.memberService.interestItemList(params);
		if(interestItemList != null){
			session.setAttribute("interestItemList", interestItemList);
		}
		String message = URLEncoder.encode("관심종목 삭제 성공","UTF-8");
		String referer = request.getHeader("Referer");
		return "redirect:"+referer;
	}
	
	@RequestMapping("interestAdd")
	public String interestAdd(HttpSession session,String stock_item_name, InterestItemVO interestInfo,@RequestBody String queryString, String code, String mem_id, Map<String,String> params, RedirectAttributes redirectAttributes, HttpServletRequest request) throws Exception{
		params.put("mem_id", mem_id);
		params.put("stock_item_code", code);
		params.put("stock_item_name", stock_item_name);
		interestInfo.setMem_id(mem_id);
		interestInfo.setStock_item_code2(code);
		interestInfo.setStock_item_name(stock_item_name);
		this.memberService.insertInterestStock(interestInfo);
		List<InterestItemVO> interestItemList  = this.memberService.interestItemList(params);
		session.setAttribute("interestItemList", interestItemList);
		String message = URLEncoder.encode("관심종목 등록 성공","UTF-8");
		String referer = request.getHeader("Referer");
		return "redirect:"+referer;
	}
	
	@RequestMapping("radioPopup")
	public void radioPopup() throws Exception{}
}
