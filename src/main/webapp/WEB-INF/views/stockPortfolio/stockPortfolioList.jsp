<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 부트스트랩 -->
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"> -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css"> -->
<style type="text/css">
table {
    width: 100%;
    text-align: center;
}
</style>

<script type="text/javascript">
$(function(){
	$.ajax({
		type : 'post',
		url : '${pageContext.request.contextPath}/stockportfolio/momList.do',
		dataType : 'json',
		error : function(result){
				console.log(result);
		},
		success:function(result){
// 			console.log(result);
// 			console.log(stockList);
// 			for(idx in stockList){
// 				console.log(stockList[idx]);				
// 			}
			$(result).each(function(i,data){
					console.log("#"+data.portfolio_code);
					$("#"+data.portfolio_code).append("<tr><td>"+data.pfs_code+"</td><td>"+data.pfs_name+
							                   "</td><td>"+data.pfs_start_date+"</td><td>"+data.pfs_end_date+
							                   "</td><td>"+data.pfs_1month_rr+"%</td><td>"+data.pfs_3month_rr+
							                   "%</td><td>"+data.pfs_6month_rr+"%</td><td>"+data.pfs_9month_rr+
							                   "%</td><td>"+data.pfs_1year_rr+"%</td><td>"+data.pfs_2year_rr+
							                   "%</td><td>"+data.pfs_3year_rr+"%</td></tr>");
			});
			$('tbody tr').click(function(){
				if('${LOGIN_MEMBERINFO}'!=""||'${LOGIN_ADMININFO}'!=""){
					var pfs_code = $(this).find('td:eq(0)').text();
					location.href = '${pageContext.request.contextPath}/stockPortfolio/PFSView.do?pfs_code='+ pfs_code;
				}else{
					alert("로그인 후 조회가능한 서비스 입니다.");
				}
			});
			
			
		}
	});
	
	
});
</script>
</head>
<body>
	<div class="wrap">
		<div class="headerSubandContent">
			<!-- TradingView Widget BEGIN -->
			<div class="tradingview-widget-container">
				<div id="tradingview_5a069"></div>

				<content>
				<div class="wraptable">
					<c:forEach items="${stockPortfolioList }" var="portfolioInfo">
						<div class="strategyText" name="${portfolioInfo.portfolio_code}">
							<input type="hidden" name="portfolio_code"
								value="${portfolioInfo.portfolio_code}" />
							<p class="name">${portfolioInfo.portfolio_name }</p>
							<i class="title">${portfolioInfo.portfolio_title }</i>
							<p class="content">${portfolioInfo.portfolio_content }</p>
						</div>
						<div class="container mb-3 mt-3" style="justify-content: center; display: flex;margin: 20px;">
							<div class="overflow-auto" style="width: 100%;">
							
								<table class="table table-striped table-bordered mytable">
									<thead>
										<tr>
											<th scope="col">전략코드</th>
											<th scope="col">전략이름</th>
											<th scope="col">시작일</th>
											<th scope="col">기준(종료)일</th>
											<th scope="col">수익률(1M)</th>
											<th scope="col">수익률(3M)</th>
											<th scope="col">수익률(6M)</th>
											<th scope="col">수익률(9M)</th>
											<th scope="col">수익률(1Y)</th>
											<th scope="col">수익률(2Y)</th>
											<th scope="col">수익률(3Y)</th>
										</tr>
									</thead>
									<tbody id="${portfolioInfo.portfolio_code}">
										
									</tbody>
								</table>
								
							</div>
						</div>
						<div class="writeBtn" id="insertBtn">
							<input class="btn-simple" id="${portfolioInfo.portfolio_code}"
								type="button" name="insertMomentum" value="등록">
						</div>

                    <hr>

					</c:forEach>
					<div class="writeBtn" id="insertBtn">
						<input class="btn-simple" id="insertPortfolio" type="button"
							name="" value="포트폴리오 등록">
					</div>
				</div>

				</content>
			</div>

		</div>
	</div>
	<!-- 부트스트랩 -->
	<!--     <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script> -->
	<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script> -->
	<!-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> -->
	<!-- 부트스트랩테이블 -->
<!-- 	<script -->
<!-- 		src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script> -->
<!-- 	<script -->
<!-- 		src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script> -->
		
	<script>
// 		$('.mytable').DataTable();
		$(function() {
			if ('${LOGIN_ADMININFO.admin_id}' != 'admin') {
				$('#insertPortfolio').hide();
				$('input[name=insertMomentum]').hide();
			}else{
				$('#insertPortfolio').show();
				$('input[name=insertMomentum]').show();
			}
			$('#insertPortfolio').click(function() {
				location.href = '${pageContext.request.contextPath}/stockPortfolio/portfolioForm.do';
			});

			if ('${LOGIN_ADMININFO.admin_id}' == 'admin') {
				$(".strategyText").click(function() {
					var portfolio_code = this.getAttribute("name");
					location.href = '${pageContext.request.contextPath}/stockPortfolio/portfolioViewUpdate.do?portfolio_code='+ portfolio_code;
				});
			}
			if ('${LOGIN_ADMININFO.admin_id}' == 'admin') {
				$('input[name=insertMomentum]').click(function() {
					var portfolio_code = this.getAttribute("id");
					location.href = '${pageContext.request.contextPath}/stockPortfolio/PFSForm.do?portfolio_code='+ portfolio_code;
				});
			}
		});
	</script>
</body>
</html>