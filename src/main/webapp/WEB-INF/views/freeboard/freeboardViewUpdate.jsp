<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자유게시판 수정</title>
<script>
$(function(){
    $('#fr_bo_content').summernote({
    		lang: 'ko-KR',
			height: 150,
			codemirror: {
			theme: 'monokai'
		}
    });
    $('#fr_bo_content').summernote('code', '${freeboardInfo.fr_bo_content}');
    
    $('form').submit(function(){
    	if($('#fr_bo_title').val()==''){
    		alert('제목을 입력해주세요.');
    		return false;
    	}
    	
    	var fr_bo_content = $('#fr_bo_content').summernote('code');
    	if(fr_bo_content == "<p></p>"){
    		alert('내용을 입력해주세요.');
    		return false;
    	}
    	
    	$(this).attr("action", "${pageContext.request.contextPath }/freeboard/updateFreeboard.do");
        $(this).append("<input type='hidden' id='fr_bo_content' name='fr_bo_content' value='" + fr_bo_content + "'/>");
    	
    	return true;
    });
    
    $('#listBtn').click(function(){
		location.href='${pageContext.request.contextPath}/freeboard/freeboardList.do';
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
                        <label for="a_no"><span>게시글 번호:${freeboardInfo.fr_bo_rnum}</span></label>
                        <label for="a_id"><span>글쓴이:${freeboardInfo.fr_bo_writer}</span></label>
                        <label for="a_date"><span>날짜:${freeboardInfo.fr_bo_reg_date}</span></label>
                        <label for="a_date"><span>조회수:${freeboardInfo.fr_bo_hit}</span></label>
                    </div>
                    	<input type="hidden" class="form-control" id="fr_bo_no" name="fr_bo_no" value="${freeboardInfo.fr_bo_no }" >
                        <div class="title">
                            <label for="a_title"><span>제목</span></label>
                            <input type="text" class="box-simple-full" id="fr_bo_title" name="fr_bo_title" value="${freeboardInfo.fr_bo_title }" placeholder="">
                        </div>
                    <div id="fr_bo_content"></div>
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