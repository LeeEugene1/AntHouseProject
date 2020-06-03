package kr.or.redant.user.login.controller;

import java.net.URLEncoder;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.redant.user.login.service.ILoginService;
import kr.or.redant.user.member.service.IMemberService;
import kr.or.redant.vo.AdminVO;
import kr.or.redant.vo.InterestItemVO;
import kr.or.redant.vo.MemberVO;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/login/")
public class LoginController {
	@Autowired
	private ILoginService service;
	
	@Autowired
	private IMemberService memberService;
	@Autowired
	private MessageSourceAccessor accessor;
	
	@RequestMapping("login")
	public void login(){}
	
	@RequestMapping("loginCheck")
	public String loginCheck(HttpServletRequest request, 
						   HttpServletResponse response, 
						   HttpSession session,
						   Map<String, String> params,
						   String mem_id,
						   String mem_pass,
						   String admin_id,
						   String admin_pass) throws Exception{
		params.put("mem_id", mem_id);
		params.put("mem_pass", mem_pass);
		
		admin_id = mem_id;
		admin_pass = mem_pass;
		
		params.put("admin_id", admin_id);
		params.put("admin_pass", admin_pass);
		
		MemberVO memberInfo = this.service.getMemberInfo(params);
		AdminVO adminInfo = this.service.getAdminInfo(params);
		
		String message = null;
		
		if(memberInfo == null && adminInfo == null){
			message = this.accessor.getMessage("fail.common.join", Locale.KOREA);
			message = URLEncoder.encode(message, "UTF-8");
			return "redirect:login.do?message=" + message;
		}else if(memberInfo != null && adminInfo == null){
//			Document doc = Jsoup.connect("http://www.podbbang.com/ch/15326").get();
//			Elements elem = doc.select(".pb-player__media-container audio");
//			String str = elem.attr("src");	
//			session.setAttribute("RADIO_INFO", str);
			
			session = request.getSession();
			adminInfo = (AdminVO)session.getAttribute("LOGIN_ADMININFO");
			if(adminInfo == null){
				List<InterestItemVO> interestItemList  = this.memberService.interestItemList(params);
				if(interestItemList != null){
					session.setAttribute("interestItemList", interestItemList);
				}
				session.setAttribute("LOGIN_MEMBERINFO", memberInfo);
				System.out.println(session.getAttribute("LOGIN_MEMBERINFO"));
				return "forward:/main.do";
			}else{
				session.invalidate();
				message = URLEncoder.encode("세션이 중복되었습니다. 다시 로그인해주세요.", "UTF-8");
				return "redirect:/login/login.do?message=" + message;
			}
		}else if(memberInfo == null && adminInfo != null){
			session = request.getSession();
			memberInfo = (MemberVO)session.getAttribute("LOGIN_MEMBERINFO");
			if(memberInfo == null){
				session.setAttribute("LOGIN_ADMININFO", adminInfo);
				return "forward:/main.do";
			}else{
				session.invalidate();
				message = URLEncoder.encode("세션이 중복되었습니다. 다시 로그인해주세요.", "UTF-8");
				return "redirect:/login/login.do?message=" + message;
			}
		}else{
			session.invalidate();
			
			message = URLEncoder.encode("세션이 중복되었습니다. 다시 로그인해주세요.", "UTF-8");
			return "redirect:/login/login.do?message=" + message;
		}
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) throws Exception{
		session.invalidate();
		
		String message = URLEncoder.encode("로그아웃 되었습니다.", "UTF-8");
		return "redirect:/main.do?message=" + message;
	}
	
}
