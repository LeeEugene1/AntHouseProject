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
						<button class="btn-simple">
	            			<a style="color:black;" href="${pageContext.request.contextPath}/stockStat/statMake.do;"><p>돌아가기</p></a>
	            		</button>
	                    <figure class="highcharts-figure">
	                    	<div id="container1"></div>
	                    	<div>
	                    		<h2>블루칩</h2>
	                    		<p><strong>안정적인 우량주에 투자하세요</strong></p><br>
	                    		시가총액 5천억원 이상이며 거래량이 풍부한 안전한 종목 위주로 선택합니다. 가격 리스크가 적은 대형주와 수익성과 성장성 측면에서 우수한 우량주 위주로 보유합니다. 다만 최근 수익률이 너무 저조하면 제외합니다. 블루칩은 대형주 위주의 포트폴리오기 때문에 시장과 상관계수가 매우 높습니다. 주식시장의 리더들을 모아 놓은 것이기 때문에 장기적으로 보면 시장을 이길 수 있습니다.
	                    		<br><br>
	                    		<ul>
	                    			<li>사이즈 스코어 5이상</li>
	                    			<li>수익성 스코어 3이상</li>
	                    			<li>거래량 스코어 5이상</li>
	                    			<li>변동성 스코어 5이상</li>
	                    		</ul>
	                    		<div>
	                    		<button class="btn-simple" id="go_search1" data-toggle="tooltip" title="" data-original-title="해당 스탯 구성에 포함되는 종목 리스트를 확인하세요"> 구성종목보기</button>
	                    		</div>
	                    	</div>
	                    	<p class="highcharts-description">
	                        </p>
	                    </figure>
	                </div>
	                
	                <div class="wrap2">
	            		<div class="padding"></div>
	                    <figure class="highcharts-figure">
	                    	<div id="container2"></div>
	                    	<div>
	                    		<h2>대형성장</h2>
	                    		<p><strong>성장 여력이 높은 대형주에 투자하세요</strong></p><br>
	                    		시가총액 5천억원 이상 대형주 중에서 성장성이 높거나 실적이 턴어라운드 된 종목 위주로 선택하여 기업의 펀더멘탈 모멘텀에 투자합니다. 대형성장은 현재 주가 자체가 고평가 되어 있을지도 모르나 중장기적으로 추가적인 수익률을 추구합니다.
	                    		<br><br>
	                    		<ul>
	                    			<li>사이즈 스코어 5이상</li>
	                    			<li>성장성 스코어 4이상</li>
	                    			<li>거래량 스코어 3이상</li>
	                    			<li>모멘텀 스코어 2이상 4이하</li>
	                    		</ul>
	                    		<div>
	                    		<button class="btn-simple" onclick="go_search2" data-toggle="tooltip" title="" data-original-title="해당 스탯 구성에 포함되는 종목 리스트를 확인하세요"> 구성종목보기</button>
	                    		</div>
	                    	</div>
	                    	<p class="highcharts-description">
	                        </p>
	                    </figure>
	                </div>
	                
	                <div class="wrap2">
	            		<div class="padding"></div>
	                    <figure class="highcharts-figure">
	                    	<div id="container3"></div>
	                    	<div>
	                    		<h2>중소형밸류</h2>
	                    		<p><strong>작은 종목이지만 아직 정당한 평가를 받지 못한 종목에 투자하세요</strong></p><br><br>
	                    		사이즈(시가총액)이 작지만 저평가 되어 있는 종목 위주로 고릅니다. 적자 기업은 제외합니다. 성장성과 수익성과 같은 펀더멘탈 역시 우수하지만 현재 하락한 주가로 인하여 미래 상승여력이 충분한 종목을 선택합니다.
	                    		<br>
	                    		<ul>
	                    			<li>사이즈 스코어 2이상 3이하</li>
	                    			<li>저평가 스코어 5이상</li>
	                    			<li>수익성 스코어 4이상</li>
	                    			<li>성장성 스코어 4이상</li>
	                    		</ul>
	                    		<div>
	                    		<button class="btn-simple" onclick="go_search3" data-toggle="tooltip" title="" data-original-title="해당 스탯 구성에 포함되는 종목 리스트를 확인하세요"> 구성종목보기</button>
	                    		</div>
	                    	</div>
	                    	<p class="highcharts-description">
	                        </p>
	                    </figure>
	                </div>
	                
	            </content>
	        </div>
	        
			
			
	    </div>
	   
	    <div style="visibility:hidden; display:none">
		    <form id="form_factor" action="/stat/search" method="get">
		        <input id="factor_list_min" name="min" />
		        <input id="factor_list_max" name="max" />
		    </form>
		
		    <form id="form_report" action="/simul/overview/stat " method="post">
		        <input id="factor_list_min_report" name="min" />
		        <input id="factor_list_max_report" name="max" />
		        <input id="rp_type" name="rp_type" />
		    </form>
		
		    <form id="form_chart" action="/chart" method="get">
		        <input id="input_chart_gicode" name="gicode_info" />
		        <input id="input_chart_intv" name="intv" />
	    	</form>
		</div>
		


