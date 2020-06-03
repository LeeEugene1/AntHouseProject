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
	                    	<div id="container"></div>
	                    	<p class="highcharts-description">
	                        </p>
	                    </figure>
	                </div>
	                
	            	<div id="factor_control">
	            		<div id="size">
	            			<input id="min_size_minus" class="btn-simple-stat-blue" type="button" value="-">
	            			<input id="min_size_plus" class="btn-simple-stat-blue" type="button" value="+">
<!-- 	            			<input class="btn-simple" type="button" value="사이즈"> -->
	            			<button id="myBtn" class="btn-simple-stat">사이즈
	            				<img alt="" src="${pageContext.request.contextPath }/UI/img/question.png">
	            			</button>
	            			<input id="max_size_minus" class="btn-simple-stat-red" type="button" value="-">
	            			<input id="max_size_plus" class="btn-simple-stat-red" type="button" value="+">
	            			<input id="allMax_size" class="btn-simple-stat" type="button" value="ALL">
	            		</div>
	            		<div id="VOL">
	            			<input id="min_vol_minus" class="btn-simple-stat-blue" type="button" value="-">
	            			<input id="min_vol_plus" class="btn-simple-stat-blue" type="button" value="+">
<!-- 	            			<input class="btn-simple" type="button" value="거래량"> -->
							<button id="myBtn2" class="btn-simple-stat">거래량
	            				<img alt="" src="${pageContext.request.contextPath }/UI/img/question.png">
	            			</button>
	            			<input id="max_vol_minus" class="btn-simple-stat-red" type="button" value="-">
	            			<input id="max_vol_plus" class="btn-simple-stat-red" type="button" value="+">
	            			<input id="allMax_vol" class="btn-simple-stat" type="button" value="ALL">
	            		</div>
	            		<div id="momentum">
	            			<input id="min_momentum_minus" class="btn-simple-stat-blue" type="button" value="-">
	            			<input id="min_momentum_plus" class="btn-simple-stat-blue" type="button" value="+">
	            			<button id="myBtn3" class="btn-simple-stat">모멘텀
	            				<img alt="" src="${pageContext.request.contextPath }/UI/img/question.png">
	            			</button>
	            			<input id="max_momentum_minus" class="btn-simple-stat-red" type="button" value="-">
	            			<input id="max_momentum_plus" class="btn-simple-stat-red" type="button" value="+">
	            			<input id="allMax_momentum" class="btn-simple-stat" type="button" value="ALL">
	            		</div>
	            		<div id="asset">
	            			<input id="min_asset_minus" class="btn-simple-stat-blue" type="button" value="-">
	            			<input id="min_asset_plus" class="btn-simple-stat-blue" type="button" value="+">
	            			<button id="myBtn4" class="btn-simple-stat">저평가
	            				<img alt="" src="${pageContext.request.contextPath }/UI/img/question.png">
	            			</button>
	            			<input id="max_asset_minus" class="btn-simple-stat-red" type="button" value="-">
	            			<input id="max_asset_plus" class="btn-simple-stat-red" type="button" value="+">
	            			<input id="allMax_asset" class="btn-simple-stat" type="button" value="ALL">
	            		</div>
	            		<div id="growth">
	            			<input id="min_growth_minus" class="btn-simple-stat-blue" type="button" value="-">
	            			<input id="min_growth_plus" class="btn-simple-stat-blue" type="button" value="+">
	            			<button id="myBtn5" class="btn-simple-stat">성장성
	            				<img alt="" src="${pageContext.request.contextPath }/UI/img/question.png">
	            			</button>
	            			<input id="max_growth_minus" class="btn-simple-stat-red" type="button" value="-">
	            			<input id="max_growth_plus" class=btn-simple-stat-red type="button" value="+">
	            			<input id="allMax_growth" class="btn-simple-stat" type="button" value="ALL">
	            		</div>
	            		<div id="prof">
	            			<input id="min_prof_minus" class="btn-simple-stat-blue" type="button" value="-">
	            			<input id="min_prof_plus" class="btn-simple-stat-blue" type="button" value="+">
	            			<button id="myBtn6" class="btn-simple-stat">수익성
	            				<img alt="" src="${pageContext.request.contextPath }/UI/img/question.png">
	            			</button>
	            			<input id="max_prof_minus" class="btn-simple-stat-red" type="button" value="-">
	            			<input id="max_prof_plus" class="btn-simple-stat-red" type="button" value="+">
	            			<input id="allMax_prof" class="btn-simple-stat" type="button" value="ALL">
	            		</div>
	            		<div id="vari">
	            			<input id="min_vari_minus" class="btn-simple-stat-blue" type="button" value="-">
	            			<input id="min_vari_plus" class="btn-simple-stat-blue" type="button" value="+">
	            			<button id="myBtn7" class="btn-simple-stat">변동성
	            				<img alt="" src="${pageContext.request.contextPath }/UI/img/question.png">
	            			</button>
	            			<input id="max_vari_minus" class="btn-simple-stat-red" type="button" value="-">
	            			<input id="max_vari_plus" class="btn-simple-stat-red" type="button" value="+">
	            			<input id="allMax_vari" class="btn-simple-stat" type="button" value="ALL">
	            		</div>
	            		<div id="issue">
	            			<input id="min_issue_minus" class="btn-simple-stat-blue" type="button" value="-">
	            			<input id="min_issue_plus" class="btn-simple-stat-blue" type="button" value="+">
	            			<button id="myBtn8" class="btn-simple-stat">이슈성
	            				<img alt="" src="${pageContext.request.contextPath }/UI/img/question.png">
	            			</button>
	            			<input id="max_issue_minus" class="btn-simple-stat-red" type="button" value="-">
	            			<input id="max_issue_plus" class="btn-simple-stat-red" type="button" value="+">
	            			<input id="allMax_issue" class="btn-simple-stat" type="button" value="ALL">
	            		</div>
	            	</div>
	            		
					<div id="myModal" class="modal">
						<div class="modal-content">
						    <span class="close" id="modalClose">&times;</span>
						    <h2>사이즈 </h2>
						    <p style="color:grey";>스탯 기업의 규모 사이즈는 주식에 있어서 빠질 수 없는 요소입니다. 기업 규모에 따라서 시장에 미치는 영향이 다르기 때문입니다. 
						    또한 국내 대표적 벤치마크의 대상인 KOSPI 시가총액 가중방식이 때문에 시장을 어느 수준 따라고 싶다면 대형주를 많이 보유하는 것이 좋습니다.</p>
						    <div class="padding"></div>
						    <hr>
						    <ul>
						    	<div class="padding"></div>
						    	<li><strong>시가총액이 높을 수록 스코어가 높습니다.</strong></li>
						    	<li><strong>시가총액의 20일 평균을 사용합니다.</strong></li>
						    	<div class="padding"></div>
						    	<li style="font-size:0.75em;color:grey;">스코어 5 : 시가총액 100위 이내</li>
						    	<li style="font-size:0.75em;color:grey;">스코어 4 : 시가총액 300위 이내</li>
						    	<li style="font-size:0.75em;color:grey;">스코어 3 : 시가총액 800위 이내</li>
						    	<li style="font-size:0.75em;color:grey;">스코어 2 : 시가총액 1400위 이내</li>
						    	<li style="font-size:0.75em;color:grey;">스코어 1 : 그 외</li>
						    </ul>
						  </div>
					</div>
	            	
	            	<div id="myModal2" class="modal">			
						<div class="modal-content">
						    <span class="close" id="modalClose2">&times;</span>
						    <h2>거래량 스탯 </h2><p style="color:var(--background-color); font-size:1.25em;">거래할 수 있는 종목인가?<div class="padding"></div></p>
						    <p style="color:grey";>거래량은 주식에 있어서 매우 중요한 요소 입니다. 아무리 좋은 종목이라도, 주문을 내서 체결될 수 없는 종목이라면 의미가 없기 때문입니다. 거래량이 작을 경우 대량 매수 주문을 낼 경우 손해를 입을 수 있습니다. 만약 운용중인 펀드의 규모가 크다면 거래량을 반드시 고려하는 것이 좋습니다.</p>
						    <div class="padding"></div>
						    <hr>
						    <ul>
						    	<div class="padding"></div>
						    	<li><strong>거래량이 높을 수록 스코어가 높습니다.</strong></li>
						    	<li><strong>거래량의 20일 평균을 사용합니다.</strong></li>
						    	<div class="padding"></div>
						    	<li style="font-size:0.75em;color:grey;">스코어 5 : 시가총액 100위 이내</li>
						    	<li style="font-size:0.75em;color:grey;">스코어 4 : 시가총액 300위 이내</li>
						    	<li style="font-size:0.75em;color:grey;">스코어 3 : 시가총액 800위 이내</li>
						    	<li style="font-size:0.75em;color:grey;">스코어 2 : 시가총액 1400위 이내</li>
						    	<li style="font-size:0.75em;color:grey;">스코어 1 : 그 외</li>
						    </ul>
						  </div>
					</div>
					
					<div id="myModal3" class="modal">			
						<div class="modal-content">
						    <span class="close" id="modalClose3">&times;</span>
						    <h2>모멘텀 스탯 </h2><p style="color:var(--background-color); font-size:1.25em;">최근에 많이 올랐는가?<div class="padding"></div></p>
						    <p style="color:grey";>주가에는 랠리와 반등구간이 있습니다. 모멘텀 스탯은 최근에 얼마나 올랐느냐에 대한 지표입니다. 만약 선택한 종목이 추가적인 상승 모멘텀이 있다고 판단되면 최근에 오른 종목을 고르는 것이 좋습니다. 또한 반등을 노리는 컨트래리안 전략을 사용한다면 최근에 하락한 종목을 선택하는 것이 좋습니다.</p>
						    <div class="padding"></div>
						    <hr>
						    <ul>
						    	<div class="padding"></div>
						    	<li><strong>최근 수익율이 크다면 스코어가 높습니다.</strong></li>
						    	<li><strong>최근 3개월 동안의 주가 수익률과 거래량을 사용합니다.</strong></li>
						    	<div class="padding"></div>
						    	<li style="font-size:0.75em;color:grey;">스코어 5 : 시가총액 100위 이내</li>
						    	<li style="font-size:0.75em;color:grey;">스코어 4 : 시가총액 300위 이내</li>
						    	<li style="font-size:0.75em;color:grey;">스코어 3 : 시가총액 800위 이내</li>
						    	<li style="font-size:0.75em;color:grey;">스코어 2 : 시가총액 1400위 이내</li>
						    	<li style="font-size:0.75em;color:grey;">스코어 1 : 그 외</li>
						    </ul>
						  </div>
					</div>
					
					<div id="myModal4" class="modal">			
						<div class="modal-content">
						    <span class="close" id="modalClose4">&times;</span>
						    <h2>저평가 스탯 </h2><p style="color:var(--background-color); font-size:1.25em;">시장에서 어떻게 평가 받고 있는가?<div class="padding"></div></p>
						    <p style="color:grey";>기업의 내재가치에 비하여 현재 주가가 어떻게 형성되어 있는가를 봅니다. 만약 기업의 내재가치에 비하여 최근 주가가 높다면 이는 고평가 되어 있다는 뜻이고, 내재가치에 비하여 최근 주가가 낮다면 기업이 저평가 되어 있다는 뜻입니다. 이를 판단하기 위하여 투자지표인 PER을 사용합니다. 다만 PER을 전체 주식에 대하여 동일한 기준으로 적용하는 것은 무리가 있습니다. 똑같은 PER 10이라도 제조업과 은행업의 그것은 다른 의미이기 때문입니다. 따라서 동일한 업종 내의 상대적인 값을 사용합니다.</p>
						    <div class="padding"></div>
						    <hr>
						    <ul>
						    	<div class="padding"></div>
						    	<li><strong>저평가 되어 있을 수록 값이 큽니다.</strong></li>
						    	<li><strong>현재 시점의 PER을 사용합니다.</strong></li>
						    	<li><strong>PER = 현재주가/주당순이익</strong></li>
						    	
						    	<div class="padding"></div>
						    	<li style="font-size:0.75em;color:grey;">스코어 5 : 시가총액 100위 이내</li>
						    	<li style="font-size:0.75em;color:grey;">스코어 4 : 시가총액 300위 이내</li>
						    	<li style="font-size:0.75em;color:grey;">스코어 3 : 시가총액 800위 이내</li>
						    	<li style="font-size:0.75em;color:grey;">스코어 2 : 시가총액 1400위 이내</li>
						    	<li style="font-size:0.75em;color:grey;">스코어 1 : 그 외</li>
						    </ul>
						  </div>
					</div>
					
					<div id="myModal5" class="modal">			
						<div class="modal-content">
						    <span class="close" id="modalClose5">&times;</span>
						    <h2>성장성 스탯 </h2><p style="color:var(--background-color); font-size:1.25em;">얼마나 성장하고 있는 기업인가?<div class="padding"></div></p>
						    <p style="color:grey";>장기투자를 목적으로 한다면 당연히 기업의 성장성을 염두하셔야 합니다. 주가란 기업의 미래가치에 대한 현재의 기대이기 때문입니다. 지난해에 비해 올해 매출액이나 영업이익이 큰 폭으로 성장한 기업이라면 당연히 주가 역시 상승할 종목입니다. 다만 성장성 스코어는 최근 결산 기준의 재무데이터를 사용하기 때문에 주가에 대부분 선반영 되어 있습니다. 따라서 장기 투자 시에 고려해야 할 요소입니다. 성장성은 업종마다 특이성이 존재하기 때문에 동일업종 내의 상대적인 값을 사용합니다.</p>
						    <div class="padding"></div>
						    <hr>
						    <ul>
						    	<div class="padding"></div>
						    	<li><strong>성장성이 높을 수록 값이 큽니다.</strong></li>
						    	<li><strong>최근 결산년도의 매출액, 영업이익의 증가율을 사용합니다.</strong></li>
						    	<li><strong>매출액증가율 = 매출액(최근)/매출액(작년)-1</strong></li>
						    	<li><strong>영업이익증가율 = 영업이익(최근)/영업이익(작년)-1</strong></li>
						    	<div class="padding"></div>
						    	<li style="font-size:0.75em;color:grey;">스코어 5 : 시가총액 100위 이내</li>
						    	<li style="font-size:0.75em;color:grey;">스코어 4 : 시가총액 300위 이내</li>
						    	<li style="font-size:0.75em;color:grey;">스코어 3 : 시가총액 800위 이내</li>
						    	<li style="font-size:0.75em;color:grey;">스코어 2 : 시가총액 1400위 이내</li>
						    	<li style="font-size:0.75em;color:grey;">스코어 1 : 그 외</li>
						    </ul>
						  </div>
					</div>
					
					<div id="myModal6" class="modal">			
						<div class="modal-content">
						    <span class="close" id="modalClose6">&times;</span>
						    <h2>수익성 스탯 </h2><p style="color:var(--background-color); font-size:1.25em;">돈을 잘 버는 기업인가?<div class="padding"></div></p>
						    <p style="color:grey";>주가란 결국 그 기업이 앞으로 얻게 될 현금들의 현재 시점의 기대값입니다. 그럼 이 종목이 얼마나 돈을 잘 버는 기업인지를 판단하는 것이 중요하겠지요. 투자한 금액 대비 기업이 얼마나 많은 이익을 창출하고 있는지를 확인하기 위하여 ROE, ROI 와 같은 투자지표를 사용합니다. ROE는 업종마다 특이성이 존재하기 때문에, 수익성을 판단하기 위해 동일업종 내의 상대적인 값을 사용합니다.</p>
						    <div class="padding"></div>
						    <hr>
						    <ul>
						    	<div class="padding"></div>
						    	<li><strong>수익성이 높을 수록 값이 큽니다.</strong></li>
						    	<li><strong>최근 결산년도의 ROE, ROI을 사용합니다.</strong></li>
						    	<li><strong>ROE = 당기순이익/자기자본</strong></li>
						    	<li><strong>ROI = 당기순이익/총투자</strong></li>
						    	<div class="padding"></div>
						    	<li style="font-size:0.75em;color:grey;">스코어 5 : 시가총액 100위 이내</li>
						    	<li style="font-size:0.75em;color:grey;">스코어 4 : 시가총액 300위 이내</li>
						    	<li style="font-size:0.75em;color:grey;">스코어 3 : 시가총액 800위 이내</li>
						    	<li style="font-size:0.75em;color:grey;">스코어 2 : 시가총액 1400위 이내</li>
						    	<li style="font-size:0.75em;color:grey;">스코어 1 : 그 외</li>
						    </ul>
						  </div>
					</div>
					
					<div id="myModal7" class="modal">			
						<div class="modal-content">
						    <span class="close" id="modalClose7">&times;</span>
						    <h2>변동성 스탯</h2><p style="color:var(--background-color); font-size:1.25em;">수익률이 얼마나 안정적인가?<div class="padding"></div></p>
						    <p style="color:grey";>
