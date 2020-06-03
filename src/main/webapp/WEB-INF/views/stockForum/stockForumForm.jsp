<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주식토론글 작성</title>
<script>
$(function(){
    $('#sf_content').summernote({
    		lang: 'ko-KR',
			height: 150,
			codemirror: {
			theme: 'monokai'
		}
    });
    
    $('#listBtn').click(function(){
		location.href='${pageContext.request.contextPath}/stockForum/stockForumList.do';
	});
    
    $('form').submit(function(){
    	
    	if($('#sf_title').val()==""){
    		alert('제목을 입력해주세요.');
    		return false;
    	}
    	
    	var fbo_content = $('#sf_content').summernote('code');
    	if(fbo_content=="<p></p>"){
    		alert('제목을 입력해주세요.');
    		return false;
    	}
    	
		$(this).attr("action", "${pageContext.request.contextPath }/stockForum/insertStockForum.do");
        $(this).append("<input type='hidden' id='sf_content' name='sf_content' value='" + fbo_content + "'/>");
        var flag = true;
		$('input[type=file]').each(function(idx, targetTag){
			if(!/\.(jpg|jpeg|gif|png)/.test($(targetTag).val().toLowerCase())){
// 				alert('이미지 파일만 업로드 할 수 있습니다.');
				//원래코드
// 				flag = false;
			}
		});
		return flag;
	});
    
});
</script>
</head>
<body>
<div class="wrap">
        <div class="headerSubandContent">
            <content>
                <div class="box-article">
                <form class="articleContent" action="" method="post" enctype="multipart/form-data">
                    <div class="smallTitle">
            			<b>글쓰기</b>
            		</div>
                    <div class="titleSub">
                        <label for="a_no"><span>게시글 번호:${stockForumInfo.sf_rnum}</span></label>
                        <label for="a_id"><span>글쓴이: ${LOGIN_MEMBERINFO.mem_nickname}</span></label>
                        <label for="a_date"><span>날짜:${stockForumInfo.sf_reg_date}</span></label>
                        <label for="a_date"><span>조회수:${stockForumInfo.sf_hit}</span></label>
                    </div>
                    	<input type="hidden" class="form-control" id="sf_no" name="sf_no" value="${stockForumInfo.sf_no }" >
                    	<input type="hidden" class="form-control" id="mem_id" name="mem_id" value="${LOGIN_MEMBERINFO.mem_id }" >
                    	<input type="hidden" class="form-control" id="sf_writer" name="sf_writer" value="${LOGIN_MEMBERINFO.mem_nickname }" >
                        <div class="title">
                            <label for="a_title"><span>제목</span></label>
                            <input type="text" class="box-simple-full" id="sf_title" name="sf_title" placeholder="">
                        </div>
                    <div id="sf_content"></div>
                    <div class="form-group">
						<label class="control-label col-sm-2" for="file01">첨부파일1:</label>
						<div class="col-sm-10">
							 <input type="file" class="filestyle" id="file01" name="files" data-buttonName="btn-primary">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="file02">첨부파일2:</label>
						<div class="col-sm-10">
							 <input type="file" class="filestyle" id="file02" name="files" data-buttonName="btn-primary">
						</div>
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