<script>
var max_size = 5;
var min_size = 3;
var max_vol = 5;
var min_vol = 3;
var max_momentum = 5;
var min_momentum = 3;
var max_asset = 5;
var min_asset = 3;
var max_growth = 5;
var min_growth = 3;
var max_prof = 5;
var min_prof = 3;
var max_vari = 5;
var min_vari = 3;
var max_issue = 5;
var min_issue = 3;
var max_series1 = [5, 5, 5, 5, 5, 5, 4, 5];
var min_series1 = [5, 4, 2, 4, 3, 3, 1, 1];
var max_series2 = [5, 5, 4, 5, 5, 5, 5, 5];
var min_series2 = [5, 3, 2, 1, 4, 1, 1, 1];
var max_series3 = [3, 5, 5, 5, 5, 5, 5, 5];
var min_series3 = [2, 2, 1, 5, 4, 4, 1, 1];
var table = null;

// $(window).load(function(){
// 	refresh(min_series,max_series)	
// });

var chart1 =  $('#container1').highcharts({
	   	credits: {
           enabled: false
	    },
	    chart: {
		    polar: true,
		    type: 'line'
    	},

	    // accessibility: {
	    //   description: 'A spiderweb chart compares the allocated budget against actual spending within an organization. The spider chart has six spokes. Each spoke represents one of the 6 departments within the organization: sales, marketing, development, customer support, information technology and administration. The chart is interactive, and each data point is displayed upon hovering. The chart clearly shows that 4 of the 6 departments have overspent their budget with Marketing responsible for the greatest overspend of $20,000. The allocated budget and actual spending data points for each department are as follows: Sales. Budget equals $43,000; spending equals $50,000. Marketing. Budget equals $19,000; spending equals $39,000. Development. Budget equals $60,000; spending equals $42,000. Customer support. Budget equals $35,000; spending equals $31,000. Information technology. Budget equals $17,000; spending equals $26,000. Administration. Budget equals $10,000; spending equals $14,000.'
	    // },
	
	    title: {
	        text: '',
	        // x: -80
	    },
	
	    pane: {
	        size: '80%'
	    },
	
	    xAxis: {
	        categories: ['사이즈', '거래량', '모맨텀', '저평가',
	        '성장성', '수익성', '변동성','이슈성'],
	        tickmarkPlacement: 'on',
	        lineWidth: 0
	    },
	
	    yAxis: {
	        gridLineInterpolation: 'polygon',
	        lineWidth: 0,
	        min: 0
	    },
	
	    // hover때 나오는 부연설명부분
	    tooltip: {
	        shared: true,
	        pointFormat: '<span style="color:{series.color}">{series.name}: <b>{point.y:,.0f}</b><br/>'
	    },
	
	    legend: {
	        align: 'right',
	        verticalAlign: 'middle',
	        layout: 'vertical'
	    },
	
	    series: [{
	        color:'#21a59f',
	        name: '최소스코어',
	        data: min_series1,
	        pointPlacement: 'on'
	    }, {
	        color:'#F70F3C',
	        name: '최대스코어',
	        data: max_series1,
	        pointPlacement: 'on'
	    }],
	
	    responsive: {
	        rules: [{
	            condition: {
	            maxWidth: 500
	            },
	            chartOptions: {
	            legend: {
	                align: 'center',
	                verticalAlign: 'bottom',
	                layout: 'horizontal'
	            },
	            pane: {
	                size: '70%'
	            }
	            }
	        }]
	    }

    });
    