펀드나 주식의 성과를 평가할 때는 대체로 위험대비 수익률로 판단합니다. 여기서 위험이라는 것은 주가수익률의 표준편차를 사용합니다. 주가가 아래위로 크게 흔들린 종목이라면 그것은 변동성이 큰 종목이며, 투자자가 그 리스크를 감내했다는 것은 더 큰 수익률을 기대할 수 있다는 의미이기도 합니다. 다만, 최근에는 저변동성 종목이 수익률이 높아 high risk, high return을 주장하는 학계와 대립되기도 했었습니다. 이처럼 변동성은 종목을 구분하는 좋은 특성입니다.
</p>
						    <div class="padding"></div>
						    <hr>
						    <ul>
						    	<div class="padding"></div>
						    	<li><strong>변동성이 높을 수록 값이 큽니다.</strong></li>
						    	<li><strong>일별변동성을 연율화하여 사용합니다.</strong></li>
						    	<li><strong>변동성 = 표준편차(일별수익율)</strong></li>
						    	<div class="padding"></div>
						    	<li style="font-size:0.75em;color:grey;">스코어 5 : 시가총액 100위 이내</li>
						    	<li style="font-size:0.75em;color:grey;">스코어 4 : 시가총액 300위 이내</li>
						    	<li style="font-size:0.75em;color:grey;">스코어 3 : 시가총액 800위 이내</li>
						    	<li style="font-size:0.75em;color:grey;">스코어 2 : 시가총액 1400위 이내</li>
						    	<li style="font-size:0.75em;color:grey;">스코어 1 : 그 외</li>
						    </ul>
						  </div>
					</div>

					<div id="myModal8" class="modal">			
						<div class="modal-content">
						    <span class="close" id="modalClose8">&times;</span>
						    <h2>이슈성 스탯</h2><p style="color:var(--background-color); font-size:1.25em;">얼마나 회자되고 있는 종목인가?<div class="padding"></div></p>
						    <p style="color:grey";>
