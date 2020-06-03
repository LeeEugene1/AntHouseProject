<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
$(function(){
    $('#faq_content').summernote({
    		lang: 'ko-KR',
			height: 150,
			codemirror: {
			theme: 'monokai'
		}
    });
    $('#faq_content').summernote('code', '${faqboardInfo.faq_content} ');
    
    $('form').submit(function(){
    	var faq_content = $('#faq_content').summernote('code');
		$(this).attr("action", "${pageContext.request.contextPath }/faqboard/updateFAQboard.do");
        $(this).append("<input type='hidden' id='faq_content' name='faq_content' value='" + faq_content + "'/>");
	});
    $('#listBtn').click(function(){
		location.href='${pageContext.request.contextPath}/faqboard/faqboardList.do';
	});
    
});
</script>
</head>
<body>
<div class="wrap">
        <div class="headerSubandContent">
            <p>커뮤니티 > 자주 찾는 질문</p>
            <h2 style="margin-top: 0px;margin-bottom: 0px;">자주 찾는 질문</h2>
            <content>
                <div class="box-article">
                <form class="articleContent" action="" method="post">
                    <div class="titleSub">
                        <label for="a_no"><span>게시글 번호:${faqboardInfo.faq_no}</span></label>
                        <label for="a_id"><span>글쓴이:${faqboardInfo.faq_writer}</span></label>
                        <label for="a_date"><span>날짜:${faqboardInfo.faq_reg_date}</span></label>
                        <label for="a_date"><span>조회수:${faqboardInfo.faq_hit}</span></label>
                    </div>
                    	<input type="hidden" class="form-control" id="faq_no" name="faq_no" value="${faqboardInfo.faq_no }" >
                        <div class="title">
                            <label for="a_title"><span>제목</span></label>
                            <input type="text" class="box-simple-full" id="faq_title" name="faq_title" value="${faqboardInfo.faq_title }" placeholder="">
                        </div>
                    <div id="faq_content"><p></p></div>
                    
                    <div class="submitBtn">
                        <input id="updateBtn" class="btn-simple" type="submit" name="" value="확인">
                        <input id="listBtn"class="btn-simple" type="button" value="목록">
                    </div>
                </form>
            </div> 
            </content>
        </div>
    </div>
</body>
</html>