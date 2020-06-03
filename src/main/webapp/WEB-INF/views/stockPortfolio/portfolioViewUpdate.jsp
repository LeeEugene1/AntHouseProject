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
    $('#portfolio_content').summernote('code', '${portfolioInfo.portfolio_content} ');
    
    $('form').submit(function(){
    	var portfolio_content = $('#portfolio_content').summernote('code');
		$(this).attr("action", "${pageContext.request.contextPath }/stockPortfolio/updatePortfolio.do");
        $(this).append("<input type='hidden' id='portfolio_content' name='portfolio_content' value='" + portfolio_content + "'/>");
	});
    $('#listBtn').click(function(){
		location.href='${pageContext.request.contextPath}/stockPortfolio/stockPortfolioList.do';
	});
    $('#deleteBtn').click(function(){
    	var portfolio_code = "${portfolioInfo.portfolio_code}";
		location.href='${pageContext.request.contextPath}/stockPortfolio/deletePortfolio.do?portfolio_code='+portfolio_code;
	});
});
</script>
</head>
<body>
<div class="wrap">
        <div class="headerSubandContent">
            <p>전략공작소 > 포트폴리오</p>
            <h2 style="margin-top: 0px;margin-bottom: 0px;">포트폴리오 수정</h2>
            <content>
                <div class="box-article">
                <form class="articleContent" action="" method="post">
                    	<input type="hidden" class="form-control" id="portfolio_code" name="portfolio_code" value="${portfolioInfo.portfolio_code }" >
                        <div class="name">
                            <label for="a_name"><span>포트폴리오 이름</span></label>
                            <input type="text" class="box-simple-full" id="portfolio_name" name="portfolio_name" value="${portfolioInfo.portfolio_name }" placeholder="">
                        </div>
                        <div class="title">
                            <label for="a_title"><span>포트폴리오 제목</span></label>
                            <input type="text" class="box-simple-full" id="portfolio_title" name="portfolio_title" value="${portfolioInfo.portfolio_title }" placeholder="">
                        </div>
                    <div id="portfolio_content"><p></p></div>
                    
                    <div class="submitBtn">
                        <input id="updateBtn" class="btn-simple" type="submit" name="" value="수정">
                        <input id="listBtn" class="btn-simple" type="button" value="목록">
                        <input id="deleteBtn" class="btn-simple" type="button" value="삭제">
                    </div>
                </form>
            </div> 
            </content>
        </div>
    </div>
</body>
</html>