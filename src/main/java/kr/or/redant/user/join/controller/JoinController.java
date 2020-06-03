package kr.or.redant.user.join.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import kr.or.redant.user.join.service.IJoinService;
import kr.or.redant.utiles.Coolsms;
import kr.or.redant.vo.MemberVO;

import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/join/")
public class JoinController {
	@Autowired
	private IJoinService service;
	
	private static final Logger logger = LoggerFactory.getLogger(JoinController.class);
	
	@RequestMapping("joinCheck")
	public void joinCheck(){}
	
	@RequestMapping("joinForm")
	public ModelAndView joinForm(String mem_name,
								 String mem_hp,
								 Map<String, String> map,
								 ModelAndView mav){
		map.put("mem_name", mem_name);
		map.put("mem_hp", mem_hp);
		
		mav.addObject("map", map);
		return mav;
	}
	
	@RequestMapping("idCheck")
	@ResponseBody
	public String idCheck(String mem_id,
			Map<String, String> params,
			Map<String, String> jsonMap) throws Exception{
		params.put("mem_id", mem_id);
		MemberVO memberInfo = this.service.getMemberInfo(params);
		
		if(memberInfo == null){
			jsonMap.put("flag", "true");
		} else {
			jsonMap.put("flag", "false");
		}
		
		String jsonData = new ObjectMapper().writeValueAsString(jsonMap);
		return jsonData;
	}
	
	@RequestMapping("insertMemberInfo")
	public String insertMemberInfo(MemberVO memberInfo) throws SQLException{
		this.service.insertMemberInfo(memberInfo);
		
		String message="";
		try {
			message = URLEncoder.encode("회원가입이 완료되었습니다.", "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "redirect:/main.do?message="+message;
	}
	
	private int confirmPw1 = (int)(Math.random()*900000+100000);
	private String confirmPw2 = Integer.toString(confirmPw1);
	
	@RequestMapping("sms")
	@ResponseBody
	public String sms(String mem_hp,
					Map<String, String> jsonMap) throws Exception{
		/*
		 * 서버에서 받은 API_KEY, API_SECRET를 입력해주세요.
		 */
		String api_key = "NCSHRPFYXCKYU8K3";
		String api_secret = "NKXUGE3YHCWTLSBVKCDZLANZISBIGHPS";
		Coolsms coolsms = new Coolsms(api_key, api_secret);
	
		String hp = mem_hp.replaceAll("-", "");
		
		if(hp != null){
			jsonMap.put("flag", "true");
			jsonMap.put("hpNum", confirmPw2);
		} else {
			jsonMap.put("flag", "false");
		}
		
		/*
		 * Parameters
		 * 관련정보 : http://www.coolsms.co.kr/SDK_Java_API_Reference_ko#toc-0
		 */
		HashMap<String, String> set = new HashMap<String, String>();
		set.put("to", hp); // 수신번호

		// 10월 16일 이후로 발신번호 사전등록제로 인해 등록된 발신번호로만 문자를 보내실 수 있습니다.
		set.put("from", "01048010162"); // 발신번호
		set.put("text", confirmPw2); // 문자내용
		set.put("type", "sms"); // 문자 타입

//		JSONObject result = coolsms.send(set); // 보내기&전송결과받기
//		if ((Boolean) result.get("status") == true) {
//			// 메시지 보내기 성공 및 전송결과 출력
//			System.out.println("성공");			
//		} else {
//			// 메시지 보내기 실패
//			System.out.println("실패");
//		}
		
		String jsonData = new ObjectMapper().writeValueAsString(jsonMap);
		return jsonData;
	}
	
	@RequestMapping("idFind")
	public void idFind(){
		
	}
	
	
	@RequestMapping("sendId")
	public String sendId(Map<String, String> params, String mem_mail, String mem_name) throws Exception{
		String mem_id = null;
		String content = null;
		params.put("mem_name", mem_name);
		mem_id = service.getMemberId(params);
		if(mem_id != null){
			content = "고객님의 아이디는 "+ mem_id +" 입니다.";
		}else{
			content = "해당이름과 일치하는 고객정보가 없습니다.";
		}
		
		String title = "개미의집 아이디 찾기 시스템에서 발송된 메일입니다.";
		Mail.sendMail(title, content, mem_mail);
		return "forward:/main.do?message=성공적으로 메일이 발송되었습니다.";
	}
	
	public String mem_random;

	@RequestMapping("sendPw")
	@ResponseBody
	public String sendPw(Map<String, String> params, String mem_mail, String mem_id, Map<String, String> jsonMap) throws Exception{
		String content = null;
		params.put("mem_id", mem_id);
		MemberVO memberInfo = this.service.getMemberInfo(params);
		
		if(memberInfo == null){
		} else {
			int mem_random_test = (int)(Math.random()*900000+100000);
			mem_random = Integer.toString(mem_random_test);
		}
		content = "인증번호는 "+ mem_random +" 입니다.";
		
		String title = "개미의집 아이디 찾기 시스템에서 발송된 메일입니다.";
		Mail.sendMail(title, content, mem_mail);
		
		jsonMap.put("flag", "true");
		jsonMap.put("mailAdd", mem_random);
		
		String jsonData = new ObjectMapper().writeValueAsString(jsonMap);
		return jsonData;
	}
	
	@RequestMapping("viewPw")
	@ModelAttribute("memberInfo")
	public MemberVO viewPw(Map<String, String> params,String mem_id, MemberVO memberInfo) throws Exception{
		params.put("mem_id", mem_id);
		memberInfo = this.service.getMemberInfo(params);
		return memberInfo;
	}
	
	@RequestMapping("pwFind")
	public void pwFind(){
		
	}
	
}
