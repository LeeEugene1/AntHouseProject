<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자유게시판 목록</title>
<script type="text/javascript">
$(function(){
	$('#insertBtn').click(function(){
		if('${LOGIN_MEMBERINFO}'!=""){
			location.href = '${pageContext.request.contextPath}/freeboard/freeboardForm.do';
		}else{
			alert("로그인 후 이용가능한 서비스입니다.");
			location.href = '${pageContext.request.contextPath}/login/login.do';
		}
	});
	$('#freeboardListTBY tr').click(function(){
		var fr_bo_test = $(this).find('td:eq(1) input').val();
		if(fr_bo_test=="N"){
			alert("삭제된 글입니다.");
			return;
		}
		if('${LOGIN_MEMBERINFO}'!=""||'${LOGIN_ADMININFO}'!=""){
			var fr_bo_no = $(this).find('td:eq(0) input').val();   
			var fr_bo_rnum = $(this).find('td:eq(0)').text();
			location.href = '${pageContext.request.contextPath}/freeboard/freeboardView.do?fr_bo_no='+ fr_bo_no+'&fr_bo_rnum='+fr_bo_rnum;
		}else{
			alert("로그인 후 이용가능한 서비스입니다.");
			location.href = '${pageContext.request.contextPath}/login/login.do';
		}
	}); 
	
   if(eval('${!empty param.message}')){
      alert('${param.message}');
   }
});	
</script>
</head>
<body>
<div class="wrap">
        <div class="headerSubandContent">
            <content>
                <div class="wrap2">
                	<form action="${pageContext.request.contextPath }/freeboard/freeboardList.do" method="post" class="form-inline pull-right">
						<ul class="board_search" name="search_keycode">
                        <li><input type="radio" name="search_keycode" id="search01" value="search01" checked="checked" /><label for="search01">전체</label></li>
                        <li><input type="radio" name="search_keycode" id="search02" value="search02"/><label for="search02">제목</label></li>
                        <li><input type="radio" name="search_keycode" id="search03" value="search03"/><label for="search03">작성자</label></li>
                        <li><input name="search_keyword" id="search_keyword" type="text" title="검색어를 입력하세요" /><input type="submit" value="검색" /></li>
                    </ul>
                	</form>
                
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" summary="공지사항을 나타낸 표" class="board_list">
                        <colgroup>
                            <col style="width:8%" />
                            <col style="width:60" />
                            <col style="width:16%" />
                            <col style="width:16%" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th scope="col">번호</th>
                                <th scope="col">제목</th>
                                <th scope="col">작성자</th>
                                <th scope="col">작성일</th>
                                <th scope="col">조회수</th>
                            </tr>
                        </thead>
                        
                        <tbody id='freeboardListTBY'>
							<c:forEach items="${freeboardList }" var="freeboardInfo">
								<c:choose>
						            <c:when test="${freeboardInfo.fr_bo_status == 'Y' }">
										<tr>
											<td><input type="hidden" value="${freeboardInfo.fr_bo_no }"/>${freeboardInfo.fr_bo_rnum }</td>
											<td class="tLeft">
											<input type="hidden" id="fr_bo_status" name="fr_bo_status" value= "${freeboardInfo.fr_bo_status }"/>
											<input type="hidden" name="fr_bo_depth" value= "${freeboardInfo.fr_bo_depth }"/>
											<c:forEach begin="1" end="${freeboardInfo.fr_bo_depth }" varStatus="stat">
				               					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				               					<c:if test="${stat.last }">
				               						ㄴ<i class="fa fa-angle-right"></i>
				               					</c:if>
				              				</c:forEach>
											${freeboardInfo.fr_bo_title }</td>
											<td>${freeboardInfo.fr_bo_writer }</td>
											<td>${fn:substring(freeboardInfo.fr_bo_reg_date, 0, 10) }</td>
											<td>${freeboardInfo.fr_bo_hit }</td>
										</tr>
									</c:when>
									<c:otherwise>
										<tr>
											<td><input type="hidden" value="${freeboardInfo.fr_bo_no }"/>${freeboardInfo.fr_bo_rnum }</td>
											<td class="tLeft">
											<input type="hidden" name="fr_bo_status" value= "${freeboardInfo.fr_bo_status }"/>
											<input type="hidden" name="fr_bo_depth" value= "${freeboardInfo.fr_bo_depth }"/>
											<c:forEach begin="1" end="${freeboardInfo.fr_bo_depth }" varStatus="stat">
				               					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				               					<c:if test="${stat.last }">
				               						ㄴ<i class="fa fa-angle-right"></i>
				               					</c:if>
				              				</c:forEach>
											삭제된 글입니다.</td>
											<td>${freeboardInfo.fr_bo_writer }</td>
											<td>${fn:substring(freeboardInfo.fr_bo_reg_date, 0, 10) }</td>
											<td>${freeboardInfo.fr_bo_hit }</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</tbody>
                    </table>
                    ${paginationHtmls }
                    <div class="writeBtn" id="insertBtn">
                        <input class="btn-simple" type="submit" name="" value="글쓰기">
                    </div>
                </div>
            </content>
        </div>

    </div>
</body>
</html>