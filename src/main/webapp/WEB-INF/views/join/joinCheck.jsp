<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type='text/javascript' src='${pageContext.request.contextPath}/UI/js/validation.js'></script>
<script type="text/javascript">
$(function(){
	var hpNum = '';
	
	$('#hpBtn').click(function(){
		if($('input[name=mem_name]').val() == ''){
			alert('이름을 입력해주세요.');
			$('input[name=mem_name]').focus();
			return false;
		}
		
		if(!$('input[name=mem_name]').val().validationNM()){
			alert('이름은 한글 최소2글자에서 최대5글자로 입력해주세요.');
			$('input[name=mem_name]').focus();
			return false;
		}
		
		if($('input[name=mem_hp]').val() == ''){
			alert('휴대전화 번호를 입력해주세요.');
			$('input[name=mem_hp]').focus();
			return false;
		}
		
		if(!$('input[name=mem_hp]').val().validationHP()){
			alert('-를 포함하여 올바른번호를 입력해주세요 예) 010-1111-1111');
			$('input[name=mem_hp]').focus();
			return false;	
		}
		
		
		$.ajax({
			type : 'post',
			url:'${pageContext.request.contextPath}/join/sms.do',
			dataType:'json',
			data:{ mem_hp : $('input[name=mem_hp]').val() },
			error:function(result){
					alert(result.status);
				},
			success:function(result){
					if(result.flag == 'true'){
						alert('인증번호가 전송되었습니다.');
						$('input[name=mem_hp_box]').focus();
						hpNum = result.hpNum;
						return false;
					}else{
						alert('인증번호 전송에 실패하였습니다.');
						$('input[name=mem_hp]').val('');
						$('input[name=mem_hp]').focus();
						return false;
					}
				}
		});
		return false;
	});
	
	$('#joinBtn').click(function(){
		if($('input[name=mem_name]').val() == ''){
			alert('이름을 입력해주세요.');
			$('input[name=mem_name]').focus();
			return false;
		}
		
		if(!$('input[name=mem_name]').val().validationNM()){
			alert('이름은 한글 최소2글자에서 최대5글자로 입력해주세요.');
			return false;
		}
		
		if($('input[name=mem_hp]').val() == ''){
			alert('휴대전화 번호를 입력해주세요.');
			$('input[name=mem_hp]').focus();
			return false;
		}
		
		if($('input[name=mem_hp_box]').val() == ''){
			alert('인증번호를 입력하세요.');
			alert(hpNum);
			$('input[name=mem_hp_box]').focus();
			return false;
		}else if($('input[name=mem_hp_box]').val() != hpNum){
			alert('인증번호를 정확히 입력하세요.');
			alert(hpNum);
			$('input[name=mem_hp_box]').val('');
			$('input[name=mem_hp_box]').focus();
			return false;
		}else{
			$('form').submit();
		}
		return false;
	});
});

</script>
</head>
<body>
 <div class="login-top">
         <a href="${pageContext.request.contextPath }/main.do"><img src="${pageContext.request.contextPath }/UI/img/logo.png" alt="logo"></a>
    </div>
    <div class="headerSubandContent">
        <p>메인화면 > 본인인증</p>
        <h2 style="margin-top: 0px;margin-bottom: 0px;">본인인증</h2>
        <content>
        <div class="box-signup">
            <form class="login" action="${pageContext.request.contextPath}/join/joinForm.do" method="post">
                <div class="name">
                    <p>이름</p>
                    <input class="box-simple" type="text" name="mem_name" placeholder="">
                </div>
                <div class="ph">
                    <p>휴대전화</p>
                    <input type="text" class="box-simple" name="mem_hp" placeholder="'-'포함">
                    <button class="box-simple" id="hpBtn">인증번호받기</button></br>
                    <input type="text" class="box-simple" name="mem_hp_box" placeholder="인증번호입력"><br>
                </div>
                <div class="submitBtn">
                    <input class="btn-simple" type="button" id="joinBtn" value="다음">
                    <input class="btn-simple" type="button" onclick="javascript:location.href='${pageContext.request.contextPath}/main.do'" value="취소">
                </div>
            </form>
        </div> 
        </content>
    </div>
</body>
</html>