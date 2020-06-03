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
		if($('input[name=mem_name]').val() == ''){
			alert('이름을 입력해주세요.');
			$('input[name=mem_name]').focus();
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
	});
	
	$('#idFindBtn').click(function(){
		if($('input[name=mem_name]').val() == ''){
			alert('이름을 입력해주세요.');
			$('input[name=mem_name]').focus();
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
        <p>메인화면 > ID찾기</p>
        <h2 style="margin-top: 0px;margin-bottom: 0px;">ID찾기</h2>
        <content>
        <div class="box-signup">
            <form class="login" action="${pageContext.request.contextPath}/join/sendId.do" method="post">
                <div class="name">
                    <p>이름</p>
                    <input class="box-simple" type="text" name="mem_name" placeholder="">
                </div>
                <div class="mail">
                    <p>이메일주소</p>
                    <input type="text" class="box-simple" name="mem_mail" placeholder="'@'포함">
                    <button class="box-simple" id="mailBtn">이메일로 아이디받기</button></br>
                </div>
                <div class="submitBtn">
                    <input class="btn-simple" type="button" onclick="javascript:location.href='${pageContext.request.contextPath}/main.do'" value="취소">
                </div>
            </form>
        </div> 
        </content>
    </div>
</body>
</html>