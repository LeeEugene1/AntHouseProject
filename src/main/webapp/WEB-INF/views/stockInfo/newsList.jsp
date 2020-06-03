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
			url : '${pageContext.request.contextPath}/crawler/newsList.do',
			dataType : 'json',
			error : function(result){
				console.log(result);
			},
			success:function(result){
				console.log(result);
				$(result.newsList).each(function(i, data){
					var desc = data.newsDesc.split('..');
					var link = data.newsLink.split('?');
					$(".wrap2").append("<div class='news' onClick='newsLink(this)' data-value='"+link[1]+"' style='cursor:pointer;margin-bottom:40px;'><div class='newsTitle'><p>"+data.newsTitle+"</p></div><div class='newsTitleSub'><span>"+data.newsAuth+"</span> <span>&nbsp;|&nbsp;</span> <span>"+data.newsDate+"</span></div><div class='newsContent'><p>"+desc[0]+"...</p></div></div>");
				});
			}
		})
	
	})
</script>
</head>
<body>
	<div class="wrap">
        <div class="headerSubandContent">
    	<div class='wrap2'>
    	</div>
	</div>
    </div>
    <script type="text/javascript">
    var link;
	function newsLink(target){
		link = target.getAttribute("data-value");
		location.href='${pageContext.request.contextPath }/stockInfo/newsView.do?'+link;
	}
    </script>
</body>
</html>