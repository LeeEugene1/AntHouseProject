<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <script src='https://cdn.plot.ly/plotly-latest.min.js'/>	   -->
<script src="https://cdn.plot.ly/plotly-1.2.0.min.js"></script>
<style>
	#wekaResult td{
		padding:5px;
		font-size:16px;
		border-bottom: 1px solid #a9a9a9;
	}
	#wekaResult tr td:last-child{
		padding-left:100px;
	}
</style>
</head>
<body>
<div class="wrap">
       
     <div class="headerSubandContent">
           <content>
               <div class="wrap2">
                   <!-- <div class="portfolioWrap" style="width: 100%;"> -->
                       <!-- <div class="portfolioInput" style="padding:10px; margin-right: 10px;"> -->
                           <strong>포트폴리오 입력
                               <img id="myBtn" src="${pageContext.request.contextPath}/UI/img/question.png" alt="" style="z-index: 10; cursor: pointer;">
                           </strong>
                           <form action="" style="align-items: center; display: flex; flex-direction: column;">
                           	<table>
                           		<tr>
                           			<td>날짜(YYYYMMDD)</td>
                           			<td><input type="text" id="inputDate" class="box-simple-w200"></td>
                           		</tr>
                           		<tr>
	                           		<td>종목코드</td>
	                           		<td><input type="text" id="inputCode" class="box-simple-w200" style="margin-right:10px;">
	                           			<button id="searchName" class="box-simple">종목검색</button>
	                           		</td>
                           		</tr>
                           		<tr>
	                           		<td>비중</td>
	                           		<td><input type="text" id="" class="box-simple-w200"></td>
                           		</tr>
                           		<tr>
	                           		<td>진입가격</td>
	                           		<td><input type="text" id="inputPrice" class="box-simple-w200"></td>
                           		</tr>
                           	</table>
<!--                            	<label></label><input type="text" id="inputDate" class="box-simple-w100"><br> -->
<!--                            	<label>종목코드</label><input type="text" id="inputCode"><button id="searchName" class="box-simple-w100">종목검색</button><br> -->
<!--                            	<label>비중</label><input type="text" id="" class="box-simple-w100"><br> -->
<!--                            	<label>진입가격</label><input type="text" id="inputPrice" class="box-simple-w100"> -->
                           </form>
                           
                           <!-- </div> -->
                           <div id="modalPortfolio" class="modal">
                               <div class="modal-content" style="width:50%!important">
                                   <span class="close" id="modalClose">&times;</span>
                                   <strong>사용법</strong>
                                   <div class="modalPortfolioContent">
                                       <div>
                                           <div>
                                               <p>입력칸에 시점(YYYYMMDD)|종목코드(A000000)|상대적비중|진입시점(1,2); 형식으로 입력하세요.</p>
                                               <div class="padding"></div>
                                               <p>- 진입시점 1 : 전일종가</p>
                                               <p>- 진입시점 2 : 당일시가</p>
                                               <p>- 각 라인의 마지막에는 반드시 ; 를 넣어주세요.</p>
                                               <p>- 현금비중은 CASH 코드와 상대적 비중을 입력하세요.</p>
                                               <div class="padding"></div>
                                           </div>
                                           <!-- <p>개미의집이 자체 개발한 포트폴리오 백테스팅 및 성과분석 엔진입니다.</p> -->
                                           <div style="border:1px solid lightgrey; border-radius: 10px;">
                                               <p>예시 1</p>
                                               <div class="greycolor">
                                                   <p>2015/01/02 시점에 삼성전자와 현대차를 1:1 비율로 전일종가 가격으로 포트폴리오를 세팅한다면</p>
                                                   <p>20150102|A005930|50|1;</p>
                                                   <p>20150102|A005830|50|1;</p>
                                               </div>
                                           </div>
                                       </div>
                                       
                                       <div style="border:1px solid lightgrey; margin:10px; border-radius: 10px;">
                                           
                                           <p>예시 2</p> 
                                           <div class="greycolor">
                                               <p>2015/01/02 위 종목에 현금을 50% 세팅하려면</p>
                                               <p>20150102|A005930|25|1;</p>
                                               <p>20150102|A005830|25|1;</p>
                                               <p>20150102|CASH|50|1;</p>
                                               <p>여러 리벨런싱 시점에 대해서 모두 입력하세요</p>
                                               <hr>
                                           </div>
                                           <p>예시 3</p>
                                           <div class="greycolor">
                                               <p>위 포트폴리오를 2015/04/02에 다음카카오(50%), 셀트리온(50%)를 시가로 리밸런싱</p>
                                               <p>20150102|A005930|25|1;</p>
                                               <p>20150102|A005830|25|1;</p>
                                               <p>20150102|CASH|50|1;</p>
                                               <p>20150402|A005930|50|2;</p>
                                               <p>20150402|A005830|50|2;</p>
                                               <p>2010년 이후 데이터만 가능합니다.</p>
                                               <p>특정 리벨런싱 시점의 모든 종목들은 진입시점이 동일해야 합니다.</p>
                                           </div> 
                                       </div>
                                   </div>
                               </div>
                           </div>    
                           
                           <!-- </div> -->
				<div class="writeBtn">
	               <input class="btn-simple" type="button" id="resultBtn" value="결과보기">
	           </div>
           
           	<!-- 그래프 생성 -->
           	<div id="myDiv" style="margin:15px 0;padding-top:15px;border-top:1px solid #ccc;"></div>
           	<div id="wekaResult">
	           	<p></p>
	           	<table style="margin-top:15px;">
	           		<tr></tr>
	           		<tr></tr>
	           		<tr></tr>
	           		<tr></tr>
	           		<tr></tr>
	           		<tr></tr>
	           		<tr></tr>
	           		<tr></tr>
	           		<tr></tr>
	           		<tr></tr>
	           	</table>
           	</div>
           </div>
           
           </content>

       </div>

