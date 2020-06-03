<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
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
            <form class="login" action="${pageContext.request.contextPath}/join/sendPw.do" method="post">
                <div class="name">
                    <p>고객님의 비밀번호는 ${memberInfo.mem_pass }입니다.</p>
                </div>
                <div class="submitBtn">
                    <input class="btn-simple" type="button" onclick="javascript:location.href='${pageContext.request.contextPath}/main.do'" value="메인으로 가기">
                </div>
            </form>
        </div> 
        </content>
    </div>
</body>
</html>