<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- chart -->
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/highcharts-more.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/modules/export-data.js"></script>
    <script src="https://code.highcharts.com/modules/accessibility.js"></script>
</head>
<body>
	<div class="wrap">

	        <div class="headerSubandContent">
	            <content>
	                <div class="wrap2">
	                    <figure class="highcharts-figure">
	                    	<div id="container1"></div>
	                    	<div>
	                    		<h2>블루칩</h2>
	                    		시가총액 5천억원 이상이며 거래량이 풍부한 안전한 종목 위주로 선택합니다. 가격 리스크가 적은 대형주와 수익성과 성장성 측면에서 우수한 우량주 위주로 보유합니다. 다만 최근 수익률이 너무 저조하면 제외합니다. 블루칩은 대형주 위주의 포트폴리오기 때문에 시장과 상관계수가 매우 높습니다. 주식시장의 리더들을 모아 놓은 것이기 때문에 장기적으로 보면 시장을 이길 수 있습니다.
	                    		<br><br>
	                    		<p><strong>리스트보여져야함</strong></p><br><br>
	                    		<div>
	                    		<button class="btn-simple" id="goBack"> 돌아가기</button>
	                    		</div>
	                    	</div>
	                    	<p class="highcharts-description">
	                        </p>
	                    </figure>
	                </div>
	                
	        
			
			
	    </div>
	   
<script>
$(function(){
	$('#goBack').click(function(){
		location.href = '${pageContext.request.contextPath}/stockStat/statList.do';	
	})
});
    
</script>
</body>
</html>