<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	var mail = "${memberInfo.mem_mail}";
	var idx = mail.indexOf("@");
	
	$('input[name=mem_mail1]').val(mail.substring(0, idx));
	$('input[name=mem_mail2]').val(mail.substring(idx+1));
	
	$('#search_categories').change(function(){
		var search_categories = $('#search_categories').val();
		
		if(search_categories == 1){
			$('input[name=mem_mail2]').val('');
			$('input[name=mem_mail2]').focus();
		}else{
			$('input[name=mem_mail2]').val(search_categories);
		}
		return false;
	});
	
	$('#memUpdate').click(function(){
		var regMail = /\w+@[a-z]+(\.[a-z]+){1,2}/; 
		
		if($('input[name=mem_pass]').val() == ''){
			alert('비밀번호를 입력해주세요.');
			$('input[name=mem_pass]').focus();
			return false;
		}else if($('input[name=mem_pass2]').val() == ''){
			alert('비밀번호를 입력해주세요.');
			$('input[name=mem_pass2]').focus();
			return false;
		}else if($('input[name=mem_pass]').val() != $('input[name=mem_pass2]').val()){
			alert('비밀번호가 일치하지 않습니다.');
			$('input[name=mem_pass]').val('');
			$('input[name=mem_pass2]').val('');
			$('input[name=mem_pass]').focus();
			return false;
		}
		
		if($('input[name=mem_nickname]').val() == ''){
			alert('별명을 입력해주세요.');
			$('input[name=mem_nickname]').focus();
			return false;
		}
		
		if($('input[name=mem_mail1]').val() == '' || $('input[name=mem_mail2]').val() == ''){
			alert('이메일을 입력해주세요.');
			$('input[name=mem_mail1]').val('');
			$('input[name=mem_mail2]').val('');
			$('input[name=mem_mail1]').focus();
			return false;
		}else{
			var mem_mail = $('input[name=mem_mail1]').val() + '@' + 
			  			   $('input[name=mem_mail2]').val();
			$('input[name=mem_mail]').val(mem_mail);
			if(regMail.test($('input[name=mem_mail]').val()) == false){
				alert('이메일을 형식에 맞게 입력해주세요.');
				$('input[name=mem_mail]').val('');
				$('input[name=mem_mail1]').val('');
				$('input[name=mem_mail2]').val('');
				$('input[name=mem_mail1]').focus();
				return false;
			}
		}
		
		if($('input[name=mem_zip]').val() == ''){
			alert('우편번호를 입력해주세요.');
			$('input[name=mem_zip]').val('');
			$('input[name=mem_zip]').focus();
			return false;
		}
		
		if($('input[name=mem_add1]').val() == '' || $('input[name=mem_add2]').val() == ''){
			alert('주소를 입력해주세요.');
			$('input[name=mem_add1]').val('');
			$('input[name=mem_add2]').val('');
			$('input[name=mem_add1]').focus();
			return false;
		}
		
		var mem_bir = $('input[name=mem_bir1]').val() + '-' + $('input[name=mem_bir2]').val() + '-' + $('input[name=mem_bir3]').val();
		$('input[name=mem_bir]').val(mem_bir);
		
		$('input[name=mem_hp]').val($('input[name=mem_hp1]').val());
		$('input[name=mem_id]').val($('input[name=mem_id1]').val());
		$('input[name=mem_name]').val($('input[name=mem_name1]').val());
		
		$('form').submit();
	});
});

