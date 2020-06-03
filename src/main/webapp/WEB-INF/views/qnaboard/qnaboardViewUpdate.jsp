<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
$(function(){
    $('#qna_content').summernote({
    		lang: 'ko-KR',
			height: 150,
			codemirror: {
			theme: 'monokai'
		}
    });
    $('#qna_content').summernote('code', '${qnaboardInfo.qna_content} ');
    
    $('form').submit(function(){
    	if($('#qna_title').val()==""){
    		alert('제목을 입력해주세요.');
    		return false;
    	}
    	
    	var qna_content = $('#qna_content').summernote('code');
    	if(qna_content == "<p><br></p><p></p><p></p><p></p>    "){
    		alert('내용을 입력해주세요.');
    		return false;
    	}
    	var qna_group = ${qnaboardInfo.qna_group};
		$(this).attr("action", "${pageContext.request.contextPath }/qnaboard/updateQNAboard.do");
        $(this).append("<input type='hidden' id='qna_content' name='qna_content' value='" + qna_content + "'/>");
        $(this).append("<input type='hidden' id='qna_group' name='qna_group' value='" + qna_group + "'/>");
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
            			<b>게시글 수정</b>
            		</div>
                    <div class="titleSub">
                        <label for="a_no"><span>게시글 번호:${qnaboardInfo.qna_no}</span></label>
                        <label for="a_id"><span>글쓴이:${qnaboardInfo.qna_writer}</span></label>
                        <label for="a_date"><span>날짜:${qnaboardInfo.qna_reg_date}</span></label>
                        <label for="a_date"><span>조회수:${qnaboardInfo.qna_hit}</span></label>
                    </div>
                    	<input type="hidden" class="form-control" id="qna_no" name="qna_no" value="${qnaboardInfo.qna_no }" >
                        <div class="title">
                            <label for="a_title"><span>제목</span></label>
                            <input type="text" class="box-simple-full" id="qna_title" name="qna_title" value="${qnaboardInfo.qna_title }" placeholder="">
                        </div>
                        <div class="pass">
                            <label for="a_pass"><span>비밀번호</span></label>
                            <input type="password" class="box-simple-full" id="qna_pass" name="qna_pass" value="${qnaboardInfo.qna_pass }" placeholder="">
                        </div>
                    <div id="qna_content"></div>
                    <!-- <dt><label for="u_file">파일첨부</label></dt> -->
                    
                        <div class="cs_file">
                            <input type="file" class="input_file" id="u_file">
                            <div class="file_name">파일명</div><a href="#">검색</a>
                        </div>
                        <div class="cs_file">
                            <input type="file" class="input_file" id="u_file">
                            <div class="file_name">파일명</div><a href="#">검색</a>
                        </div>
                    
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