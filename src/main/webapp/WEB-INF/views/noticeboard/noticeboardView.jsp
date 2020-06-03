<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 뷰</title>
<script>
	$(function(){
		$('#notice_content').summernote({
			lang: 'ko-KR',
			height:150,
			codemirror:{
				theme:'monokai'
			}
		});
		$('#notice_content').summernote('code','<font color="black">${noticeboardInfo.notice_content}</font>');
		$('#notice_content').summernote('disable');
		
		$('#deleteBtn').click(function(){
			var notice_no = "${noticeboardInfo.notice_no}";
			location.href='${pageContext.request.contextPath}/noticeboard/deleteNoticeboard.do?notice_no='+notice_no;
		});
		
		$('#listBtn').click(function(){
			location.href='${pageContext.request.contextPath}/noticeboard/noticeboardList.do'
		});
		
		$('#updateView').click(function(){
			var notice_no = "${noticeboardInfo.notice_no}";
	    	var notice_rnum = "${noticeboardInfo.notice_rnum}";

			location.href='${pageContext.request.contextPath}/noticeboard/noticeboardViewUpdate.do?notice_no='+notice_no+'&notice_rnum='+notice_rnum;
		});
		
		if('${LOGIN_ADMININFO.admin_id}' != "${noticeboardInfo.admin_id}"){
	        $('#updateView').hide();
			$('#deleteBtn').hide();
		}else{
			$('#updateView').show();
	        $('#deleteBtn').show();			
		}
		
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
            			<b>게시글</b>
            		</div>
                     <div class="titleSub">
                        <label for="a_no"><span>게시글 번호:${noticeboardInfo.notice_rnum}</span></label>
                        <label for="a_id"><span>글쓴이:${noticeboardInfo.admin_id}</span></label>
                        <label for="a_date"><span>날짜:${noticeboardInfo.notice_reg_date}</span></label>
                        <label for="a_date"><span>조회수:${noticeboardInfo.notice_hit}</span></label>
                    </div>
                   
                   	<input type="hidden" class="form-control" id="notice_no" name="notice_no" value="${noticeboardInfo.notice_no }" >
                    <div class="title">
                        <label for="a_title"><span>제목</span></label>
                        <input type="text" class="box-simple-full" id="notice_title" name="notice_title" value="${noticeboardInfo.notice_title }"  disabled="disabled" placeholder="">
                    </div>
                
                    <div id="notice_content"><p></p></div>
					
                    <div class="submitBtn">
                        <input id="updateView" class="btn-simple" type="button" name="" value="수정">
                        <input id="deleteBtn" class="btn-simple" type="button" value="삭제">
                        <input id="listBtn" class="btn-simple" type="button" value="목록">
                    </div>
                </form>
            	</div> 
            </content>
        </div>
                    
    </div>
</body>
</html>