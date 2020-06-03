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
			url : '${pageContext.request.contextPath}/crawler/forumView.do?${link}',
			dataType : 'json',
			error : function(result){
				console.log(result);
			},
			success:function(result){
				console.log(result)
				$(".news").append("<div class='newsTitle' style='margin-top:15px;'><p>"+result.forumTitle+"</p></div><div class='newsTitleSub'><span>"+result.forumAuth+"</span>&nbsp;&nbsp;&nbsp;<span>"+result.forumDate+"</span></div><div class='newsTitleSub'><span>조회수&nbsp;"+result.forumCount+"</span>&nbsp;&nbsp;&nbsp;<span style='color:red;'>추천&nbsp;"+result.forumUp+"</span>&nbsp;&nbsp;&nbsp;<span style='color:blue;'>반대&nbsp;"+result.forumDown+"</span></div><div class='newsContentView'><p>"+result.forumContent+"</p></div>");
			}
		});
		
		$("#listBtn").click(function(){
			window.open("https://finance.naver.com/item/board_read.nhn?${link}","_blank");
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
            <input type="button" name="" class="btn-simple-login" id="listBtn" value="네이버에서 원본보기">
            <input type="button" name="" class="btn-simple-login" value="뒤로가기" onclick="javascript:history.back()">
        </div>
    </div>
</div>
                    
    </div>
</body>
</html>