유달리 사람들의 관심을 받고 있는 종목들이 있습니다. 이런 종목은 유달리 특이한 움직임을 보입니다. 소위 말하는 작전주일 수도 있고, 급등주일 가능성도 매우 높습니다. Financipe는 이 이슈성에 대하여 포탈사이트나 종목토론게시판 혹은 뉴스에 달린 댓글들을 수집하여 얼마나 이슈가 되고 있는 지를 판단합니다.						    <div class="padding"></div>
						    <hr>
						    <ul>
						    	<div class="padding"></div>
						    	<li><strong>이슈성이 높을 수록 값이 큽니다.</strong></li>
						    	<div class="padding"></div>
						    	<li style="font-size:0.75em;color:grey;">스코어 5 : 시가총액 100위 이내</li>
						    	<li style="font-size:0.75em;color:grey;">스코어 4 : 시가총액 300위 이내</li>
						    	<li style="font-size:0.75em;color:grey;">스코어 3 : 시가총액 800위 이내</li>
						    	<li style="font-size:0.75em;color:grey;">스코어 2 : 시가총액 1400위 이내</li>
						    	<li style="font-size:0.75em;color:grey;">스코어 1 : 그 외</li>
						    </ul>
						  </div>
					</div>	         

					<div style="display:flex; justify-content:center;align-items:center;">
			    		<button class="btn-simple-login" id="stockChoice" style="display:flex; justify-content:center;align-items: center;">종목찾기</button>
		    		</div>
		    		<div style="display:flex; justify-content:center;align-items:center;">
		    			<table style="text-align:center">
		    				<thead id="statsListhead">
		    					<tr>
		                   			<th scope="col">순위</th>
		                   			<th scope="col">주식명</th>
									<th scope="col">주식코드</th>
									<th scope="col">시가총액</th>
									<th scope="col">거래량</th>
									<th scope="col">모멘텀</th>
		    					</tr>
		    				</thead>
		    				<tbody id="statsList">
		    				</tbody>
		    			</table>
		    		</div>
                 	<div class="padding"></div>
                 	<div style="display:flex; justify-content:center;align-items:center;">
		    		<button class="btn-simple-login" id="buttontest">추천포트폴리오</button>
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

