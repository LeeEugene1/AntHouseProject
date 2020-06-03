<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원관리</title>
<script type="text/javascript">
$(function(){

	$('#memberListTBY tr').click(function(){
		var mem_id = $(this).find('td:eq(0) input').val();   
		location.href = '${pageContext.request.contextPath}/admin/memberDetail.do?mem_id='+ mem_id;
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
                <div class="wrap3">
                
                    <form name="search_form" action="${pageContext.request.contextPath }/admin/userManagement.do" method="post">
                        <div class="search_userManagement" name="search_keycode">
                            <table>
                                <tbody>
                                    <tr>
                                        <td><label for="name">이름</label></td>
                                        <td>
                                            <input type="text" id="name" class="box-simple">
                                            <input type="text" id="name" class="box-simple" name="search_name"> 
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><label for="id">아이디</label></td>
                                        <td>
                                            <input type="text" id="id" class="box-simple" name="search_id"> 
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><label for="ph">휴대전화</label></td>
                                        <td>
                                            <input type="text" id= "ph" class="box-simple" name="search_hp"> 
                                        </td>
                                    </tr>                                                                
                                    <tr>
                                        <td><label for="mail">이메일</label></td>
                                        <td>
                                            <input type="text" id="mail" class="box-simple" name="search_mail"> 
                                        </td>
                                    </tr> 
                                    <tr>
                                        <td><label for="address">주소</label></td>
                                        <td>
                                            <input type="text" id="address" class="box-simple" name="search_address"> 
                                        </td>
                                    </tr>      
                                    <tr>
                                        <td><label for="birthday">생년월일</label></td>
                                        <td>
                                            <input type="date" class="box-simple-w150" id="birthday" name="birthday" name="search_date1">&nbsp;~&nbsp;
                                            <input type="date" class="box-simple-w150" id="birthday" name="birthday" name="search_date2">                                    </td>
                                        </td>
                                    </tr>                                                                                         
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td>
                                            <div class="submitBtn_userManagement">
                                            <input class="checkOut" type="button" value="탈퇴요청회원">
                                            <input class="btn-simple" type="submit" value="회원검색">
                                            <input class="btn-simple" type="reset" value="초기화"/>
                                        </div>
                                        </td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </form>
                
                    <table width="100%" border="0" cellspacing="0" cellpadding="0" summary="공지사항을 나타낸 표" class="board_list">
                        <colgroup>
                            <col style="width:10%" />
                            <col style="width:10%" />
                            <col style="width:10%" />
                            <col style="width:20%" />
                            <col style="width:20%" />
                            <col style="width:20%" />
                            <col style="width:10%" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th scope="col">번호</th>
                                <th scope="col">이름</th>
                                <th scope="col">아이디</th>
                                <th scope="col">생년월일</th>
                                <th scope="col">이메일</th>
                                <th scope="col">전화번호</th>
                                <th scope="col">탈퇴요청</th>
                            </tr>
                        </thead>
                        <tbody id='memberListTBY'>
                            <c:forEach items="${memberList }" var="memberListInfo">
								<tr>
									<td><input type="hidden" value="${memberListInfo.mem_id }"/>${memberListInfo.mem_rnum }</td>
									<td>${memberListInfo.mem_name }</td>
									<td>${memberListInfo.mem_id }</td>
									<td>${fn:substring(memberListInfo.mem_bir, 0, 10) }</td>
									<td>${memberListInfo.mem_mail }</td>
									<td>${memberListInfo.mem_hp }</td>
									<td>${memberListInfo.mem_deletecheck }</td>
								</tr>
							</c:forEach>
                        </tbody>
                    </table>
                	${paginationHtmls }
                </div>
            </content>
        </div>
    </div>
</body>
</html>