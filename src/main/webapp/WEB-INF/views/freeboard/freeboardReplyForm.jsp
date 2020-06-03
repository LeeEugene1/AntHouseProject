<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자유게시판 댓글</title>
<script>
$(function(){
    $('#fr_bo_content').summernote({
    		lang: 'ko-KR',
			height: 150,
			codemirror: {
			theme: 'monokai'
		}
    });
    $('#fr_bo_content').summernote('code', '<font color ="black">${freeboardInfo.fr_bo_content}</font> ');
    
    $('form').submit(function(){
    	if($('#fr_bo_title').val()==""){
    		alert('제목을 입력해주세요.');
    		return false;
    	}
    	
    	var fbo_content = $('#fr_bo_content').summernote('code');
    	if(fbo_content == "<p></p>"){
    		alert('내용을 입력해주세요.');
    		return false;
    	}
    	$(this).attr("action", "${pageContext.request.contextPath }/freeboard/freeboardReplyInsert.do");
        $(this).append("<input type='hidden' id='fr_bo_content' name='fr_bo_content' value='" + fbo_content + "'/>");
        $(this).append("<input type='hidden' id='fr_bo_writer' name='fr_bo_writer' value='${LOGIN_MEMBERINFO.mem_nickname }'>");
        $(this).append("<input type='hidden' id='mem_id' name='mem_id' value='${LOGIN_MEMBERINFO.mem_id }'>");
        $(this).append("<input type='hidden' id='fr_bo_group' name='fr_bo_group' value='${param.fr_bo_group}'/>");
        $(this).append("<input type='hidden' id='fr_bo_seq' name='fr_bo_seq' value='${param.fr_bo_seq}'/>");
        $(this).append("<input type='hidden' id='fr_bo_depth' name='fr_bo_depth' value='${param.fr_bo_depth}'/>");
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
                <form class="articleContent" action="" method="post" enctype="multipart/form-data">
                    <div class="smallTitle">
            			<b>댓글쓰기</b>
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