<!--     모달창 -->
    <script>
		// Get the modal
		var modal = document.getElementById("myModal");
		var modal2 = document.getElementById("myModal2");
		var modal3 = document.getElementById("myModal3");
		var modal4 = document.getElementById("myModal4");
		var modal5 = document.getElementById("myModal5");
		var modal6 = document.getElementById("myModal6");
		var modal7 = document.getElementById("myModal7");
		var modal8 = document.getElementById("myModal8");
		
		// Get the button that opens the modal
		var btn = document.getElementById("myBtn");
		var btn2 = document.getElementById("myBtn2");
		var btn3 = document.getElementById("myBtn3");
		var btn4 = document.getElementById("myBtn4");
		var btn5 = document.getElementById("myBtn5");
		var btn6 = document.getElementById("myBtn6");
		var btn7 = document.getElementById("myBtn7");
		var btn8 = document.getElementById("myBtn8");
		
		// Get the <span> element that closes the modal
		var span = document.getElementById("modalClose");
		var span2 = document.getElementById("modalClose2");
		var span3 = document.getElementById("modalClose3");
		var span4 = document.getElementById("modalClose4");
		var span5 = document.getElementById("modalClose5");
		var span6 = document.getElementById("modalClose6");
		var span7 = document.getElementById("modalClose7");
		var span8 = document.getElementById("modalClose8");
		
		// When the user clicks the button, open the modal 
		btn.onclick = function() {
		 	modal.style.display = "block";
		}
		
		btn2.onclick = function(){
			modal2.style.display = "block";
		}
		
		btn3.onclick = function(){
			modal3.style.display = "block";
		}
		
		btn4.onclick = function(){
			modal4.style.display = "block";
		}
		
		btn5.onclick = function(){
			modal5.style.display = "block";
		}
		
		btn6.onclick = function(){
			modal6.style.display = "block";
		}
		
		btn7.onclick = function(){
			modal7.style.display = "block";
		}
		
		btn8.onclick = function(){
			modal8.style.display = "block";
		}
		
		// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
		  modal.style.display = "none";
		}
		
		span2.onclick = function(){
			modal2.style.display="none";
		}
		
		span3.onclick = function(){
			modal3.style.display="none";
		}
		
		span4.onclick = function(){
			modal4.style.display="none";
		}
		
		span5.onclick = function(){
			modal5.style.display="none";
		}
		
		span6.onclick = function(){
			modal6.style.display="none";
		}
		
		span7.onclick = function(){
			modal7.style.display="none";
		}
		
		span8.onclick = function(){
			modal8.style.display="none";
		}

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
		  if (event.target == modal) {
		    modal.style.display = "none";
		  }
		  if (event.target == modal2) {
			    modal2.style.display = "none";
		  } 
		  if (event.target == modal3) {
			    modal3.style.display = "none";
		  } 
		  if (event.target == modal4) {
			    modal4.style.display = "none";
		  } 
		  if (event.target == modal5) {
			    modal5.style.display = "none";
		  } 
		  if (event.target == modal6) {
			    modal6.style.display = "none";
		  } 
		  if (event.target == modal7) {
			    modal7.style.display = "none";
		  } 
		  if (event.target == modal8) {
			    modal8.style.display = "none";
		  } 
		}
	</script>
	
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
var max_series = [max_size, max_vol, max_momentum, max_asset, max_growth, max_prof, max_vari, max_issue];
var min_series = [min_size, min_vol, min_momentum, min_asset, min_growth, min_prof, min_vari, min_issue];
var table = null;

