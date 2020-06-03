<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>토론글 뷰</title>
<script>
$(function(){
    $('#sf_content').summernote({
    		lang: 'ko-KR',
			height: 150,
			codemirror: {
			theme: 'monokai'
		}
    });
    $('#sf_content').summernote('code', '<font color ="black">${stockForumInfo.sf_content}</font>');
    $('#sf_content').summernote('disable');
    
    if('${LOGIN_MEMBERINFO.mem_id}' != "${stockForumInfo.mem_id}"){
        $('#updateView').hide();
        $('#deleteBtn').hide();
        
    } else {
        $('#updateView').show();
        $('#deleteBtn').show();
    }
    
//     if('${stockForumInfo.sf_status}' == "N"){
//     	location.href='${pageContext.request.contextPath}/stockForum/stockForumList.do';
//     } 
    
    
    $('#deleteBtn').click(function(){
		var sf_no = "${stockForumInfo.sf_no}";
		location.href='${pageContext.request.contextPath}/stockForum/deleteStockForum.do?sf_no='+ sf_no;
	});
    
    $('#listBtn').click(function(){
		location.href='${pageContext.request.contextPath}/stockForum/stockForumList.do';
	});
    
    $('#updateView').click(function(){
    	var sf_no = "${stockForumInfo.sf_no}";
    	var sf_rnum = "${stockForumInfo.sf_rnum}";
		location.href='${pageContext.request.contextPath}/stockForum/stockForumViewUpdate.do?sf_no='+ sf_no+'&sf_rnum='+sf_rnum;
	});
    
    $('#replyBtn').click(function(){
    	var title = encodeURIComponent("${stockForumInfo.sf_title}");
    	var params = 'sf_rnum=${param.sf_rnum}&sf_group=${stockForumInfo.sf_group}&sf_seq=${stockForumInfo.sf_seq}&sf_depth=${stockForumInfo.sf_depth}&title='+title;
		location.href='${pageContext.request.contextPath}/stockForum/stockForumReplyForm.do?'+ params;
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
            			<b>게시글</b>
            		</div>
                    <div class="titleSub">
                        <label for="a_no"><span>게시글 번호:${stockForumInfo.sf_rnum}</span></label>
                        <label for="a_id"><span>글쓴이:${stockForumInfo.sf_writer}</span></label>
                        <label for="a_date"><span>날짜:${stockForumInfo.sf_reg_date}</span></label>
                        <label for="a_date"><span>조회수:${stockForumInfo.sf_hit}</span></label>
                    </div>
                    	<input type="hidden" class="form-control" id="sf_no" name="sf_no" value="${stockForumInfo.sf_no }" >
                        <div class="title">
                            <label for="a_title"><span>제목</span></label>
                            <input type="text" class="box-simple-full" id="sf_title" name="sf_title" value="${stockForumInfo.sf_title }"  disabled="disabled" placeholder="">
                        </div>
                    <div id="sf_content"><p></p></div>
					<c:choose>
						<c:when test="${!empty stockForumInfo.sf_items }">
							<div class="form-group">
								<label class="control-label col-sm-2" for="sf_content"><p>첨부파일</p></label>
								<div class="carousel-inner" role="listbox" style="display:flex;">
									<c:forEach items="${stockForumInfo.sf_items }" var="sfFileItem" varStatus="stat">
									<c:choose>
										<c:when test="${fn:contains(sfFileItem.sf_file_type,'image')}">
											<div class="col-sm-10">
												<div class="item active">
													<img src="/files/${sfFileItem.sf_file_save_name}" alt="pic1" 
														onclick="javascript:location.href='${pageContext.request.contextPath}/file/fileDownload.do?fileName=${sfFileItem.sf_file_save_name }';">
												</div>
											</div>
										</c:when>
										<c:otherwise>
											<div class="col-sm-10">
												<i class="far fa-file">
		               								<input type="button" class="filestyle" id="file01" name="files" value="${sfFileItem.sf_file_name}" />
		             							</i>
	           								</div>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</div>
						</c:when>
						<c:otherwise>
							<div class="form-group">
								<label class="control-label col-sm-2" for="sf_content"><p>첨부파일이 없습니다.</p></label>
								<div class="carousel-inner" role="listbox" style="display:flex;">
							</div>
						</c:otherwise>
					</c:choose>
					</div>
					
 				 <div class="submitBtn">
                        <input id="replyBtn" class="btn-simple" type="button" name="" value="덧글작성">
                        <input id="updateView" class="btn-simple" type="button" name="" value="수정">
                        <input id="listBtn" class="btn-simple" type="button" value="목록">
                        <input id="deleteBtn" class="btn-simple" type="button" value="삭제">
                    </div>
                </form>
            </div> 
            </content>
        </div>
                    
    </div>
</body>
</html>