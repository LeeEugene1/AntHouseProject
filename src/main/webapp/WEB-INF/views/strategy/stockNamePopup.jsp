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
	
	$('#stockItemListTBY tr').click(function sendChildValue(){
		var code = $(this).find('td:eq(0) input').val();
		var codeT = code.substr(1,7);
		opener.document.getElementById("inputCode").value = codeT;
		window.close();
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
                <div>
	               	<form id="formSummit" action="${pageContext.request.contextPath }/strategy/stockNamePopup.do?" method="post" class="form-inline pull-right">
						<ul class="board_search2" name="search_keycode" id="search_keycode">
	                        <li><input name="search_keyword" id="search_keyword" type="text" class="box-simple" value="" placeholder="종목검색" /></li>
	                        <button class="box-simple" type="submit"> <img src="${pageContext.request.contextPath }/UI/img/search-bk.png" alt="" style="width:40%;"></button></br>
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
                                <th scope="col">종목이름</th>
                                <th scope="col">종목코드</th>
                            </tr>
                        </thead>
                        
                        
                        <tbody id='stockItemListTBY'>
							<c:forEach items="${stockItemList }" var="stockItemInfo">
								<tr>
									<td><input type="hidden" value="${stockItemInfo.stock_item_code }"/>${stockItemInfo.stock_Item_rnum }</td>
<!-- 									<td><input type="hidden" value="test"/>test</td> -->
									<td class="tLeft">
									${stockItemInfo.stock_item_name }</td>
									<td>${stockItemInfo.stock_item_code }</td>
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