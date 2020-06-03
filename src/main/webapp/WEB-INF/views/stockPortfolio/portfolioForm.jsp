<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
$(function(){
    $('#portfolio_content').summernote({
    		lang: 'ko-KR',
			height: 150,
			codemirror: {
			theme: 'monokai'
		}
    });
    
    $('form').submit(function(){
    	
    	if($('#portfolio_name').val()==""){
    		alert('포트폴리오 이름을 입력해주세요.');
    		return false;
    	}
    	if($('#portfolio_title').val()==""){
    		alert('포트폴리오 제목을 입력해주세요.');
    		return false;
    	}
    	
    	
    	var portfolio_content = $('#portfolio_content').summernote('code');
		$('form').attr("action", "${pageContext.request.contextPath }/stockPortfolio/insertPortfolio.do");
		 $('form').append("<input type='hidden' id='portfolio_content' name='portfolio_content' value='" + portfolio_content + "'/>");
	});
    
    $('#listBtn').click(function(){
    	location.href='${pageContext.request.contextPath}/stockPortfolio/stockPortfolioList.do';
    });
    
});
</script>
</head>
<body>
<div class="wrap">
        <div class="headerSubandContent">
            <p>전략공작소 > 주식전략 포트폴리오</p>
            <h2 style="margin-top: 0px;margin-bottom: 0px;">포트폴리오</h2>
            <content>
                <div class="box-article">
                <form class="articleContent" action="" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
                    	<input type="hidden" class="form-control" id="portfolio_code" name="portfolio_code" value="" >
                         <div class="name">
                            <label for="a_name"><span>포트폴리오 이름</span></label>
                            <input type="text" class="box-simple-full" id="portfolio_name" name="portfolio_name" placeholder="">
                        </div>
                        <div class="title">
                            <label for="a_title"><span>제목</span></label>
                            <input type="text" class="box-simple-full" id="portfolio_title" name="portfolio_title" placeholder="">
                        </div>
                    <div id="portfolio_content"><p></p></div>
                    
                    <div class="submitBtn">
                        <input id="insertBtn" class="btn-simple" type="submit" name="" value="확인">
                        <input id="listBtn" class="btn-simple" type="button" value="목록">
                    </div>
                </form>
            </div> 
            </content>
        </div>
                    
    </div>
</body>
</html>