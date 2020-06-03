<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
$(function(){
    $('#listBtn').click(function(){
    	location.href='${pageContext.request.contextPath}/stockPortfolio/stockPortfolioList.do';
    });
    $('#deleteBtn').click(function(){
    	var pfs_code = "${listView.get(0).pfs_code }";
    	location.href='${pageContext.request.contextPath}/stockportfolio/deletePFS.do?pfs_code='+pfs_code;
    });
    if ('${LOGIN_ADMININFO.admin_id}' != 'admin') {
		$('#deleteBtn').hide();
	}else{
		$('#deleteBtn').show();
	}
});
</script>
</head>
<body>
<div class="wrap">
        <div class="headerSubandContent">
            <p>전략공작소 > 주식전략 포트폴리오</p>
            <h2 style="margin-top: 0px;margin-bottom: 0px;">포트폴리오 전략</h2>
            <content>
                <div class="box-article">
                <form class="articleContent" action="" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
                     <div class="title">
						<label for="a_title"><span>전략코드</span></label> 
						<input type="text"
							class="box-simple-full" id="pfs_code" name="pfs_code"
							value="${listView.get(0).pfs_code }" disabled="disabled"
							placeholder="">
					</div>
					
					<div class="name">
						<label for="a_name"><span>전략이름</span></label> 
						<input type="text"
							class="box-simple-full" id="pfs_name" name="pfs_name"
							value="${listView.get(0).pfs_name }" disabled="disabled"
							placeholder="">
					</div>
					
					<div class="start">
						<label for="a_start"><span>기준 시작일</span></label> 
						<input type="text"
							class="box-simple-full" id="pfs_start_date" name="pfs_start_date"
							value="${listView.get(0).pfs_start_date }" disabled="disabled"
							placeholder="">
					</div>
					<div class="end">
						<label for="a_end"><span>기준 종료일</span></label> 
						<input type="text"
							class="box-simple-full" id="pfs_end_date" name="pfs_end_date"
							value="${listView.get(0).pfs_end_date }" disabled="disabled"
							placeholder="">
					</div>
					<div id="listView" style="width: 850px;">
                        			<table class="strategtTable" style="width:100%;">
                        				<thead>
                        					<tr>
                        						<th scope="col">종목코드</th>
												<th scope="col">종목이름</th>
												<th scope="col">기간수익률</th>
												<th scope="col">수익률(1M)</th>
												<th scope="col">수익률(3M)</th>
												<th scope="col">수익률(6M)</th>
												<th scope="col">수익률(9M)</th>
												<th scope="col">수익률(1Y)</th>
												<th scope="col">수익률(2Y)</th>
												<th scope="col">수익률(3Y)</th>
                        					</tr>
                        				</thead>
                        				<tbody id="testList">
                        					<c:forEach items="${listView }" var="viewInfo">
                        					<tr>
                        						<td>${viewInfo.stock_item_code }</td>
                        						<td>${viewInfo.stock_item_name }</td>
                        						<td>${viewInfo.pfs_rr }%</td>
                        						<td>${viewInfo.pfs_1month_rr }%</td>
                        						<td>${viewInfo.pfs_3month_rr }%</td>
                        						<td>${viewInfo.pfs_6month_rr }%</td>
                        						<td>${viewInfo.pfs_9month_rr }%</td>
                        						<td>${viewInfo.pfs_1year_rr }%</td>
                        						<td>${viewInfo.pfs_2year_rr }%</td>
                        						<td>${viewInfo.pfs_3year_rr }%</td>
                        						</tr>
                        					</c:forEach>
                        				</tbody>
                        			</table>
                        </div>
                    
                    <div class="submitBtn">
                        <input id="deleteBtn" class="btn-simple" type="button" name="" value="삭제">
                        <input id="listBtn"class="btn-simple" type="button" value="목록">
                    </div>
                </form>
            </div> 
            </content>
        </div>
                    
</div>
</body>
</html>