var chart2 =  $('#container2').highcharts({
	   	credits: {
           enabled: false
	    },
	    chart: {
		    polar: true,
		    type: 'line'
    	},

	    // accessibility: {
	    //   description: 'A spiderweb chart compares the allocated budget against actual spending within an organization. The spider chart has six spokes. Each spoke represents one of the 6 departments within the organization: sales, marketing, development, customer support, information technology and administration. The chart is interactive, and each data point is displayed upon hovering. The chart clearly shows that 4 of the 6 departments have overspent their budget with Marketing responsible for the greatest overspend of $20,000. The allocated budget and actual spending data points for each department are as follows: Sales. Budget equals $43,000; spending equals $50,000. Marketing. Budget equals $19,000; spending equals $39,000. Development. Budget equals $60,000; spending equals $42,000. Customer support. Budget equals $35,000; spending equals $31,000. Information technology. Budget equals $17,000; spending equals $26,000. Administration. Budget equals $10,000; spending equals $14,000.'
	    // },
	
	    title: {
	        text: '',
	        // x: -80
	    },
	
	    pane: {
	        size: '80%'
	    },
	
	    xAxis: {
	        categories: ['사이즈', '거래량', '모맨텀', '저평가',
	        '성장성', '수익성', '변동성','이슈성'],
	        tickmarkPlacement: 'on',
	        lineWidth: 0
	    },
	
	    yAxis: {
	        gridLineInterpolation: 'polygon',
	        lineWidth: 0,
	        min: 0
	    },
	
	    // hover때 나오는 부연설명부분
	    tooltip: {
	        shared: true,
	        pointFormat: '<span style="color:{series.color}">{series.name}: <b>{point.y:,.0f}</b><br/>'
	    },
	
	    legend: {
	        align: 'right',
	        verticalAlign: 'middle',
	        layout: 'vertical'
	    },
	
	    series: [{
	        color:'#21a59f',
	        name: '최소스코어',
	        data: min_series2,
	        pointPlacement: 'on'
	    }, {
	        color:'#F70F3C',
	        name: '최대스코어',
	        data: max_series2,
	        pointPlacement: 'on'
	    }],
	
	    responsive: {
	        rules: [{
	            condition: {
	            maxWidth: 500
	            },
	            chartOptions: {
	            legend: {
	                align: 'center',
	                verticalAlign: 'bottom',
	                layout: 'horizontal'
	            },
	            pane: {
	                size: '70%'
	            }
	            }
	        }]
	    }

    });
    
