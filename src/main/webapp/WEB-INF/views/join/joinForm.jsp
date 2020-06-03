<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type='text/javascript' src='${pageContext.request.contextPath}/UI/js/validation.js'></script>
<script type="text/javascript">
$(function(){
	$('#idCheck').click(function(){
		if($('input[name=mem_id]').val()==''){
			alert('아이디를 입력해주세요');
			$('input[name=mem_id]').focus();
			return false;
		}
		
		if(!$('input[name=mem_id]').val().validationID()){
			alert('아이디는 영소문자,숫자포함 3~8 글자입니다.');
			return false;
		}

		$.ajax({
			type : 'post',
			url:'${pageContext.request.contextPath}/join/idCheck.do',
			dataType:'json',
			data:{ mem_id : $('input[name=mem_id]').val() },
			error:function(result){
					alert(result.status);
				},
			success:function(result){
					if(result.flag == 'true'){
						alert('사용할 수 있는 아이디입니다.');
						$('input[name=mem_pass]').focus();
						return false;
					}else{
						alert('사용할 수 없는 아이디입니다.');
						$('input[name=mem_id]').val('');
						$('input[name=mem_id]').focus();
						return false;
					}
				}
		});
		return false;
	});
	
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
	
	$('#signUp').click(function(){
		var regName = /^[ㄱ-힣]{2,5}$/;
		var regBir = /\d{4}\/\d{2}\/\d{2}/;
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
		
		if(!$('input[name=mem_pass]').val().validationPWD()){
			alert('비밀번호은 영소문자, 숫자포함 4~8글자입니다.');
			$('input[name=mem_pass]').focus();
			return false;
		}
		
		if($('input[name=mem_nickname]').val() == ''){
			alert('별명을 입력해주세요.');
			$('input[name=mem_nickname]').focus();
			return false;
		}
		
		if(!$('input[name=mem_nickname]').val().validationCN()){
			alert('별명은 한글 최소 2글자에서 최대 10글자로 입력해주세요.');
			$('input[name=mem_nickname]').focus();
			return false;
		}
		
		if($('input[name=mem_bir1]').val() == '' || $('input[name=mem_bir2]').val() == '' || 
				$('input[name=mem_bir3]').val() == ''){
			alert('생일을 입력해주세요.');
			$('input[name=mem_bir1]').val('');
			$('input[name=mem_bir2]').val('');
			$('input[name=mem_bir3]').val('');
			$('input[name=mem_bir1]').focus();
			return false;
		}else{
			var mem_bir = $('input[name=mem_bir1]').val() + "/" + 
					  	  $('input[name=mem_bir2]').val() + "/" + 
					  	  $('input[name=mem_bir3]').val();
			$('input[name=mem_bir]').val(mem_bir);
			if(regBir.test($('input[name=mem_bir]').val()) == false){
				alert('생일을 형식에 맞게 입력해주세요.');
				$('input[name=mem_bir]').val('');
				$('input[name=mem_bir1]').val('');
				$('input[name=mem_bir2]').val('');
				$('input[name=mem_bir3]').val('');
				$('input[name=mem_bir1]').focus();
				return false;
			}
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
		
		if($('#agree1').is(":checked") == false){
			alert('개인정보 수집 및 취급방침 동의를 체크해주세요.');
			$('#agree1').focus();
			return false;
		}
		
		$('input[name=mem_name]').val($('input[name=mem_name1]').val());
		$('input[name=mem_hp]').val($('input[name=mem_hp1]').val());
		
		$('form').submit();
	});
});
</script>
</head>
<body>
	 <div class="login-top">
	         <a href="${pageContext.request.contextPath }/main.do"><img src="${pageContext.request.contextPath }/UI/img/logo.png" alt="logo"></a>
	    </div>
        <div class="headerSubandContent">
            <p>본인인증 > 회원가입</p>
            <h2 style="margin-top: 0px;margin-bottom: 0px;">회원가입</h2>
            <content>
            <div class="box-signup">
                <form class="join" action="${pageContext.request.contextPath}/join/insertMemberInfo.do" method="post">
                    <div class="id">
                        <label for="u_id"><p>아이디</p></label>
                        <input type="text" class="box-simple" id="u_id" name="mem_id" placeholder="">
                        <button class="box-simple" id="idCheck">중복검사</button></br>
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
                        <input class="box-simple" id="u_name" type="text" name="mem_name1" value="${map.mem_name }" disabled="true" placeholder="">
                        <input type="hidden" name="mem_name">
                    </div>
                    <div class="nickname">
                        <label for="u_nickname"><p>별명</p></label>
                        <input class="box-simple" id="u_nickname" type="text" name="mem_nickname" placeholder="">
                    </div>
                    <div class="bir">
                        <label for="u_bir"><p>생년월일</p></label>
                        <input type="hidden" name="mem_bir" />
                        <input class="box-simple-w100" id="u_bir1" type="text" name="mem_bir1" placeholder=""><span>&nbsp;년&nbsp;&nbsp;</span>
                        <input class="box-simple-w100" id="u_bir2" type="text" name="mem_bir2" placeholder=""><spanp>&nbsp;월&nbsp;&nbsp;</span>
                        <input class="box-simple-w100" id="u_bir3" type="text" name="mem_bir3" placeholder=""><span>&nbsp;일</span>
                    </div>
                    <div class="mail">
                        <label for="u_mail"><p>이메일</p></label>
                        <ul class="mailList">
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
                        <input type="text" class="box-simple" name="mem_hp1" value="${map.mem_hp }" disabled="true" placeholder="">
                        <input type="hidden" name="mem_hp">
                        <input type="button" class="box-simple" onclick="javascript:location.href='${pageContext.request.contextPath}/join/joinCheck.do'" value="번호변경"></br>
                    </div>

                    <div class="add">
                        <p>주소</p>
                        <input type="text" id="sample6_postcode" class="box-simple-w100" name="mem_zip" placeholder="우편번호">
                        <input type="button" onclick="sample6_execDaumPostcode()" class="box-simple" value="우편번호 찾기"><br>
                        <input type="text" id="sample6_address" class="box-simple-w200" name="mem_add1" placeholder="상세주소1">
                        <input type="text" id="sample6_detailAddress" class="box-simple-w200" name="mem_add2" placeholder="상세주소2">
                        <input type="hidden" id="sample6_extraAddress" class="box-simple" placeholder="주소"><br>
                    </div>

                    <div class="submitBtn">
                        <div class="agree"><input type="checkbox" id="agree1"><label for="agree1">&nbsp;개인정보 수집 및 취급방침에 동의합니다.</label></div>
                        <input class="btn-simple" type="button" id="signUp" value="회원가입">
                        <input class="btn-simple" type="button" onclick="javascript:location.href='${pageContext.request.contextPath}/main/main.do'" value="취소">
                    </div>
                </form>
            </div> 
            </content>
        </div>
</body>
</html>