</script>
</head>
<body>
	<div class="wrap">
        <div class="headerSubandContent">
            <p>메인화면 > 마이페이지</p>
            <h2 style="margin-top: 0px;margin-bottom: 0px;">마이페이지</h2>
            <content>
            <div class="box-signup">
                <form class="join" action="${pageContext.request.contextPath}/member/updateMemberInfo.do" method="post">
                    <div class="id">
                        <label for="u_id"><p>아이디</p></label>
                        <input type="hidden" name="mem_id">
                        <input type="text" class="box-simple" id="u_id" name="mem_id1" disabled="true" value="${memberInfo.mem_id }" placeholder="">
                    </div>
                    <div class="pw">
                        <label for="u_pw"><p>비밀번호</p></label>
                        <input class="box-simple" id="mem_pass" type="password" name="mem_pass" placeholder="">
                    </div>
                    <div class="pw2">
                        <label for="u_pw"><p>비밀번호 확인</p></label>
                        <input class="box-simple" id="mem_pass2" type="password" name="mem_pass2" placeholder="">
                    </div>
                    <div class="name">
                        <label for="u_name"><p>이름</p></label>
                        <input type="hidden" name="mem_name">
                        <input class="box-simple" id="u_name" type="text" name="mem_name1" value="${memberInfo.mem_name }" disabled="true" placeholder="">
                    </div>
                    <div class="nickname">
                        <label for="u_nickname"><p>별명</p></label>
                        <input class="box-simple" id="u_nickname" type="text" name="mem_nickname" value="${memberInfo.mem_nickname }" placeholder="">
                    </div>
                    <div class="bir">
                        <label for="u_bir"><p>생년월일</p></label>
                        <c:set var="mem_birSub" value="${memberInfo.mem_bir}"/>
                        <input type="hidden" name="mem_bir" />
                        <input class="box-simple-w100" id="u_bir1" type="text" name="mem_bir1" disabled="true" value="${fn:substring(mem_birSub, 0, 4)}" placeholder=""><span>&nbsp;년&nbsp;&nbsp;</span>
                        <input class="box-simple-w100" id="u_bir2" type="text" name="mem_bir2" disabled="true" value="${fn:substring(mem_birSub, 5, 7)}" placeholder=""><spanp>&nbsp;월&nbsp;&nbsp;</span>
                        <input class="box-simple-w100" id="u_bir3" type="text" name="mem_bir3" disabled="true" value="${fn:substring(mem_birSub, 8, 10)}" placeholder=""><span>&nbsp;일</span>
                    </div>
                    <div class="mail">
                        <label for="u_mail"><p>이메일</p></label>
                        <ul class="mailList">
                        	<c:set var="mem_mailSub" value="${memberInfo.mem_mail}"/>
	                        <input type="hidden" name="mem_mail" />
                            <li>
                                <input class="box-simple-w100" id="u_mail" type="text" name="mem_mail1" placeholder="">&nbsp;@&nbsp;
                            </li>
                            <li>
                                <input class="box-simple-w100" id="u_mail2" type="text" name="mem_mail2" placeholder="직접입력">
                            </li>
                            <li>
                                <div class="search_categories">
                                    <div class="select2">
                                       <select name="search_categories" id="search_categories">
                                          <option value="1" selected="selected">직접입력</option>
                                          <option value="naver.com">naver.com</option>
                                          <option value="gmail.com">gmail.com</option>
                                          <option value="daum.net">daum.net</option>
                                        </select>
                                     </div>
                                 </div>
                            </li>
                        </ul>
                    </div>

                    <div class="ph2">
                        <p>휴대전화</p>
                        <input type="text" class="box-simple" name="mem_hp1" value="${memberInfo.mem_hp }" disabled="true" placeholder="">
                        <input type="hidden" name="mem_hp">
                        <input type="button" class="box-simple" onclick="javascript:location.href='${pageContext.request.contextPath}/member/hpChange.do'" value="번호변경"></br>
                    </div>

                    <div class="add">
                        <p>주소</p>
                        <input type="text" id="sample6_postcode" class="box-simple-w100" name="mem_zip" value="${memberInfo.mem_zip }" placeholder="우편번호">
                        <input type="button" onclick="sample6_execDaumPostcode()" class="box-simple" value="우편번호 찾기"><br>
                        <input type="text" id="sample6_address" class="box-simple-w200" name="mem_add1" value="${memberInfo.mem_add1 }" placeholder="상세주소1">
                        <input type="text" id="sample6_detailAddress" class="box-simple-w200" name="mem_add2" value="${memberInfo.mem_add2 }" placeholder="상세주소2">
                        <input type="hidden" id="sample6_extraAddress" class="box-simple" placeholder="주소"><br>
                    </div>

                    <div class="submitBtn">
                        <input class="btn-simple" type="button" id="memUpdate" value="회원수정">
                        <input class="btn-simple" type="button" onclick="javascript:location.href='${pageContext.request.contextPath}/main.do'" value="취소">
                    </div>
                </form>
            </div> 
            </content>
        </div>
        
    </div>
</body>
</html>