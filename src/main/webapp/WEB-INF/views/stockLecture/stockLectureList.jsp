<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	$('#lectureBtn').click(function(){
		location.href='${pageContext.request.contextPath}/stockLecture/stockLectureForm.do';
	});
	
	$('#stockListTBY tr').click(function(){
		var sl_no = $(this).find('td:eq(0) input').val();
        location.href = '${pageContext.request.contextPath}/stockLecture/stockLectureView.do?sl_no='+ sl_no;
	});
});	

if(eval('${!empty param.message}')){
   alert('${param.message}');
}
</script>
</head>
<body>
    <div class="wrap">

        <div class="headerSubandContent">
            <content>
                <div class="wrap2">

                    <ul class="board_search" name="search_keycode">
                        <li><input type="radio" name="search_keycode" id="search01" checked="checked" /><label for="search01">전체</label></li>
                        <li><input type="radio" name="search_keycode" id="search02" /><label for="search02">제목</label></li>
                        <li><input type="radio" name="search_keycode" id="search03" /><label for="search03">작성자</label></li>
                        <li><input name="search_keyword" id="search_keyword" type="text" title="검색어를 입력하세요" /><input type="submit" value="검색" /></li>
                    </ul>
                    
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" summary="주식강좌를 나타낸 표" class="board_list">
	                    <thead>
	                    	<tr>
	                    		<th scope="col">이미지</th>
	                    		<th scope="col">제목</th>
	                    		<th scope="col">작성일</th>
	                    		<th scope="col">작성자</th>
	                    		<th scope="col">조회수</th>
	                    	</tr>
	                    </thead>
	                    <tbody id="stockListTBY">
							<c:forEach items="${stockLectureList }" var="stockLectureInfo">
								<tr>
									<td>
				                        <div class="item img">
				                        	<c:forEach items="${stockLectureInfo.sl_items }" var="slFileItem" varStatus="stat">
				                            	<img src="/files/${slFileItem.sl_img_save_name}" alt="">
				                            </c:forEach>
				                        </div>
				                        <div class="videoTitleandContent">
				                            <div class="lectureTitle">
												<input type="hidden" value="${stockLectureInfo.sl_no }"/>
				                                <td>${stockLectureInfo.sl_title }</td>
				                            </div>
				                            <div class="lectureTitleSub">
				                                <td>${stockLectureInfo.sl_reg_date }</td>
				                                <td>${stockLectureInfo.sl_writer }</td>
				                                <td>${stockLectureInfo.sl_hit }</td>
				                            </div>
				                        </div>
			                        </td>
		                    	</tr>
							</c:forEach>
						</tbody>
					</table>
                	${paginationHtmls }
                    <c:if test="${!empty LOGIN_ADMININFO }">
                    	<c:if test="${empty LOGIN_MEMBERINFO }">
                    		<div class="writeBtn">
                        		<input class="btn-simple" type="button" id="lectureBtn" value="글쓰기">
                    		</div>
                    	</c:if>
                    </c:if>
                </div>
            </content>
        </div>

   </div> 

</body>
</html>