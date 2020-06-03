<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:getAsString name="title"/></title>
</head>
<body>
		<tiles:insertAttribute name="header"></tiles:insertAttribute>
		<div id="common_wrap">
			<tiles:insertAttribute name="left"></tiles:insertAttribute>
			<tiles:insertAttribute name="content"></tiles:insertAttribute>
			<tiles:insertAttribute name="right"></tiles:insertAttribute>
		</div>
		<tiles:insertAttribute name="footer"></tiles:insertAttribute>
</body>
</html>