var chart3 =  $('#container3').highcharts({
	   	credits: {
           enabled: false
	    },
	    chart: {
		    polar: true,
		    type: 'line'
    	},

	    // accessibility: {
	    //   description: 'A spiderweb chart compares the allocated budget against actual spending within an organization. The spider chart has six spokes. Each spoke represents one of the 6 departments within the organization: sales, marketing, development, customer support, information technology and administration. The chart is interactive, and each data point is displayed upon hovering. The chart clearly shows that 4 of the 6 departments have overspent their budget with Marketing responsible for the greatest overspend of $20,000. The allocated budget and actual spending data points for each department are as follows: Sales. Budget equals $43,000; spending equals $50,000. Marketing. Budget equals $19,000; spending equals $39,000. Development. Budget equals $60,000; spending equals $42,000. Customer support. Budget equals $35,000; spending equals $31,000. Information technology. Budget equals $17,000; spending equals $26,000. Administration. Budget equals $10,000; spending equals $14,000.'
	    // },
	
	    title: {
	        text: '',
	        // x: -80
	    },
	
	    pane: {
	        size: '80%'
	    },
	
	    xAxis: {
	        categories: ['사이즈', '거래량', '모맨텀', '저평가',
	        '성장성', '수익성', '변동성','이슈성'],
	        tickmarkPlacement: 'on',
	        lineWidth: 0
	    },
	
	    yAxis: {
	        gridLineInterpolation: 'polygon',
	        lineWidth: 0,
	        min: 0
	    },
	
	    // hover때 나오는 부연설명부분
	    tooltip: {
	        shared: true,
	        pointFormat: '<span style="color:{series.color}">{series.name}: <b>{point.y:,.0f}</b><br/>'
	    },
	
	    legend: {
	        align: 'right',
	        verticalAlign: 'middle',
	        layout: 'vertical'
	    },
	
	    series: [{
	        color:'#21a59f',
	        name: '최소스코어',
	        data: min_series3,
	        pointPlacement: 'on'
	    }, {
	        color:'#F70F3C',
	        name: '최대스코어',
	        data: max_series3,
	        pointPlacement: 'on'
	    }],
	
	    responsive: {
	        rules: [{
	            condition: {
	            maxWidth: 500
	            },
	            chartOptions: {
	            legend: {
	                align: 'center',
	                verticalAlign: 'bottom',
	                layout: 'horizontal'
	            },
	            pane: {
	                size: '70%'
	            }
	            }
	        }]
	    }

    });
    
    
    


