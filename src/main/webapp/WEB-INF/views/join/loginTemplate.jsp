<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title"/></title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;900&display=swap" rel="stylesheet">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/UI/css/anthouse.css">
<script src="${pageContext.request.contextPath }/UI/js/anthouse.js"></script>
<style type="text/css">
html,body{
	height:100%;
}
body {
    padding-top: 44px;
    box-sizing: border-box;
}
.login-top{
	position:absolute;
	top:0;
	left:0;
    width: 100%;
    text-align: center;
    padding-top: 10px;
    padding-bottom: 5px;
    background: #F70F3C;
}
.login-back {
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
}

</style>
</head>
<body>
	<tiles:insertAttribute name="content"></tiles:insertAttribute>
</body>

</html>