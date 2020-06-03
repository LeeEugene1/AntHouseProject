<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주식강좌 작성</title>
<script>
$(function(){
    $('#sl_content').summernote({
    		lang: 'ko-KR',
			height: 150,
			codemirror: {
			theme: 'monokai'
		}
    });
    
    $('#listBtn').click(function(){
		location.href='${pageContext.request.contextPath}/stockLecture/stockLectureList.do';
	});
    
    $('#insertBtn').click(function(){
    	var sl_content = $('#sl_content').summernote('code');
        $(this).append("<input type='hidden' id='sl_content' name='sl_content' value='" + sl_content + "'/>");
		$('form').submit();
	});
    
});
</script>
</head>
<body>
<div class="wrap">
        <div class="headerSubandContent">
            <p>주식정보 > 주식강좌</p>
            <h2 style="margin-top: 0px;margin-bottom: 0px;">주식강좌방</h2>
            <content>
                <div class="box-article">
                <form class="articleContent" action="${pageContext.request.contextPath }/stockLecture/insertStockLecture.do" method="post" enctype="multipart/form-data">
                    <div class="titleSub">
                        <label for="a_no"><span>게시글 번호:${stockLectureInfo.sl_no}</span></label>
                        <label for="a_id"><span>글쓴이: ${stockLectureInfo.sl_writer}</span></label>
                        <label for="a_date"><span>날짜:${stockLectureInfo.sl_reg_date}</span></label>
                        <label for="a_date"><span>조회수:${stockLectureInfo.sl_hit}</span></label>
                    </div>
                    	<input type="hidden" class="form-control" id="sl_no" name="sl_no" value="${stockLectureInfo.sl_no }" >
                    	<input type="hidden" class="form-control" id="admin_id" name="admin_id" value="${LOGIN_ADMININFO.admin_id }" >
                    	<input type="hidden" class="form-control" id="sl_writer" name="sl_writer" value="${LOGIN_ADMININFO.admin_name }" >
                    <div class="title">
                        <label for="a_title"><span>제목</span></label>
                        <input type="text" class="box-simple-full" id="sl_title" name="sl_title" placeholder="">
                    </div>
                    <div id="sl_content"></div>
                    <div class="form-group">
						<label class="control-label col-sm-2" for="file01">첨부파일:</label>
						<div class="col-sm-10">
							 <input type="file" class="filestyle" id="file01" name="files" data-buttonName="btn-primary">
						</div>
					</div>
                    <div class="form-group">
						<label class="control-label col-sm-2" for="lecture_url">강좌URL:</label>
						<div class="col-sm-10">
							 <input type="text" class="box-simple-full" id="lecture_url" name="lecture_url" data-buttonName="btn-primary">
						</div>
					</div>
                    <div class="submitBtn">
                        <input id="insertBtn" class="btn-simple" type="button" name="" value="확인">
                        <input id="listBtn" class="btn-simple" type="button" value="목록">
                    </div>
                </form>
            </div> 
            </content>
        </div>
                    
    </div>
</body>
</html>