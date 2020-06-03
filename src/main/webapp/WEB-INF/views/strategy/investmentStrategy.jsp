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
	                    		<h2>김과장이 이번에산 주식이 대박났다는데..</h2>
					            <p style="color:grey; font-size:1.15em;">지인이 주식으로 단기간에 돈을 벌어 부러웠던 적이 있으신가요? 아쉽게도 <strong>“혹시 나도?”</strong> 라는 생각으로 시작하면 어렵게 모은 돈을 탕진할 가능성이 높습니다. 하지만 합리적인 수익률을 목표로 장기적인 투자를 하면 비교적 안정적으로 돈을 버는 것이 가능한 곳이 주식 시장입니다. 주식 투자를 시작하기 전에 이 글을 통해 투자의 기본 개념과 기초를 다져보세요.</p>
	                    		<br><br>
	                    		<p><strong style="font-size:1.25em; color:#F70F3C;">주식은 무엇인가?</strong></p><br>
	                    		<strong>주식은 한마디로 회사의 소유권이며 주식을 소유한 주주는 이를 통해 회사의 의결권, 수익, 그리고 자산을 보유할 수 있습니다.</strong> 예를 들어 철수와 영희가 함께 식당을 개업하였다는 가정 하 이 식당의 주식은 철수와 영희 둘이서 나누어 가져 식당 내에서 50%의 의결권, 수익, 그리고 자산을 나누어 갖는 것이며 만약 이 식당이 1,000개의 주식을 발행하는 경우 각자 500개의 주식을 보유하는 셈입니다.
자본 조달 목적으로 이 식당의 주식을 일반인에게 개방하는 것을 신규상장이라 (IPO) 일컫으며 상장 시 철수와 영희의 비공개 기업은 공개 기업으로 전환됩니다. 주식 투자자는 철수와 영희가 시작한 식당의 소유권의 일부를 매수 하게 되는 것입니다.
	                    		<br>
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
	                    		<p><strong style="font-size:1.25em; color:#F70F3C;">주식 가격은 (주가) 어떻게 책정될까요?</strong></p><br>
	                    		주식 시장에서는 앞서 언급한 철수와 영희의 식당에 더불어 삼성, 롯데, 그리고 현대 등 <strong>다양한 기업의 소유권을 주식으로 매매할 수 있으며 주가는 수요와 공급에 따라 좌우됩니다.</strong> 예를 들어 철수와 영희의 식당의 주식을 매수하는 사람들이 매도하는 사람보다 많을수록 가격은 올라가며 반대일 경우에는 가격이 내려갑니다. 궁극적으로 주식 시장의 수요 공급은 각 회사의 주식이 올바른 가격에 도다를 수 있게 수렴합니다.

하지만 주가에 변동이 있을 때마다 회사의 가치에도 변동이 있다는 점을 명심하셔야 합니다. 시가총액은 회사의 가치를 판단하는 지표이며 이는 회사의 유통주식 수와 주가를 곱하여 계산하는 수치입니다. 예를 들어 회사의 유통주식 수가 100개이고 주가가 1만원인 경우 이 회사의 시가총액은 100만원입니다.

따라서 10만원짜리 주식의 회사와 5만원짜리의 주식의 회사가 동일한 가치를 소유하는 경우도 있습니다. 예로 놀부의 회사와 흥부의 회사 둘 다 매년 10만원의 이익을 올리고 있다는 시나리오 내에서 놀부의 회사는 1천원짜리 주식을 1000개 그리고 흥부의 회사는 1만원짜리 주식을 100개 발행한 상황을 고려해 보겠습니다. 비록 흥부의 회사의 주가가 10배 더 높지만 두 회사의 시가총액은 100만원으로 동일하기 때문에 주식 시장 내에서 두 회사는 같은 가치를 가지고 있습니다. 따라서 주식 구매 전 액면가보다는 회사의 시가총액 그리고 주가수익비율을 확인하는 것이 바람직합니다.
	                    		<br>
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
	                    		<p><strong style="font-size:1.25em; color:#F70F3C;">모든 주식이 같은 것은 아니다? 보통주 vs 우선주</strong></p><br>
	                    		주의할 사항은 <strong>회사가 발행하는 모든 주식이 같지 않다는 것입니다. 주식은 크게 보통주 그리고 우선주로 나눌 수 있으며 일반적으로 매매가능한 것은 전자입니다.</strong> 후자는 배당이 더 높지만 통상 의결권이 없고, 이익과 잔여재산 분배 시 우선권도 가지고 있습니다. 즉 주식회사가 파산 혹 자산 매각 시에는 우선주주가 보통주주보다 이에 대한 청구권을 먼저 가지고 있다는 뜻입니다.
	                    		<br>
	                    	</div>
	                    	<p class="highcharts-description">
	                        </p>
	                    </figure>
	                </div>
	                <div class="wrap2">
	            		<div class="padding"></div>
	                    <figure class="highcharts-figure">
	                    	<div id="container4"></div>
	                    	<div>
	                    		<p><strong style="font-size:1.25em; color:#F70F3C;">주가 지수란?</strong></p><br>
	                    		<strong>주가 지수는 다수의 주가를 한번에 나타내는 지표이며 코스피는 한국거래소 유가증권시장 내 상장되어 있는 모든 회사의 종합주가지수를 이르는 지표입니다.</strong> 더 중요히, 주가 지수는 시장 성과를 반영하기 때문에 투자 자산의 수익률을 평가하는데도 사용됩니다. 따라서 본인의 투자 능력을 확인하고 싶은 경우 투자 기간 동안 본인의 투자 수익률을 주가 지수의 수익률과 비교해 보면 됩니다.
	                    		<br>
	                    	</div>
	                    	<p class="highcharts-description">
	                        </p>
	                    </figure>
	                </div>
	                <div class="wrap2">
	            		<div class="padding"></div>
	                    <figure class="highcharts-figure">
	                    	<div id="container5"></div>
	                    	<div>
	                    		<p><strong style="font-size:1.25em; color:#F70F3C;">투자 전략</strong></p><br>
	                    		궁극적으로 <strong>투자의 목표는 저가에 매수하여 고가에 매도하는 것입니다.</strong> 하지만 미래를 예측하는 것은 불가능하기 때문에 세계에서 가장 뛰어난 투자자들이 모여있는 최고의 헤지 펀드들의 성공률도 오직 60%밖에 되지 않습니다. 그럼에도 불구하고 기본적 분석 및 기술적 분석을 통한 대표적인 투자 전략으로 수익을 올리는 것은 불가능하지 않습니다.

가장 대표적인 투자 전략은 보통 기본적 분석과 기술적 분석으로 나누어집니다. 기본적 분석은 최신 재무제표를 통해 기업의 가치를 분석하여 주가가 그 가치의 이하면 매수하며 그 이상이면 매도하는 전통적인 투자 전략입니다. 이 외에도 업종 자료, 경쟁사 자료, 경제 방침 등 다양한 수치로 분석을 보완하여 주식의 내수가치를 판단 할 수도 있습니다. 반면에 기술적 분석은 거래량 등 과거 자료를 토대로 미래의 주가를 예측하는 방법입니다. 요새는 기술이 많이 발전하여 컴퓨터 알고리즘으로 다수의 요소와 주가의 연관성을 찾는 추세입니다.
	                    		<br>
	                    	</div>
	                    	<p class="highcharts-description">
	                        </p>
	                    </figure>
	                </div>
	                
	            </content>
	        </div>
			
	    </div>


<script>
</script>
</body>
</html>