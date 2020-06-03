<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	var mailAdd = '';
	
	$('#mailBtn').click(function(){
		if($('input[name=mem_id]').val() == ''){
			alert('아이디를 입력해주세요.');
			$('input[name=mem_id]').focus();
			return false;
		}
		
		if($('input[name=mem_mail]').val() == ''){
			alert('이메일 주소를 입력해주세요.');
			$('input[name=mem_mail]').focus();
			return false;
		}
		
		if($('input[name=mail_pass]').val() == ''){
			alert('이메일 비밀번호를 입력해주세요.');
			$('input[name=mail_pass]').focus();
			return false;
		}
		
		$.ajax({
			type : 'post',
			url:'${pageContext.request.contextPath}/join/sendPw.do',
			dataType:'json',
			data:{ mem_id : $('input[name=mem_id]').val() 
				,mem_mail : $('input[name=mem_mail]').val() 
				,mem_mail_box : $('input[name=mem_mail_box]').val() },
			error:function(result){
					alert(result.status);
				},
			success:function(result){
					if(result.flag == 'true'){
						alert('인증번호가 전송되었습니다.');
						mailAdd = result.mailAdd;
						$('input[name=mem_mail_box]').focus();
						return false;
					}else{
						alert('인증번호 전송에 실패하였습니다.');
						$('input[name=mail_pass]').val('');
						$('input[name=mail_pass]').focus();
						return false;
					}
				}
		});
		return false;
	});
	
	$('#pwFindBtn').click(function(){
		if($('input[name=mem_id]').val() == ''){
			alert('아이디를 입력해주세요.');
			$('input[name=mem_id]').focus();
			return false;
		}
		
		if($('input[name=mem_mail]').val() == ''){
			alert('이메일 주소를 입력해주세요.');
			$('input[name=mem_mail]').focus();
			return false;
		}
		
		if($('input[name=mail_pass]').val() == ''){
			alert('이메일 비밀번호를 입력해주세요.');
			$('input[name=mail_pass]').focus();
			return false;
		}
		
		if($('input[name=mem_mail_box]').val() == ''){
			alert('인증번호를 입력하세요.');
			alert(hpNum);
			$('input[name=mem_mail_box]').focus();
			return false;
		}else if($('input[name=mem_mail_box]').val() != mailAdd){
			alert('인증번호를 정확히 입력하세요.');
			$('input[name=mem_mail_box]').val('');
			$('input[name=mem_mail_box]').focus();
			return false;
		}else{
			$('form').submit();
		}
		return false;
	});
});

if(eval('${!empty param.message}')){
	   alert('${param.message}');
}

</script>
</head>
<body>
 <div class="login-top">
         <a href="${pageContext.request.contextPath }/main.do"><img src="${pageContext.request.contextPath }/UI/img/logo.png" alt="logo"></a>
    </div>
    <div class="headerSubandContent">
        <p>메인화면 > PW찾기</p>
        <h2 style="margin-top: 0px;margin-bottom: 0px;">PW찾기</h2>
        <content>
        <div class="box-signup">
            <form class="login" action="${pageContext.request.contextPath}/join/viewPw.do" method="post">
                <div class="name">
                    <p>아이디</p>
                    <input class="box-simple" type="text" name="mem_id" placeholder="">
                </div>
                <div class="mail">
                    <p>이메일주소</p>
                    <input type="text" class="box-simple" name="mem_mail" placeholder="'@'포함">
                    <button class="box-simple" id="mailBtn">인증번호받기</button></br>
                    <input type="text" class="box-simple" name="mem_mail_box" placeholder="인증번호입력"><br>
                </div>
                <div class="submitBtn">
                    <input class="btn-simple" type="button" id="pwFindBtn" value="다음">
                    <input class="btn-simple" type="button" onclick="javascript:location.href='${pageContext.request.contextPath}/main.do'" value="취소">
                </div>
            </form>
        </div> 
        </content>
    </div>
</body>
</html>