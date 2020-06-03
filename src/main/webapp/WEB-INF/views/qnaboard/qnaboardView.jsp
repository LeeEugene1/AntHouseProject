<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QNA 뷰</title>

<script>
$(function() {
	$('#qna_content').summernote({
   		lang: 'ko-KR',
		height: 150,
		codemirror: {
		theme: 'monokai'
		}	
    });
    $('#qna_content').summernote('code', '${qnaboardInfo.qna_content}');
    $('#qna_content').summernote('disable');
    
    $('#deleteBtn').click(function(){
		var qna_no = "${qnaboardInfo.qna_no}";
		location.href='${pageContext.request.contextPath}/qnaboard/deleteQNAboard.do?qna_no='+ qna_no;
	});
    
    $('#listBtn').click(function(){
		location.href='${pageContext.request.contextPath}/qnaboard/qnaboardList.do';
	});
    
    $('#updateView').click(function(){
    	var qna_no = "${qnaboardInfo.qna_no}";
		location.href='${pageContext.request.contextPath}/qnaboard/qnaboardViewUpdate.do?qna_no='+ qna_no;
	});
    
    $('#replyBtn').click(function(){
		if('${LOGIN_ADMININFO}'!=""){
	    	var title = encodeURIComponent("${qnaboardInfo.qna_title}");
			var params = 'qna_rnum=${param.qna_rnum}&qna_pass=${qnaboardInfo.qna_pass}&qna_group=${qnaboardInfo.qna_group}&qna_g_seq=${qnaboardInfo.qna_g_seq}&qna_depth=${qnaboardInfo.qna_depth}&title='+title;
			location.href='${pageContext.request.contextPath}/qnaboard/qnaboardReplyForm.do?'+ params;
		}else{
			alert("관리자 권한입니다.")
		}
	});
    
    if('${LOGIN_MEMBERINFO.mem_id}'!= "${qnaboardInfo.mem_id}"){
        $('#updateView').hide();
    } else {
        $('#updateView').show();
    }
    
    if('${LOGIN_ADMININFO}'==""){
        $('#replyBtn').hide();
    } else {
        $('#replyBtn').show();
    }
    
    if('${LOGIN_ADMININFO}'==""&&'${LOGIN_MEMBERINFO.mem_id}'!= "${qnaboardInfo.mem_id}"){
    	$('#deleteBtn').hide();
    } else {
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
						<label for="a_no"><span>게시글 번호&nbsp;:&nbsp;${param.qna_rnum}</span></label> <label
							for="a_id"><span>글쓴이&nbsp;:&nbsp;${qnaboardInfo.qna_writer}</span></label> <label
							for="a_date"><span>날짜&nbsp;:&nbsp;${qnaboardInfo.qna_reg_date}</span></label>
						<label for="a_date"><span>조회수&nbsp;:&nbsp;${qnaboardInfo.qna_hit}</span></label>
					</div>
					<input type="hidden" class="form-control" id="qna_no" name="qna_no"
						value="${qnaboardInfo.qna_no }">
					<div class="title">
						<label for="a_title"><span>제목</span></label> <input type="text"
							class="box-simple-full" id="qna_title" name="qna_title"
							value="${qnaboardInfo.qna_title }" disabled="disabled"
							placeholder="">
					</div>
					<p>내용</p>
					<div id="qna_content">
						<p></p>
					</div>
					<c:choose>
						<c:when test="${!empty qnaboardInfo.qna_items }">
							<div class="form-group">
								<label class="control-label col-sm-2" for="qna_content"><p>첨부파일</p></label>
								<div class="carousel-inner" role="listbox" style="display:flex;">
									<c:forEach items="${qnaboardInfo.qna_items }" var="qnaFileItem" varStatus="stat">
									<c:choose>
										<c:when test="${fn:contains(qnaFileItem.qna_file_type,'image')}">
											<div class="col-sm-10">
												<div class="item active">
													<img src="/files/${qnaFileItem.qna_file_save_name}" alt="pic1"
													onclick="javascript:location.href='${pageContext.request.contextPath}/file/fileDownload.do?fileName=${qnaFileItem.qna_file_save_name }';">
												</div>
											</div>
										</c:when>

										<c:otherwise>
											<div class="col-sm-10">
											<i class="far fa-file">
	               								<input type="button" class="filestyle" id="file01" name="files" value="${qnaFileItem.qna_file_name}" 
	               								onclick="javascript:location.href='${pageContext.request.contextPath}/file/fileDownload.do?fileName=${qnaFileItem.qna_file_save_name }';"/>
	             							</i>
	           								</div>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</div>
						</c:when>
						<c:otherwise>
							<div class="form-group">
								<label class="control-label col-sm-2" for="qna_content"><p></p></label>
								<div class="carousel-inner" role="listbox" >
							</div>
						</c:otherwise>
					</c:choose>
			</div>

			<div class="submitBtn">
				<input id="replyBtn" class="btn-simple" type="button" name=""
					value="답글작성"> <input id="updateView" class="btn-simple"
					type="button" name="" value="수정"> <input id="listBtn"
					class="btn-simple" type="button" value="목록"> <input
					id="deleteBtn" class="btn-simple" type="button" value="삭제">
			</div>
			</form>
		</content>
		</div>
	</div>
	</div>
</body>
</html>