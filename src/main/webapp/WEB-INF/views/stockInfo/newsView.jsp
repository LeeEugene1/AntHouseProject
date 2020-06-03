<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	$(function(){
		$.ajax({
			type : 'post',
			url : '${pageContext.request.contextPath}/crawler/newsView.do?${link}',
			dataType : 'json',
			error : function(result){
				console.log(result);
			},
			success:function(result){
				$(".news").append("<div class='newsTitleSub'><p><img src='"+result.newsAuth+"'/></p><p>"+result.newsDate+"</p></div><div class='newsTitle' style='margin-top:15px;'><p>"+result.newsTitle+"</p></div><div class='newsContentView'><p>"+result.newsDesc+"</p></div>");
			}
		});
		
		$("#listBtn").click(function(){
			location.href = "${pageContext.request.contextPath}/stockInfo/newsList.do";
		})
		
	})
</script>
<style type="text/css">
span.end_photo_org, .img_desc, .media_end_summary {
    display: block;
}
</style>
</head>
<body>
<div class="wrap">
        <div class="headerSubandContent">
    <div class="wrap2">
        <div class="news">

        </div>
        <div class="Btn">
            <input type="button" name="" class="btn-simple-login" id="listBtn" value="뉴스목록">
            <input type="button" name="" class="btn-simple-login" value="뒤로가기" onclick="javascript:history.back()">
        </div>
    </div>
</div>
                    
    </div>
</body>
</html>