function refresh(){    
    
    //Highcharts.chart('container', {
        chart =  $('#container').highcharts({
	   	credits: {
           enabled: false
	    },
	    chart: {
		    polar: true,
		    type: 'line'
    	},

	    // accessibility: {
	    //   description: 'A spiderweb chart compares the allocated budget against actual spending within an organization. The spider chart has six spokes. Each spoke represents one of the 6 departments within the organization: sales, marketing, development, customer support, information technology and administration. The chart is interactive, and each data point is displayed upon hovering. The chart clearly shows that 4 of the 6 departments have overspent their budget with Marketing responsible for the greatest overspend of $20,000. The allocated budget and actual spending data points for each department are as follows: Sales. Budget equals $43,000; spending equals $50,000. Marketing. Budget equals $19,000; spending equals $39,000. Development. Budget equals $60,000; spending equals $42,000. Customer support. Budget equals $35,000; spending equals $31,000. Information technology. Budget equals $17,000; spending equals $26,000. Administration. Budget equals $10,000; spending equals $14,000.'
	    // },
	
	    title: {
	        text: '',
	        // x: -80
	    },
	
	    pane: {
	        size: '80%'
	    },
	
	    xAxis: {
	        categories: ['사이즈', '거래량', '모맨텀', '저평가',
	        '성장성', '수익성', '변동성','이슈성'],
	        tickmarkPlacement: 'on',
	        lineWidth: 0
	    },
	
	    yAxis: {
	        gridLineInterpolation: 'polygon',
	        lineWidth: 0,
	        min: 0
	    },
	
	    // hover때 나오는 부연설명부분
	    tooltip: {
	        shared: true,
	        pointFormat: '<span style="color:{series.color}">{series.name}: <b>{point.y:,.0f}</b><br/>'
	    },
	
	    legend: {
	        align: 'right',
	        verticalAlign: 'middle',
	        layout: 'vertical'
	    },
	
	    series: [{
	        color:'#21a59f',
	        name: '최소스코어',
	        data: min_series,
	        pointPlacement: 'on'
	    }, {
	        color:'#F70F3C',
	        name: '최대스코어',
	        data: max_series,
	        pointPlacement: 'on'
	    }],
	
	    responsive: {
	        rules: [{
	            condition: {
	            maxWidth: 500
	            },
	            chartOptions: {
	            legend: {
	                align: 'center',
	                verticalAlign: 'bottom',
	                layout: 'horizontal'
	            },
	            pane: {
	                size: '70%'
	            }
	            }
	        }]
	    }

    });
};

    
    $(function(){
    	chart = $("#container").highcharts();
    	
    	// 스탯 개별
    	$('#min_size_minus').click(function(){
    		if(min_size > 1){
    			min_size--;
    			min_series[0] = min_size;
    		}
//     		chart.series[0].update(min_series);
//     		chart.series[1].update(max_series);
    		
    		refresh();
    	});
    	
    		
    	$('#min_size_plus').click(function(){
    		if(min_size < 5){
    			min_size++;
    			min_series[0] = min_size;
    		}
//     		chart.series[0].update(min_series);
//     		chart.series[1].update(max_series);
    		refresh();
    	});
    	
    	$('#max_size_minus').click(function(){
    		if(max_size > 1){
    			max_size--;
    			max_series[0] = max_size;
    		}
//     		chart.series[0].update(min_series);
//     		chart.series[1].update(max_series);
    		
    		refresh();
    	});
    	
    		
    	$('#max_size_plus').click(function(){
    		if(max_size < 5){
    			max_size++;
    			max_series[0] = max_size;
    		}
//     		chart.series[0].update(min_series);
//     		chart.series[1].update(max_series);
    		refresh();
    	});
    	
    	$('#allMax_size').click(function(){
   			min_series[0] = 5;
   			max_series[0] = 5;
    		refresh();
    	});
    	///////////////
    	
    	// 스탯 개별
    	$('#min_vol_minus').click(function(){
    		if(min_vol > 1){
    			min_vol--;
    			min_series[1] = min_vol;
    		}
//     		chart.series[0].update(min_series);
//     		chart.series[1].update(max_series);
    		
    		refresh();
    	});
    	
    		
    	$('#min_vol_plus').click(function(){
    		if(min_vol < 5){
    			min_vol++;
    			min_series[1] = min_vol;
    		}
//     		chart.series[0].update(min_series);
//     		chart.series[1].update(max_series);
    		refresh();
    	});
    	
    	$('#max_vol_minus').click(function(){
    		if(max_vol > 1){
    			max_vol--;
    			max_series[1] = max_vol;
    		}
//     		chart.series[0].update(min_series);
//     		chart.series[1].update(max_series);
    		
    		refresh();
    	});
    	
    		
    	$('#max_vol_plus').click(function(){
    		if(max_vol < 5){
    			max_vol++;
    			max_series[1] = max_vol;
    		}
//     		chart.series[0].update(min_series);
//     		chart.series[1].update(max_series);
    		refresh();
    	});
    	
    	$('#allMax_vol').click(function(){
   			min_series[1] = 5;
   			max_series[1] = 5;
    		refresh();
    	});
    	
    	// 스탯 개별
    	$('#min_momentum_minus').click(function(){
    		if(min_momentum > 1){
    			min_momentum--;
    			min_series[2] = min_momentum;
    		}
//     		chart.series[0].update(min_series);
//     		chart.series[1].update(max_series);
    		
    		refresh();
    	});
    	
    		
    	$('#min_momentum_plus').click(function(){
    		if(min_momentum < 5){
    			min_momentum++;
    			min_series[2] = min_momentum;
    		}
//     		chart.series[0].update(min_series);
//     		chart.series[1].update(max_series);
    		refresh();
    	});
    	
    	$('#max_momentum_minus').click(function(){
    		if(max_momentum > 1){
    			max_momentum--;
    			max_series[2] = max_momentum;
    		}
//     		chart.series[0].update(min_series);
//     		chart.series[1].update(max_series);
    		
    		refresh();
    	});
    	
    		
    	$('#max_momentum_plus').click(function(){
    		if(max_momentum < 5){
    			max_momentum++;
    			max_series[2] = max_momentum;
    		}
//     		chart.series[0].update(min_series);
//     		chart.series[1].update(max_series);
    		refresh();
    	});
    	
    	$('#allMax_momentum').click(function(){
   			min_series[2] = 5;
   			max_series[2] = 5;
    		refresh();
    	});
    	
    	
    	
    	// 스탯 개별
    	$('#min_asset_minus').click(function(){
    		if(min_asset > 1){
    			min_asset--;
    			min_series[3] = min_asset;
    		}
//     		chart.series[0].update(min_series);
//     		chart.series[1].update(max_series);
    		
    		refresh();
    	});
    	
    		
    	$('#min_asset_plus').click(function(){
    		if(min_asset < 5){
    			min_asset++;
    			min_series[3] = min_asset;
    		}
//     		chart.series[0].update(min_series);
//     		chart.series[1].update(max_series);
    		refresh();
    	});
    	
    	$('#max_asset_minus').click(function(){
    		if(max_asset > 1){
    			max_asset--;
    			max_series[3] = max_asset;
    		}
//     		chart.series[0].update(min_series);
//     		chart.series[1].update(max_series);
    		
    		refresh();
    	});
    	
    		
    	$('#max_asset_plus').click(function(){
    		if(max_asset < 5){
    			max_asset++;
    			max_series[3] = max_asset;
    		}
//     		chart.series[0].update(min_series);
//     		chart.series[1].update(max_series);
    		refresh();
    	});
    	
    	$('#allMax_asset').click(function(){
   			min_series[3] = 5;
   			max_series[3] = 5;
    		refresh();
    	});
    	
    	
    	
    	// 스탯 개별
    	$('#min_growth_minus').click(function(){
    		if(min_growth > 1){
    			min_growth--;
    			min_series[4] = min_growth;
    		}
//     		chart.series[0].update(min_series);
//     		chart.series[1].update(max_series);
    		
    		refresh();
    	});
    	
    		
    	$('#min_growth_plus').click(function(){
    		if(min_growth < 5){
    			min_growth++;
    			min_series[4] = min_growth;
    		}
//     		chart.series[0].update(min_series);
//     		chart.series[1].update(max_series);
    		refresh();
    	});
    	
    	$('#max_growth_minus').click(function(){
    		if(max_growth > 1){
    			max_growth--;
    			max_series[4] = max_growth;
    		}
//     		chart.series[0].update(min_series);
//     		chart.series[1].update(max_series);
    		
    		refresh();
    	});
    	
    		
    	$('#max_growth_plus').click(function(){
    		if(max_growth < 5){
    			max_growth++;
    			max_series[4] = max_growth;
    		}
//     		chart.series[0].update(min_series);
//     		chart.series[1].update(max_series);
    		refresh();
    	});
    	
    	$('#allMax_growth').click(function(){
   			min_series[4] = 5;
   			max_series[4] = 5;
    		refresh();
    	});
    	
    	// 스탯 개별
    	$('#min_prof_minus').click(function(){
    		if(min_prof > 1){
    			min_prof--;
    			min_series[5] = min_prof;
    		}
//     		chart.series[0].update(min_series);
//     		chart.series[1].update(max_series);
    		
    		refresh();
    	});
    	
    		
    	$('#min_prof_plus').click(function(){
    		if(min_prof < 5){
    			min_prof++;
    			min_series[5] = min_prof;
    		}
//     		chart.series[0].update(min_series);
//     		chart.series[1].update(max_series);
    		refresh();
    	});
    	
    	$('#max_prof_minus').click(function(){
    		if(max_prof > 1){
    			max_prof--;
    			max_series[5] = max_prof;
    		}
//     		chart.series[0].update(min_series);
//     		chart.series[1].update(max_series);
    		
    		refresh();
    	});
    	
    		
    	$('#max_prof_plus').click(function(){
    		if(max_prof < 5){
    			max_prof++;
    			max_series[5] = max_prof;
    		}
//     		chart.series[0].update(min_series);
//     		chart.series[1].update(max_series);
    		refresh();
    	});
    	
    	$('#allMax_prof').click(function(){
   			min_series[5] = 5;
   			max_series[5] = 5;
    		refresh();
    	});
    	
    	// 스탯 개별
    	$('#min_vari_minus').click(function(){
    		if(min_vari > 1){
    			min_vari--;
    			min_series[6] = min_vari;
    		}
//     		chart.series[0].update(min_series);
//     		chart.series[1].update(max_series);
    		
    		refresh();
    	});
    	
    		
    	$('#min_vari_plus').click(function(){
    		if(min_vari < 5){
    			min_vari++;
    			min_series[6] = min_vari;
    		}
//     		chart.series[0].update(min_series);
//     		chart.series[1].update(max_series);
    		refresh();
    	});
    	
    	$('#max_vari_minus').click(function(){
    		if(max_vari > 1){
    			max_vari--;
    			max_series[6] = max_vari;
    		}
//     		chart.series[0].update(min_series);
//     		chart.series[1].update(max_series);
    		
    		refresh();
    	});
    	
    		
    	$('#max_vari_plus').click(function(){
    		if(max_vari < 5){
    			max_vari++;
    			max_series[6] = max_vari;
    		}
//     		chart.series[0].update(min_series);
//     		chart.series[1].update(max_series);
    		refresh();
    	});
    	
    	$('#allMax_vari').click(function(){
   			min_series[6] = 5;
   			max_series[6] = 5;
    		refresh();
    	});
    	
    	// 스탯 개별
    	$('#min_issue_minus').click(function(){
    		if(min_issue > 1){
    			min_issue--;
    			min_series[7] = min_issue;
    		}
//     		chart.series[0].update(min_series);
//     		chart.series[1].update(max_series);
    		
    		refresh();
    	});
    	
    		
    	$('#min_issue_plus').click(function(){
    		if(min_issue < 5){
    			min_issue++;
    			min_series[7] = min_issue;
    		}
//     		chart.series[0].update(min_series);
//     		chart.series[1].update(max_series);
    		refresh();
    	});
    	
    	$('#max_issue_minus').click(function(){
    		if(max_issue > 1){
    			max_issue--;
    			max_series[7] = max_issue;
    		}
//     		chart.series[0].update(min_series);
//     		chart.series[1].update(max_series);
    		
    		refresh();
    	});
    	
    		
    	$('#max_issue_plus').click(function(){
    		if(max_issue < 5){
    			max_issue++;
    			max_series[7] = max_issue;
    		}
//     		chart.series[0].update(min_series);
//     		chart.series[1].update(max_series);
    		refresh();
    	});
    	
    	$('#allMax_issue').click(function(){
   			min_series[7] = 5;
   			max_series[7] = 5;
    		refresh();
    	});
    	
    	$('#go_search1').click(function(){
    		location.href = '${pageContext.request.contextPath}/stockStat/statList_blueChip.do';
    	});
    	$('#go_search2').click(function(){
    		location.href = '${pageContext.request.contextPath}/stockStat/statList_bigGrowth.do';
    	});
    	$('#go_search3').click(function(){
    		location.href = '${pageContext.request.contextPath}/stockStat/statList_chipPrise.do';
    	});
    	
    	
    	
    	 $(window).bind('resize', function () {
    	        table.draw();

    	        $('.dataTables_scrollHeadInner').css('width', '100%');
    	        $('table').css('width', '100%');
    	    });
    	 
    	 $('#test').click(function(){
    		 location.href = '${pageContext.request.contextPath}/stockStat/statList.do';
     	});
    });


    
//}    
    
</script>
</body>
</html>