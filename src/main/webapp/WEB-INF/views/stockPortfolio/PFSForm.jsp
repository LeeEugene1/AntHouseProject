<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
$(function(){
    $('#start_year').change(function(){
//     	alert($('#start_year').val());
    	var year = $('#start_year').val();
    	$.ajax({
    		url: '${pageContext.request.contextPath}/stockportfolio/selectMonth.do',
    		data: {'start_year':year},
    		error: function(){
    			alert('실패');
    		},
    		success: function(data){
    			var mon = data.selectMonth;
    			console.log(data.selectMonth);
    			$('#start_month').find('option').remove();
    			for(var i = 0 ; i < mon.length ; i++){
    				$('#start_month').append("<option value="+mon[i].bs_date+">"+mon[i].bs_date+"</option>");
    			}	
    		}
    	});
    	$('#start_month').change(function(){
    		
    		var month = $('#start_month').val();
    		$.ajax({
        		url: '${pageContext.request.contextPath}/stockportfolio/selectDate.do',
        		data: {'start_year':year, 'start_month':month},
        		error: function(){
        			alert('실패');
        		},
        		success: function(data){
        			var day = data.selectDate;
        			console.log(data.selectDate);
        			$('#start_day').find('option').remove();
        			for(var i = 0 ; i < day.length ; i++){
        				$('#start_day').append("<option value="+day[i].bs_date+">"+day[i].bs_date+"</option>");
        			}	
        		}
        	});
    	});
    });
    
    $('#end_year').change(function(){
    	var year = $('#end_year').val();
    	$.ajax({
    		url: '${pageContext.request.contextPath}/stockportfolio/selectMonth.do',
    		data: {'start_year':year},
    		error: function(){
    			alert('실패');
    		},
    		success: function(data){
    			var mon = data.selectMonth;
    			console.log(data.selectMonth);
    			$('#end_month').find('option').remove();
    			for(var i = 0 ; i < mon.length ; i++){
    				$('#end_month').append("<option value="+mon[i].bs_date+">"+mon[i].bs_date+"</option>");
    			}	
    		}
    	});
    	$('#end_month').change(function(){
    		
    		var month = $('#end_month').val();
    		$.ajax({
        		url: '${pageContext.request.contextPath}/stockportfolio/selectDate.do',
        		data: {'start_year':year, 'start_month':month},
        		error: function(){
        			alert('실패');
        		},
        		success: function(data){
        			var day = data.selectDate;
        			console.log(data.selectDate);
        			$('#end_day').find('option').remove();
        			for(var i = 0 ; i < day.length ; i++){
        				$('#end_day').append("<option value="+day[i].bs_date+">"+day[i].bs_date+"</option>");
        			}	
        		}
        	});
    	});
    });
    
    $('#resetBtn').click(function(){
    	$('#testList').find('tr').remove();
    	$('#codeName').find('tr').remove();
    });
    
    $('#printBtn').click(function(){
    	var start_year = $('#start_year').val().substr(2,2);
    	var start_month = $('#start_month').val();
    	var start_day = $('#start_day').val();
    	
    	var end_year = $('#end_year').val().substr(2,2);
    	var end_month = $('#end_month').val();
    	var end_day = $('#end_day').val();
    	
    	if(parseInt(end_year+end_month)<1806){
    		alert("종료날짜를 18년05월 이후로 설정하여 주십시오.");
    		return false;
    	}
    	if((parseInt(end_year)+parseInt(end_month))<(parseInt(start_year)+parseInt(start_month))){
    		alert("종료날짜가 시작날짜보다 뒷 날짜로 설정되어야 합니다.");
    		return false;
    	}
    	
    	//시작일
    	var start_date = start_year+"/"+start_month+"/"+start_day;
    	
    	//종료일
    	var end_date = end_year+"/"+end_month+"/"+end_day;
    	//기준count
    	var count = $('#pfs_count').val();
    	
    	//1Month
    	var oneMYearTemp=$('#end_year').val();
    	var oneMonthTemp = parseInt(end_month)-1;
    	if(oneMonthTemp<10){
    		oneMonthTemp = "0"+String(oneMonthTemp);
    	}
    	if(oneMonthTemp==0){
    		oneMYearTemp = String(parseInt(oneMYearTemp) -1);
    		oneMonthTemp = 12;
    		if(oneMonthTemp<10){
    			oneMonthTemp = "0"+String(oneMonthTemp);
    		}
    	}
    	var oneMonth = oneMYearTemp.substr(2,2)+"/"+oneMonthTemp+"/"+end_day;
    	
    	//3Month
    	var threeMYearTemp=$('#end_year').val();
    	var threeMonthTemp = parseInt(end_month)-3;
    	if(threeMonthTemp<10&&threeMonthTemp>0){
    		threeMonthTemp = "0"+String(threeMonthTemp);
    	}
    	if(threeMonthTemp<1){
    		threeMYearTemp = String(parseInt(threeMYearTemp)-1);
    		threeMonthTemp = threeMonthTemp + 12;
    		if(threeMonthTemp<10){
    			threeMonthTemp = "0"+String(threeMonthTemp);
    		}
    	}
    	var threeMonth = threeMYearTemp.substr(2,2)+"/"+threeMonthTemp+"/"+end_day;
    	
    	//6Month
    	var sixMYearTemp=$('#end_year').val();
    	var sixMonthTemp = parseInt(end_month)-6;
    	if(sixMonthTemp<10&&sixMonthTemp>0){
    		sixMonthTemp = "0"+String(sixMonthTemp);
    	}
    	if(sixMonthTemp<1){
    		sixMYearTemp = String(parseInt(sixMYearTemp)-1);
    		sixMonthTemp = parseInt(sixMonthTemp) + 12;
    		if(sixMonthTemp<10){
    			sixMonthTemp = "0"+String(sixMonthTemp);
    		}
    	}
    	var sixMonth = sixMYearTemp.substr(2,2)+"/"+sixMonthTemp+"/"+end_day;
    	
    	//9Month
    	var nineMYearTemp=$('#end_year').val();
    	var nineMonthTemp = parseInt(end_month)-9;
    	if(nineMonthTemp<10&&nineMonthTemp>0){
    		nineMonthTemp = "0"+String(nineMonthTemp);
    	}
    	if(nineMonthTemp<1){
    		nineMYearTemp = String(parseInt(nineMYearTemp)-1);
    		nineMonthTemp = parseInt(nineMonthTemp) + 12;
    		if(nineMonthTemp<10){
    			nineMonthTemp = "0"+String(nineMonthTemp);
    		}
    	}
    	var nineMonth = nineMYearTemp.substr(2,2)+"/"+nineMonthTemp+"/"+end_day;
    	
    	//1year
    	var oneYear = String(parseInt(end_year)-1)+"/"+end_month+"/"+end_day;
    	//2year
    	var twoYear = String(parseInt(end_year)-2)+"/"+end_month+"/"+end_day;
    	//3year
    	var threeYear = String(parseInt(end_year)-3)+"/"+end_month+"/"+end_day;
    	
    	//day null일때
    	var oneMDateTemp = parseInt(end_day)+2;
    	if(oneMDateTemp>30){
    		oneMDateTemp = String(oneMDateTemp-4);
    	}
    	var oneMonthNull = oneMYearTemp.substr(2,2)+"/"+oneMonthTemp+"/"+oneMonthTemp;
    	var threeMonthNull = threeMYearTemp.substr(2,2)+"/"+threeMonthTemp+"/"+oneMonthTemp;
    	var sixMonthNull = sixMYearTemp.substr(2,2)+"/"+sixMonthTemp+"/"+oneMonthTemp;
    	var nineMonthNull = nineMYearTemp.substr(2,2)+"/"+nineMonthTemp+"/"+oneMonthTemp;
    	var oneYearNull = String(parseInt(end_year)-1)+"/"+end_month+"/"+oneMonthTemp;
    	var twoYearNull = String(parseInt(end_year)-2)+"/"+end_month+"/"+oneMonthTemp;
    	var threeYearNull = String(parseInt(end_year)-3)+"/"+end_month+"/"+oneMonthTemp;
    	
    	var strategyNameMonth = parseInt(end_month)-parseInt(start_month)
    	
    	if(strategyNameMonth<0){
    		strategyNameMonth=strategyNameMonth*-1;
    	}
    	var strategyNameYear = (parseInt(end_year)-parseInt(start_year))*12+(parseInt(end_month)-parseInt(start_month));
    	var codeTemp = start_year+start_month+start_day+end_year+end_month+end_day;
//     	alert("시작일 : "+start_date+ " 종료일 : "+end_date+" 한달"+oneMonth+" 세달 : "+threeMonth+
//     			" 6달 : "+sixMonth+" 9달 : "+nineMonth+" 1년 : "+oneYear+" 2년 : "+twoYear+" 3년 : "+threeYear+
//     			oneMonthNull+", "+ threeMonthNull+", "+  sixMonthNull+", "+  nineMonthNull+", "+  oneYearNull+", "+  twoYearNull+", "+  threeYearNull);
		
		var portfolio_code = window.location.href.split("=")[1];
		
    	$.ajax({
    		url: '${pageContext.request.contextPath}/stockportfolio/strategyList.do',
    		data: {'start_date':start_date, 'end_date':end_date, 'count':count, 'oneMonth':oneMonth, 'threeMonth':threeMonth,
    			   'sixMonth':sixMonth, 'nineMonth':nineMonth, 'oneYear':oneYear, 'twoYear':twoYear, 'threeYear':threeYear,
    			   'oneMonthNull':oneMonthNull, 'threeMonthNull':threeMonthNull,'sixMonthNull':sixMonthNull,
    			   'nineMonthNull':nineMonthNull,'oneYearNull':oneYearNull,'twoYearNull':twoYearNull,'threeYearNull':threeYearNull,'portfolio_code':portfolio_code},
    		error: function(){
    			alert('실패');
    		},
    		success: function(data){
    			$('#testList').find('tr').remove();
    			$('#codeName').find('tr').remove();
    			var momentum = data.strategyList;
    			console.log(data.strategyList);
//     			$('#end_month').find('option').remove();
    			for(var i = 0 ; i < momentum.length ; i++){
    				$('#testList').append("<tr><td>"+momentum[i].stock_item_code+"</td><td>"+momentum[i].stock_item_name+
    						              "</td><td>"+momentum[i].pfs_rr+"%"+"</td><td>"+momentum[i].pfs_1month_rr+"%"+"</td><td>"+momentum[i].pfs_3month_rr+"%"+
    						              "</td><td>"+momentum[i].pfs_6month_rr+"%"+"</td><td>"+momentum[i].pfs_9month_rr+"%"+"</td><td>"+momentum[i].pfs_1year_rr+"%"+
    						              "</td><td>"+momentum[i].pfs_2year_rr+"%"+"</td><td>"+momentum[i].pfs_3year_rr+"%"+"</td></tr>");
    			}
    			if(portfolio_code=='13'){
	    			$('#codeName').append("<tr><th>전략코드</th><td><input type='text' class='box-simple' id='codeText' name='codeText' value='MMT"+strategyNameYear+"M"+$('#pfs_count').val()+"N"+codeTemp+"' disabled='disabled'></td>"+
	    					             "<th>전략이름</th><td><input type='text' class='box-simple' id='strategyName' name='strategyName' value='모멘텀 탑"+$('#pfs_count').val()+"("+strategyNameYear+"개월)' disabled='disabled'></td></tr>");
    			}else if(portfolio_code=='44'){
    				$('#codeName').append("<tr><th>전략코드</th><td><input type='text' class='box-simple' id='codeText' name='codeText' value='CTR"+strategyNameYear+"M"+$('#pfs_count').val()+"N"+codeTemp+"' disabled='disabled'></td>"+
				             "<th>전략이름</th><td><input type='text' class='box-simple' id='strategyName' name='strategyName' value='컨트래리안 탑"+$('#pfs_count').val()+"("+strategyNameYear+"개월)' disabled='disabled'></td></tr>");
    			}
    			
    		}
    	});
    })
    
    $('#listBtn').click(function(){
    	location.href='${pageContext.request.contextPath}/stockPortfolio/stockPortfolioList.do';
    });
    
    
    $('form').submit(function(){
    	var pfs_code = $('#codeText').val();
    	var pfs_name = $('#strategyName').val();
    	var portfolio_code = window.location.href.split("=")[1];
    	var pfs_start_date = $('#start_year').val().substr(2,2)+"/"+$('#start_month').val()+"/"+$('#start_day').val();
    	var pfs_end_date = $('#end_year').val().substr(2,2)+"/"+$('#end_month').val()+"/"+$('#end_day').val();
    	$(this).attr("action", "${pageContext.request.contextPath }/stockportfolio/insertsteategy.do?pfs_code="+pfs_code+"&pfs_name="+pfs_name+"&portfolio_code="+portfolio_code+"&pfs_start_date="+pfs_start_date+"&pfs_end_date="+pfs_end_date);
    });
    
});
</script>
</head>
<body>
<div class="wrap">
        <div class="headerSubandContent">
            <content>
                <div class="box-article">
                <form class="articleContent" action="" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
                        <div class="smallTitle">
            				<b>전략등록</b>
            			</div>
                        <table border="0" class="portfolioTable">
                        	<tr>
                        		<th>시작 날짜</th>
                        		<td>
                        			<select class="search_categories" id="start_year" name="start_year">
                        				<option selected="selected" value="" disabled="disabled">시작연도</option>
                        				<c:forEach items="${selectYear}" var="dept">
                        					<option value="${dept.bs_date }">${dept.bs_date }</option>
                        				</c:forEach>
                        			</select>
                        			<select class="search_categories" id="start_month">
                        				<option selected="selected" value="" disabled="disabled">시작 월</option>
                        			</select>
                        			<select class="search_categories" id="start_day">
                        				<option selected="selected" value="" disabled="disabled">시작 일</option>
                        			</select>
                        		</td>
                        	</tr>
                        	<tr>
                        		<th>종료 날짜</th>
                        		<td>
                        			<select class="search_categories" id="end_year">
                        				<option selected="selected" value="" disabled="disabled">종료연도</option>
                        				<c:forEach items="${selectYear}" var="dept">
                        					<option name="startYear" value="${dept.bs_date }">${dept.bs_date }</option>
                        				</c:forEach>
                        			</select>
                        			<select class="search_categories" id="end_month">
                        				<option selected="selected" value="" disabled="disabled">종료 월</option>
                        			</select>
                        			<select class="search_categories" id="end_day">
                        				<option selected="selected" value="" disabled="disabled">종료 일</option>
                        			</select>
                        		</td>
                        	</tr>
                        	<tr>
                        		<th>출력 갯수</th>
                        		<td>
                        			<input type="text" class="box-simple-full" id="pfs_count" name="pfs_count" placeholder="">
                        		</td>
                        		<td>
                        			<input id="printBtn" class="btn-simple" type="button" name="" value="출력">
                        			<input id="resetBtn" class="btn-simple" type="button" name="" value="리셋">
                        		</td>
                        	</tr>
                        	<tr>
<!--                         		<th>리스트</th> -->
                        		<div id="strategyList" style="width: 850px;">
                        			<table class="strategtTable">
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
                        					
                        				</tbody>
                        			</table>
                        				<div id="codeName">
                        				
                        				</div>
             					</div>
                        	</tr>
                        	
                        </table> 
                        
                    
                    <div class="submitBtnPortfolio">
                        <input id="updateBtn" class="btn-simple" type="submit" name="" value="등록">
                        <input id="listBtn"class="btn-simple" type="button" value="목록">
                    </div>
                </form>
            </div> 
            </content>
        </div>
                    
<!--     </div> -->
</body>
</html>