var chart =  $('#container').highcharts({
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
    	
    	$('#min_size_minus').click(function(){
    		if(min_size > 1){
    			min_size--;
    			
    			min_series[0] = min_size;
    			
    		}
    		refresh();
    	});
    		
    	$('#min_size_plus').click(function(){
    		if(min_size < 5){
    			min_size++;
    			if(min_series[0] >= max_series[0]){
    				max_size++;
    			}
    			min_series[0] = min_size;
    			max_series[0] = max_size;
    		}
    		refresh();
    	});
    	
    	$('#max_size_minus').click(function(){
    		if(max_size > 1){
    			max_size--;
    			if(min_series[0] >= max_series[0]){
    				min_size--;
    			}
    			max_series[0] = max_size;
    			min_series[0] = min_size;
    		}
    		refresh();
    	});
    	
    	$('#max_size_plus').click(function(){
    		if(max_size < 5){
    			max_size++;
    			max_series[0] = max_size;
    		}
    		refresh();
    	});
    	
    	$('#allMax_size').click(function(){
   			min_series[0] = 5;
   			max_series[0] = 5;
    		refresh();
    	});
    	
    	// 스탯 개별
    	$('#min_vol_minus').click(function(){
    		if(min_vol > 1){
    			min_vol--;
    			min_series[1] = min_vol;
    		}
    		refresh();
    	});
    		
    	$('#min_vol_plus').click(function(){
    		if(min_vol < 5){
    			min_vol++;
    			if(min_series[1] >= max_series[1]){
    				max_vol++;
    			}
    			min_series[1] = min_vol;
    			max_series[1] = max_vol;
    		}
    		refresh();
    	});
    	
    	$('#max_vol_minus').click(function(){
    		if(max_vol > 1){
    			max_vol--;
    			if(min_series[1] >= max_series[1]){
    				min_vol--;
    			}
    			max_series[1] = max_vol;
    			min_series[1] = min_vol;
    		}
    		refresh();
    	});
    		
    	$('#max_vol_plus').click(function(){
    		if(max_vol < 5){
    			max_vol++;
    			max_series[1] = max_vol;
    		}
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
    		refresh();
    	});
    		
    	$('#min_momentum_plus').click(function(){
    		if(min_momentum < 5){
    			min_momentum++;
    			if(min_series[2] >= max_series[2]){
    				max_momentum++;
    			}
    			min_series[2] = min_momentum;
    			max_series[2] = max_momentum;
    		}
    		refresh();
    	});
    	
    	$('#max_momentum_minus').click(function(){
    		if(max_momentum > 1){
    			max_momentum--;
    			if(min_series[2] >= max_series[2]){
    				min_momentum--;
    			}
    			max_series[2] = max_momentum;
    			min_series[2] = min_momentum;
    		}
    		refresh();
    	});
    	
    	$('#max_momentum_plus').click(function(){
    		if(max_momentum < 5){
    			max_momentum++;
    			max_series[2] = max_momentum;
    		}
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
    		refresh();
    	});
    	
    	$('#min_asset_plus').click(function(){
    		if(min_asset < 5){
    			min_asset++;
    			if(min_series[3] >= max_series[3]){
    				max_asset++;
    			}
    			min_series[3] = min_asset;
    			max_series[3] = max_asset;
    		}
    		refresh();
    	});
    	
    	$('#max_asset_minus').click(function(){
    		if(max_asset > 1){
    			max_asset--;
    			if(min_series[3] >= max_series[3]){
    				min_asset--;
    			}
    			max_series[3] = max_asset;
    			min_series[3] = min_asset;
    		}
    		refresh();
    	});
    	
    	$('#max_asset_plus').click(function(){
    		if(max_asset < 5){
    			max_asset++;
    			max_series[3] = max_asset;
    		}
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
    		refresh();
    	});
    	
    	$('#min_growth_plus').click(function(){
    		if(min_growth < 5){
    			min_growth++;
    			if(min_series[4] >= max_series[4]){
    				max_growth++;
    			}
    			min_series[4] = min_growth;
    			max_series[4] = max_growth;
    		}
    		refresh();
    	});
    	
    	$('#max_growth_minus').click(function(){
    		if(max_growth > 1){
    			max_growth--;
    			if(min_series[4] >= max_series[4]){
    				min_growth--;
    			}
    			max_series[4] = max_growth;
    			min_series[4] = min_growth;
    		}
    		refresh();
    	});
    	
    		
    	$('#max_growth_plus').click(function(){
    		if(max_growth < 5){
    			max_growth++;
    			max_series[4] = max_growth;
    		}
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
    		refresh();
    	});
    	
    	$('#min_prof_plus').click(function(){
    		if(min_prof < 5){
    			min_prof++;
    			if(min_series[5] >= max_series[5]){
    				max_prof++;
    			}
    			min_series[5] = min_prof;
    			max_series[5] = max_prof;
    		}
    		refresh();
    	});
    	
    	$('#max_prof_minus').click(function(){
    		if(max_prof > 1){
    			max_prof--;
    			if(min_series[5] >= max_series[5]){
    				min_prof--;
    			}
    			max_series[5] = max_prof;
    			min_series[5] = min_prof;
    		}
    		refresh();
    	});
    		
    	$('#max_prof_plus').click(function(){
    		if(max_prof < 5){
    			max_prof++;
    			max_series[5] = max_prof;
    		}
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
    		refresh();
    	});
    	
    	$('#min_vari_plus').click(function(){
    		if(min_vari < 5){
    			min_vari++;
    			if(min_series[6] >= max_series[6]){
    				max_vari++;
    			}
    			min_series[6] = min_vari;
    			max_series[6] = max_vari;
    		}
    		refresh();
    	});
    	
    	$('#max_vari_minus').click(function(){
    		if(max_vari > 1){
    			max_vari--;
    			if(min_series[6] >= max_series[6]){
    				min_vari--;
    			}
    			max_series[6] = max_vari;
    			min_series[6] = min_vari;
    		}
    		refresh();
    	});
    		
    	$('#max_vari_plus').click(function(){
    		if(max_vari < 5){
    			max_vari++;
    			max_series[6] = max_vari;
    		}
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
    		refresh();
    	});
    	
    		
    	$('#min_issue_plus').click(function(){
    		if(min_issue < 5){
    			min_issue++;
    			if(min_series[7] >= max_series[7]){
    				max_issue++;
    			}
    			min_series[7] = min_issue;
    			max_series[7] = max_issue;
    		}
    		refresh();
    	});
    	
    	$('#max_issue_minus').click(function(){
    		if(max_issue > 1){
    			max_issue--;
    			if(min_series[7] >= max_series[7]){
    				min_issue--;
    			}
    			max_series[7] = max_issue;
    			min_series[7] = min_issue;
    		}
    		refresh();
    	});
    	
    		
    	$('#max_issue_plus').click(function(){
    		if(max_issue < 5){
    			max_issue++;
    			max_series[7] = max_issue;
    		}
    		refresh();
    	});
    	
    	$('#allMax_issue').click(function(){
   			min_series[7] = 5;
   			max_series[7] = 5;
    		refresh();
    	});
    	
    	$(window).bind('resize', function () {
    	        table.draw();

    	        $('.dataTables_scrollHeadInner').css('width', '100%');
    	        $('table').css('width', '100%');
    	    });
    	 
    	$('#buttontest').click(function(){
       		 location.href = "${pageContext.request.contextPath}/stockStat/statList.do";
        })
        
    	$('#stockChoice').click(function(){
    		$.ajax({
    			type : 'post',
    			url:'${pageContext.request.contextPath}/stockStat/statChoice.do',
    			traditional : true,
    			dataType:'json',
    			data:{ max_series : max_series,
    				   min_series : min_series},
    			error:function(data){
    					alert('실패');
    				},
    			success:function(data){
	    				var mon = data.resultList;
	    				$('#stockStatsListResult').find('p').remove();
	        			for(var i = 0 ; i < 201 ; i++){
	        				if(i%3==0){
		        				$('#statsList').append("<tr><td>" + mon[i].rank + "</td><td>" + mon[i].stock_item_name + "</td><td>" + mon[i].stock_item_code + "</td><td>" + mon[i].marcket_cap + "</td><td>" + mon[i+1].volume + "</td><td>" + mon[i+2].mom +"</td></tr>");
	        				}
	        			}
    				}
    		});
    		return false;
        })
    });
</script>
</body>
</html>