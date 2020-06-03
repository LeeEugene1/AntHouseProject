<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주식강좌 뷰</title>
<script>
$(function(){
    $('#sl_content').summernote({
    		lang: 'ko-KR',
			height: 400,
			codemirror: {
			theme: 'monokai'
		}
    });
    $('#sl_content').summernote('code', '${stockLectureInfo.sl_content}');
    
    $('#lectureUpdateBtn').click(function(){
    	var sl_no = "${stockLectureInfo.sl_no}";
		var sl_title = $('#sl_title').val();
		var sl_content = $('#sl_content').summernote('code');
		var lecture_url = $('#lecture_url').val();
		location.href='${pageContext.request.contextPath}/stockLecture/updateStockLecture.do?sl_no='+ sl_no +'&sl_title=' + sl_title +'&sl_content=' + sl_content +'&lecture_url=' + lecture_url;
	});
    
    $('#lectureListBtn').click(function(){
		location.href='${pageContext.request.contextPath}/stockLecture/stockLectureList.do';
	});
    
    if('${LOGIN_ADMININFO}'==""){
        $('#lectureUpdateBtn').hide();
    } else {
        $('#lectureUpdateBtn').show();
    }
    
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
                <form class="articleContent" method="post">
                    <div class="titleSub">
                        <label for="a_id"><span>글쓴이: ${stockLectureInfo.sl_writer}</span></label>
                        <label for="a_date"><span>날짜:${stockLectureInfo.sl_reg_date}</span></label>
                        <label for="a_date"><span>조회수:${stockLectureInfo.sl_hit}</span></label>
                    </div>
                    	<input type="hidden" class="form-control" id="sl_no" name="sl_no" value="${stockLectureInfo.sl_no }" >
                    	<input type="hidden" class="form-control" id="admin_id" name="admin_id" value="${LOGIN_ADMININFO.admin_id }" >
                    	<input type="hidden" class="form-control" id="sl_writer" name="sl_writer" value="${LOGIN_ADMININFO.admin_name }" >
                    <div class="title">
                        <label for="a_title"><span>제목</span></label>
                        <input type="text" class="box-simple-full" id="sl_title" name="sl_title" value="${stockLectureInfo.sl_title }" placeholder="">
                    </div>
                    <div id="sl_content"></div>
                    <div class="form-group">
						<label class="control-label col-sm-2" for="lecture_url">강좌URL:</label>
						<div class="col-sm-10">
							 <input type="text" class="box-simple-full" id="lecture_url" name="lecture_url" value="${stockLectureInfo.lecture_url }" data-buttonName="btn-primary">
						</div>
					</div>
                    <div class="submitBtn">
                        <input id="lectureUpdateBtn" class="btn-simple" type="button" value="확인">
                        <input id="lectureListBtn" class="btn-simple" type="button" value="목록">
                    </div>
                </form>
            </div> 
            </content>
        </div>
                    
    </div>
</body>
</html>