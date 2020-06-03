<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주식토론글 댓글</title>
<script>
$(function(){
    $('#qna_content').summernote({
    		lang: 'ko-KR',
			height: 150,
			codemirror: {
			theme: 'monokai'
		}
    });
    $('#qna_content').summernote('code', '<font color ="black">${qnaboardInfo.qna_content}</font> ');
    
    $('form').submit(function(){
    	if($('#qna_title').val()==""){
    		alert('제목을 입력해주세요.');
    		return false;
    	}
    	
    	var qna_content = $('#qna_content').summernote('code');
   	
		$(this).attr("action", "${pageContext.request.contextPath }/qnaboard/insertQNAReply.do");
        $(this).append("<input type='hidden' id='qna_content' name='qna_content' value='" + qna_content + "'/>");
        $(this).append("<input type='hidden' id='qna_writer' name='qna_writer' value='${LOGIN_ADMININFO.admin_name }'>");
        $(this).append("<input type='hidden' id='qna_pass' name='qna_pass' value='${param.qna_pass}'/>");
        $(this).append("<input type='hidden' id='qna_group' name='qna_group' value='${param.qna_group}'/>");
        $(this).append("<input type='hidden' id='qna_g_seq' name='qna_g_seq' value='${param.qna_g_seq}'/>");
        $(this).append("<input type='hidden' id='qna_depth' name='qna_depth' value='${param.qna_depth}'/>");
        $(this).append("<input type='hidden' id='admin_id' name='admin_id' value='${LOGIN_ADMININFO.admin_id }'/>");
	});
    
    $('#listBtn').click(function(){
		location.href='${pageContext.request.contextPath}/qnaboard/qnaboardList.do';
	});
    
});
</script>
</head>
<body>
<div class="wrap">
        <div class="headerSubandContent">
            <content>
                <div class="box-article">
                <form class="articleContent" action="" method="post">
                    <div class="smallTitle">
            			<b>글쓰기</b>
            		</div>
                    <div class="titleSub">
                        <label for="a_no"><span>게시글 번호:${param.qna_rnum}</span></label>
                        <label for="a_id"><span>제목:${param.title}</span></label>
                    </div>
                    	<input type="hidden" class="form-control" id="qna_no" name="qna_no" value="${qnaboard.qna_no }" >
                        <div class="title">
                            <label for="a_title"><span>제목</span></label>
                            <input type="text" class="box-simple-full" id="qna_title" name="qna_title" value="관리자 답변 : ${qnaboardInfo.qna_title }" placeholder="">
                        </div>
                    <div id="qna_content"></div>
                    <div class="submitBtn">
                        <input id="updateBtn" class="btn-simple" type="submit" name="" value="확인">
                        <input id="listBtn" class="btn-simple" type="button" value="목록">
                    </div>
                </form>
            </div> 
            </content>
        </div>
    </div>
</body>
</html>