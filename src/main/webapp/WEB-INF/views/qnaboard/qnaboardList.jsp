<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>QNA 목록</title>

<script type="text/javascript">
$(function(){
	
	$('#insertBtn').click(function(){
		if('${LOGIN_MEMBERINFO}'!=""){
			location.href = '${pageContext.request.contextPath}/qnaboard/qnaboardForm.do';
		}else{
			alert("로그인 후 이용가능한 서비스입니다.");
			location.href = '${pageContext.request.contextPath}/login/login.do';
		}
		
	});
	$('#qnaboardListTBY tr').click(function(){
		var qna_no = $(this).find('td:eq(0) input').val();
	    var qna_rnum = $(this).find('td:eq(0)').text();
	    var qna_pass = $(this).find('td:eq(1) input').val();
	    alert(qna_pass);
      	if('${LOGIN_ADMININFO.admin_id}'=='admin'){
         	location.href = '${pageContext.request.contextPath}/qnaboard/qnaboardView.do?qna_no='+ qna_no+'&qna_rnum='+qna_rnum;
      	}else{
         	var qnaPass = prompt("비밀번호를 입력해 주세요","");
         	if(qna_pass == qnaPass){
            	location.href = '${pageContext.request.contextPath}/qnaboard/qnaboardView.do?qna_no='+ qna_no+'&qna_rnum='+qna_rnum;
         	}else{
            	alert("비밀번호를 다시 확인해주세요");
            return false;
         }
      }
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
                <form action="${pageContext.request.contextPath }/qnaboard/qnaboardList.do" method="post" class="form-inline pull-right">
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
                        
			            <tbody id='qnaboardListTBY'>
						<c:forEach items="${qnaboardList }" var="qnaboardInfo">
							<tr>
								<td><input type="hidden" value="${qnaboardInfo.qna_no }"/>${qnaboardInfo.qna_rnum }</td>
								<td class="tLeft">
								<input type="hidden" name="qna_pass" value= "${qnaboardInfo.qna_pass }"/>
								<input type="hidden" name="qna_depth" value= "${qnaboardInfo.qna_depth }"/>
								<c:forEach begin="1" end="${qnaboardInfo.qna_depth }" varStatus="stat">
	               					&nbsp;&nbsp;&nbsp;
	               					<c:if test="${stat.last }">
	               						<i class="fa fa-angle-right"></i>
	               					</c:if>
	              				</c:forEach>
									${qnaboardInfo.qna_title }
								</td>
								<td>${qnaboardInfo.qna_writer }</td>
								<td>${fn:substring(qnaboardInfo.qna_reg_date, 0, 10) }</td>
								<td>${qnaboardInfo.qna_hit }</td>
								

							</tr>
							</c:forEach>
						</tbody>
                        
                    </table>
                	${paginationHtmls }
                    <!-- page_navi start -->
<!--                     <div class="page_navi"> -->
<!--                         <a href="#" class="prev"><span>이전</span></a> -->
<!--                         <span> -->
<!--                             <strong>1</strong> -->
<!--                             <a href="#">2</a> -->
<!--                             <a href="#">3</a> -->
<!--                             <a href="#">4</a> -->
<!--                             <a href="#">5</a> -->
<!--                             <a href="#">6</a> -->
<!--                         </span>                     -->
<!--                         <a href="#" class="next"><span>다음</span></a> -->
<!--                     </div> -->
                    <!-- page_navi end -->
                    <div class="writeBtn" id="insertBtn">
                        <input class="btn-simple" type="submit" name="" value="글쓰기">
                    </div>
                    
                </div>
            
            </content>
        </div>
    </div>
</body>
</html>