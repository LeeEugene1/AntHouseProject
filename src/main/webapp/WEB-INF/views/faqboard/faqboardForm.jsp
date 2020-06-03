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
    
    $('form').submit(function(){
    	var faq_content = $('#faq_content').summernote('code');
		$(this).attr("action", "${pageContext.request.contextPath }/faqboard/insertFAQboard.do");
		$(this).append("<input type='hidden' id='faq_content' name='faq_content' value='" + faq_content + "'/>");
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
                <form class="articleContent" action="" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
                    <div class="titleSub">
                    </div>
                    	<input type="hidden" class="form-control" id="faq_no" name="faq_no" value="${faqboardInfo.faq_no }" >
                    	<input type="hidden" class="form-control" id="admin_id" name="admin_id" value="${LOGIN_ADMININFO.admin_id }" >
                    	<input type="hidden" class="form-control" id="faq_writer" name="faq_writer" value="${LOGIN_ADMININFO.admin_name }" >
                        <div class="title">
                            <label for="a_title"><span>제목</span></label>
                            <input type="text" class="box-simple-full" id="faq_title" name="faq_title" placeholder="">
                        </div>
                    <div id="faq_content"><p></p></div>
                    
                    <div class="submitBtn">
                        <input id="updateBtn" class="btn-simple" type="submit" name="" value="확인">
                        <input class="btn-simple" type="button" value="목록">
                    </div>
                </form>
            </div> 
            </content>
        </div>
                    
    </div>
</body>
</html>