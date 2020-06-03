<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
if('${param.message}'){
	alert('${param.message}');
}
$(function(){
	$('#loginCheck').click(function(){
		if($('input[name=mem_id]').val() == ''){
			alert('아이디를 입력해주세요.');
			$('input[name=mem_id]').focus();
			return false;
		}
		if($('input[name=mem_pass]').val() == ''){
			alert('비밀번호를 입력해주세요.');
			$('input[name=mem_pass]').focus();
			return false;
		}
		$('form').submit();
	});
});
</script>
</head>
<body>
<div class="page-content login-back">
 <div class="login-top">
         <a href="${pageContext.request.contextPath }/main.do"><img src="${pageContext.request.contextPath }/UI/img/logo.png" alt="logo"></a>
    </div>
    <div class="box">
        <form class="login" action="${pageContext.request.contextPath }/login/loginCheck.do" method="post">
            <input type="text" name="mem_id" placeholder="ID">
            <input type="password" name="mem_pass" placeholder="Password">
            <input type="button" id="loginCheck" value="Login">
        </form>
        <div class="others">
            <a href="${pageContext.request.contextPath }/join/idFind.do"><span>아이디찾기 | </span></a>
            <a href="${pageContext.request.contextPath }/join/pwFind.do"><span>비밀번호찾기 | </span></a>
            <a href="${pageContext.request.contextPath }/join/joinCheck.do"><span>회원가입</span></a>
        </div>
    </div>
 </div>
</body>
</html>