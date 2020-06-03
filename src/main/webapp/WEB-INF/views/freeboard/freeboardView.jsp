<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자유게시판 뷰</title>
<script>
$(function(){
    $('#fr_bo_content').summernote({
    		lang: 'ko-KR',
			height: 150,
			codemirror: {
			theme: 'monokai'
		}
    });
    $('#fr_bo_content').summernote('code', '<font color ="black">${freeboardInfo.fr_bo_content}</font>');
    $('#fr_bo_content').summernote('disable');
    
    if('${LOGIN_MEMBERINFO.mem_id}' != "${freeboardInfo.mem_id}"){
        $('#updateView').hide();
        $('#deleteBtn').hide();
        
    } else {
        $('#updateView').show();
        $('#deleteBtn').show();
    }
    
    $('#deleteBtn').click(function(){
		var fr_bo_no = "${freeboardInfo.fr_bo_no}";
		location.href='${pageContext.request.contextPath}/freeboard/deleteFreeboard.do?fr_bo_no='+ fr_bo_no;
	});
    
    $('#listBtn').click(function(){
		location.href='${pageContext.request.contextPath}/freeboard/freeboardList.do';
	});
    
    
    $('#updateView').click(function(){
    	var fr_bo_no = "${freeboardInfo.fr_bo_no}";
    	var fr_bo_rnum = "${freeboardInfo.fr_bo_rnum}";
		location.href='${pageContext.request.contextPath}/freeboard/freeboardViewUpdate.do?fr_bo_no='+ fr_bo_no+'&fr_bo_rnum='+fr_bo_rnum;
	});
    
    $('#replyBtn').click(function(){
    	var title = encodeURIComponent("${freeboardInfo.fr_bo_title}");
    	var params = 'fr_bo_rnum=${param.fr_bo_rnum}&fr_bo_group=${freeboardInfo.fr_bo_group}&fr_bo_seq=${freeboardInfo.fr_bo_seq}&fr_bo_depth=${freeboardInfo.fr_bo_depth}&title='+title;
		location.href='${pageContext.request.contextPath}/freeboard/freeboardReplyForm.do?'+ params;
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
                        <label for="a_no"><span>게시글 번호:${freeboardInfo.fr_bo_rnum}</span></label>
                        <label for="a_id"><span>글쓴이:${freeboardInfo.fr_bo_writer}</span></label>
                        <label for="a_date"><span>날짜:${freeboardInfo.fr_bo_reg_date}</span></label>
                        <label for="a_date"><span>조회수:${freeboardInfo.fr_bo_hit}</span></label>
                    </div>
                    	<input type="hidden" class="form-control" id="fr_bo_no" name="fr_bo_no" value="${freeboardInfo.fr_bo_no }" >
                        <div class="title">
                            <label for="a_title"><span>제목</span></label>
                            <input type="text" class="box-simple-full" id="fr_bo_title" name="fr_bo_title" value="${freeboardInfo.fr_bo_title }"  disabled="disabled" placeholder="">
                        </div>
                    <div id="fr_bo_content"><p></p></div>
                    
                    <c:choose>
						<c:when test="${!empty freeboardInfo.fr_bo_items }">
							<div class="form-group">
								<label class="control-label col-sm-2" for="fr_bo_content"><p>첨부파일</p></label>
								<div class="carousel-inner" role="listbox" style="display:flex;">
									<c:forEach items="${freeboardInfo.fr_bo_items }" var="fr_boFileItem" varStatus="stat">
									<c:choose>
										<c:when test="${fn:contains(fr_boFileItem.fr_file_type,'image')}">
											<div class="col-sm-10">
												<div class="item active">
													<img src="/files/${fr_boFileItem.fr_file_save_name}" alt="pic1" 
														onclick="javascript:location.href='${pageContext.request.contextPath}/file/fileDownload.do?fileName=${fr_boFileItem.fr_file_save_name }';">
												</div>
											</div>
										</c:when>
										<c:otherwise>
											<div class="col-sm-10">
											<i class="far fa-file">
	               								<input type="button" class="filestyle" id="file01" name="files" value="${fr_boFileItem.fr_file_name}" />
	             							</i>
	           								</div>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</div>
						</c:when>
						<c:otherwise>
							<div class="form-group">
								<label class="control-label col-sm-2" for="fr_bo_content"><p>첨부파일이 없습니다.</p></label>
								<div class="carousel-inner" role="listbox" style="display:flex;">
							</div>
						</c:otherwise>
					</c:choose>
					</div>
					
                    <div class="submitBtn">
                        <input id="replyBtn" class="btn-simple" type="button" name="" value="댓글작성">
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