</div>
<script>
    var modal = document.getElementById("modalPortfolio");
    var btn = document.getElementById("myBtn");
    var span = document.getElementById("modalClose");
	var new_popup;
    btn.onclick = function(){
        modal.style.display="block";
    }

    span.onclick = function(){
        modal.style.display="none";
    }

    window.onclick = function(event){
        if(event.target == modal){
            modal.style.display = "none";
        }
    }
    
    
    $(function(){
	    $("#searchName").click(function (){
	    	window.open('${pageContext.request.contextPath }/strategy/stockNamePopup.do','_blank', 'width=550, height=500,top=250,left=700, scrollbars=no');
	    });
	    $("#resultBtn").click(function(){
			$.ajax({
				type:'post',
				url:'${pageContext.request.contextPath}/weka/wekaList.do',
				dataType:'json',
				data:{ p_buyDate : $("#inputDate").val(),
					p_code : $("#inputCode").val(),
					p_buyPrice : $("#inputPrice").val()},
				error:function(data){
					alert('실패');
					},
				success:function(data){
						var result1 = data.resultPrice1
						var result3 = data.resultPrice3
						var result6 = data.resultPrice6
						var result9 = data.resultPrice9
						var test = data.evaluation
						$('#wekaResult p').append("<strong>개미봇의 예측 결과</strong>");
						$('#wekaResult table tr:eq(0)').append("<td>상관계수</td><td>"+test.split(" ")[19].split("\n")[0]+"</td>");
						$('#wekaResult table tr:eq(1)').append("<td>평균 절대 오차</td><td>"+test.split(" ")[43].split("\n")[0]+"</td>");
						$('#wekaResult table tr:eq(2)').append("<td>루트 평균 제곱 오차</td><td>"+test.split(" ")[64].split("\n")[0]+"</td>");
						$('#wekaResult table tr:eq(3)').append("<td>상대 절대 오차</td><td>"+test.split(" ")[82]+"%</td>");
						$('#wekaResult table tr:eq(4)').append("<td>루트 상대 제곱 오류</td><td>"+test.split(" ")[99]+"%</td>");
						$('#wekaResult table tr:eq(5)').append("<td>총 인스턴스 수</td><td>"+test.split(" ")[117]+"</td>");
						$('#wekaResult table tr:eq(6)').append("<td>1개월후 가격</td><td><b>"+result1+"</b></td>");
						$('#wekaResult table tr:eq(7)').append("<td>3개월후 가격</td><td><b>"+result3+"</b></td>");
						$('#wekaResult table tr:eq(8)').append("<td>6개월후 가격</td><td><b>"+result6+"</b></td>");
						$('#wekaResult table tr:eq(9)').append("<td>9개월후 가격</td><td><b>"+result9+"</b></td>");
						
						Plotly.d3.csv("${pageContext.request.contextPath}/resources/data1.csv", function(err, rows){

							  function unpack(rows, key) {
							  return rows.map(function(row) { return row[key]; });
							}

							var trace3 = {
							  type: "scatter",
							  mode: "lines",
							  name: '파세코 - 고가',
							  x: unpack(rows, 'Date'),
							  y: unpack(rows, 'pHigh'),
							  line: {color: '#03a9f4'}
							}

							var trace4 = {
							  type: "scatter",
							  mode: "lines",
							  name: '파세코 - 저가',
							  x: unpack(rows, 'Date'),
							  y: unpack(rows, 'pLow'),
							  line: {color: '#e91e63'}
							}

							
							var data = [trace3,trace4];

							var layout = {
							  title: '포트폴리오 성과 지표'
							};

							Plotly.newPlot('myDiv', data, layout);
							})
					}
			});
		});
    });
</script>
</body>
</html>