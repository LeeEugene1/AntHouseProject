<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style type="text/css">
    	table{width:100%}
    </style>
<script type="text/javascript">
if('${param.message}'){
	alert('${param.message}');
}

$(function(){
	function crawling(){
		$.ajax({
			type : 'post',
			url : '${pageContext.request.contextPath}/crawler/main.do',
			dataType : 'json',
			error : function(result){
				console.log(result);
			},
			success:function(result){
// 				console.log(result);
				//<-- 코스피탭
				$(".placeKospi_tab .subTitle").text(result.stockTime);
				$(".stock_item:eq(0)").text(result.kospiTitle);
				$(".stock_price:eq(0)").text(result.kospiNum1);
				$(".gap_rate:eq(0)").text(result.kospiNum3);
				$(".stock_item:eq(3)").text(result.kospiTitle);
				$(".stock_price:eq(3)").text(result.kospiNum1);
				$(".gap_rate:eq(3)").text(result.kospiNum3);
				$(".img_chart:eq(0)").attr("src",result.kospiImg);
				$(".kospi_graph:eq(0) img").attr("src",result.kospiBigImg);
				
				var text1 = $(".txt_area:eq(0) div span");
				if(result.kospiStatus == "상승"){
					$(text1).addClass("up");
					$(".gap_price:eq(0)").text("▲ " + result.kospiNum2);
				}else if(result.kospiStatus == "하락"){
					$(text1).addClass("down");
					$(".gap_price:eq(0)").text("▼ " + result.kospiNum2);
				}else{
					$(text1).addClass("same");
					$(".gap_price:eq(0)").text("= " + result.kospiNum2);
				}
				
				$(".stock_item:eq(1)").text(result.kosdaqTitle);
				$(".stock_price:eq(1)").text(result.kosdaqNum1);
				$(".gap_rate:eq(1)").text(result.kosdaqNum3);
				$(".stock_item:eq(4)").text(result.kosdaqTitle);
				$(".stock_price:eq(4)").text(result.kosdaqNum1);
				$(".gap_rate:eq(4)").text(result.kosdaqNum3);
				$(".img_chart:eq(1)").attr("src",result.kosdaqImg);
				$(".kospi_graph:eq(1) img").attr("src",result.kosdaqBigImg);
				var text1 = $(".txt_area:eq(1) div span");
				if(result.kospiStatus == "상승"){
					$(text1).addClass("up");
					$(".gap_price:eq(1)").text("▲ " + result.kosdaqNum2);
				}else if(result.kospiStatus == "하락"){
					$(text1).addClass("down");
					$(".gap_price:eq(1)").text("▼ " + result.kosdaqNum2);
				}else{
					$(text1).addClass("same");
					$(".gap_price:eq(1)").text("= " + result.kosdaqNum2);
				}
				
				$(".stock_item:eq(2)").text(result.kospi200Title);
				$(".stock_price:eq(2)").text(result.kospi200Num1);
				$(".gap_rate:eq(2)").text(result.kospi200Num3);
				$(".stock_item:eq(5)").text(result.kospi200Title);
				$(".stock_price:eq(5)").text(result.kospi200Num1);
				$(".gap_rate:eq(5)").text(result.kospi200Num3);
				$(".img_chart:eq(2)").attr("src",result.kospi200Img);
				$(".kospi_graph:eq(2) img").attr("src",result.kospi200BigImg);
				var text1 = $(".txt_area:eq(2) div span");
				if(result.kospiStatus == "상승"){
					$(text1).addClass("up");
					$(".gap_price:eq(2)").text("▲ " + result.kospi200Num2);
				}else if(result.kospiStatus == "하락"){
					$(text1).addClass("down");
					$(".gap_price:eq(2)").text("▼ " + result.kospi200Num2);
				}else{
					$(text1).addClass("same");
					$(".gap_price:eq(2)").text("= " + result.kospi200Num2);
				}
				// 코스피 탭--->
				// <--- 인기종목 탭
				$("#tbl_home").empty();
				$(result.stockList).each(function(i,data){
					var text;
					if(data.stockStatus == "up"){
						text = "▲ ";
					}else if(data.stockStatus == "down"){
						text = "▼ ";
					}else{
						text = "= ";
					}
	                $("#tbl_home").append("<tr> <th style='float:left;'><img src='${pageContext.request.contextPath }/UI/img/no"+(i+1*1)+".png'>&nbsp;<a href='${pageContext.request.contextPath }/stockInfo/stockDetail.do?code="+data.stockCode+"'>"+data.stockName+"</a></th><td>"+data.stockNum1+"</td> <td><span class="+data.stockStatus+">"+text + data.stockNum2+"</span></td></tr>");
				});
				// 인기종목 탭 --->
				// <--- 증권뉴스
				$(".mainNews ul").empty();
				$(result.newsList).each(function(i, data){
					var link = data.newsLink.split('?');
					$(".mainNews ul").append("<li><a href='${pageContext.request.contextPath }/stockInfo/newsView.do?"+link[1]+"'>"+data.newsTitle+"</a></li>");
				});
				// 증권뉴스-->
				
				// <--거래상위
			$("#stockTable1").empty();
			$(result.stockList1).each(function(i, data){
				var text;
				if(data.stockStatus == "up"){
					text = "▲ ";
				}else if(data.stockStatus == "down"){
					text = "▼ ";
				}else{
					text = "= ";
				}
				$("#stockTable1").append("<tr><th style='float:left;'><p class='textOverflow'><img src='${pageContext.request.contextPath }/UI/img/no"+(i+1*1)+".png'>&nbsp;<a href='${pageContext.request.contextPath }/stockInfo/stockDetail.do?code="+data.stockCode+"'>"+data.stockName+"</a></p></th> <td style='padding-left:10px;'>"+data.stockNum1+"</td> <td style='padding-left:10px;'><span class="+data.stockStatus+">"+text +data.stockNum2+"</span> </td> <td style='padding-left:10px;'><span class="+data.stockStatus+">"+data.stockNum3+"</span> </td> </tr>");
			});
			// 거래상위 -->
			
			// <--시가총액상위
			$("#stockTable2").empty();
			$(result.stockList2).each(function(i, data){
				var text;
				if(data.stockStatus == "up"){
					text = "▲ ";
				}else if(data.stockStatus == "down"){
					text = "▼ ";
				}else{
					text = "= ";
				}
				$("#stockTable2").append("<tr><th style='float:left;'><p class='textOverflow'><img src='${pageContext.request.contextPath }/UI/img/no"+(i+1*1)+".png'>&nbsp;<a href='${pageContext.request.contextPath }/stockInfo/stockDetail.do?code="+data.stockCode+"'>"+data.stockName+"</a></p></th> <td style='padding-left:10px;'>"+data.stockNum1+"</td> <td style='padding-left:10px;'><span class="+data.stockStatus+">"+text +data.stockNum2+"</span> </td> <td style='padding-left:10px;'><span class="+data.stockStatus+">"+data.stockNum3+"</span> </td> </tr>");
			});
			// 시가총액상위 -->
			
			// <--상승
			$("#stockTable3").empty();
			$(result.stockList3).each(function(i, data){
				var text;
				if(data.stockStatus == "up"){
					text = "▲ ";
				}else if(data.stockStatus == "down"){
					text = "▼ ";
				}else{
					text = "= ";
				}
				$("#stockTable3").append("<tr><th style='float:left;'><p class='textOverflow'><img src='${pageContext.request.contextPath }/UI/img/no"+(i+1*1)+".png'>&nbsp;<a href='${pageContext.request.contextPath }/stockInfo/stockDetail.do?code="+data.stockCode+"'>"+data.stockName+"</a></p></th> <td style='padding-left:10px;'>"+data.stockNum1+"</td> <td style='padding-left:10px;'><span class="+data.stockStatus+">"+text +data.stockNum2+"</span> </td> <td style='padding-left:10px;'><span class="+data.stockStatus+">"+data.stockNum3+"</span> </td> </tr>");
			});
			// 상승 -->
			
			// <--하락
			$("#stockTable4").empty();
			$(result.stockList4).each(function(i, data){
				var text;
				if(data.stockStatus == "up"){
					text = "▲ ";
				}else if(data.stockStatus == "down"){
					text = "▼ ";
				}else{
					text = "= ";
				}
				$("#stockTable4").append("<tr><th style='float:left;'><p class='textOverflow'><img src='${pageContext.request.contextPath }/UI/img/no"+(i+1*1)+".png'>&nbsp;<a href='${pageContext.request.contextPath }/stockInfo/stockDetail.do?code="+data.stockCode+"'>"+data.stockName+"</a></p></th> <td style='padding-left:10px;'>"+data.stockNum1+"</td> <td style='padding-left:10px;'><span class="+data.stockStatus+">"+text +data.stockNum2+"</span> </td> <td style='padding-left:10px;'><span class="+data.stockStatus+">"+data.stockNum3+"</span> </td> </tr>");
			});
			// 하락-->
			
			// <--테마상위
			$("#themeTable tr").empty();
			$(result.themeList).each(function(idx, data){
				for(var i in data){
					for(var j in data[i]){
						console.log(data[i][j])
						if(j==0){
							$("#themeTable tr:eq("+ idx +")").append("<th style='float:left;'><p class='textOverflow'><img src='${pageContext.request.contextPath }/UI/img/no"+(idx+1*1)+".png'>&nbsp;"+data[i][j].stockName+"</p><p class="+data[i][j].stockStatus+">"+data[i][j].stockNum+"</p></th>");	
						}else{
							$("#themeTable tr:eq("+ idx +")").append("<td style='padding-left:10px;'><a href='${pageContext.request.contextPath }/stockInfo/stockDetail.do?code="+data[i][j].stockCode+"'>"+data[i][j].stockName+"</a><p class="+data[i][j].stockStatus+">"+data[i][j].stockNum+"</p></td>")
						}
					}
				}
			});
			// 테마상위 -->
			
			// <--업종상위
			$("#typeTable tr").empty();
			$(result.typeList).each(function(idx, data){
				for(var i in data){
					for(var j in data[i]){
						console.log(data[i][j])
						if(j==0){
							$("#typeTable tr:eq("+ idx +")").append("<th style='float:left;'><p class='textOverflow'><img src='${pageContext.request.contextPath }/UI/img/no"+(idx+1*1)+".png'>&nbsp;"+data[i][j].stockName+"</p><p class="+data[i][j].stockStatus+">"+data[i][j].stockNum+"</p></th>");	
						}else{
							$("#typeTable tr:eq("+ idx +")").append("<td style='padding-left:10px;'><a href='${pageContext.request.contextPath }/stockInfo/stockDetail.do?code="+data[i][j].stockCode+"'>"+data[i][j].stockName+"</a><p class="+data[i][j].stockStatus+">"+data[i][j].stockNum+"</p></td>")
						}
					}
				}
			});
			// 업종상위 -->
			}
		})
		// ajax ===>
		}
		// crawling ==>
		
		startInterval(crawling);
	
		$("#loginBtn").click(function(){
			location.href = "${pageContext.request.contextPath }/login/login.do";
		})
		
		$("#moreBtn").click(function(){
			location.href = "${pageContext.request.contextPath }/cloud/cloudList.do";
		})
		
		$("#myDeleteBtn0").click(function(){
			var con = confirm("삭제요청하시겠습니까?");
			if(con == false){
			  return false;
			}else{
				var stock_item_code = ($("#myDeleteBtn0").val());
				var mem_id = '${LOGIN_MEMBERINFO.mem_id}';
				location.href = "${pageContext.request.contextPath }/member/deleteTest.do?stock_item_code="+stock_item_code+"&mem_id="+mem_id;
			}
		})
		$("#myDeleteBtn1").click(function(){
			var con = confirm("삭제요청하시겠습니까?");
			if(con == false){
			  return false;
			}else{
				var stock_item_code = ($("#myDeleteBtn1").val());
				var mem_id = '${LOGIN_MEMBERINFO.mem_id}';
				location.href = "${pageContext.request.contextPath }/member/deleteTest.do?stock_item_code="+stock_item_code+"&mem_id="+mem_id;
			}
		})
		$("#myDeleteBtn2").click(function(){
			var con = confirm("삭제요청하시겠습니까?");
			if(con == false){
			  return false;
			}else{
				var stock_item_code = ($("#myDeleteBtn2").val());
				var mem_id = '${LOGIN_MEMBERINFO.mem_id}';
				location.href = "${pageContext.request.contextPath }/member/deleteTest.do?stock_item_code="+stock_item_code+"&mem_id="+mem_id;
			}
		})
		$("#myDeleteBtn3").click(function(){
			var con = confirm("삭제요청하시겠습니까?");
			if(con == false){
			  return false;
			}else{
				var stock_item_code = ($("#myDeleteBtn3").val());
				var mem_id = '${LOGIN_MEMBERINFO.mem_id}';
				location.href = "${pageContext.request.contextPath }/member/deleteTest.do?stock_item_code="+stock_item_code+"&mem_id="+mem_id;
			}
		})
});
</script>
</head>
<body>
    	<div class="stockMainWrap" style="width: 100%; margin-top: 20px; padding:20px;">
        <section style="display:flex; justify-content:center;">
              <!-- 코스피,코스닥,코스피200자리 탭메뉴 -->
              <div class="placeKospi_tab" style="margin-right:200px;">
                  <div class="text">
                      <span class="title">오늘의 증시</span>
                      <span class="subTitle"></span>
                  </div>    
                  <div class="char1">
                    <div class="tab_kospi">
                        <ul class="tabmenu_kospi">
                          <li onclick="bgChangerKospi()" id="bgkospi" class="greybgstart">
                            <a href="javascript:kospiTab('tb_1_kospi', 'content_1_kospi');" id="tb_1_kospi" class="tabmenu_kospi active">
                                  <div class="txt_area">
                                    <strong class="stock_item"></strong>
                                    <span class="stock_price"></span>
                                    <div class="gap_wrp stock_dn">
                                      <span class="gap_price"><em class="ico"></em></span><span class="gap_rate"></span>
                                    </div>
                                  </div>
                            </a>
                          </li>
                          <li onclick="bgChangerKosdaq()" id="bgkosdaq" class="greybgstart">
                            <a href="javascript:kospiTab('tb_2_kospi', 'content_2_kospi');" id="tb_2_kospi" class="tabmenu_kospi">
                                  <div class="txt_area">
                                    <strong class="stock_item"></strong>
                                    <span class="stock_price"></span>
                                    <div class="gap_wrp stock_up">
                                      <span class="gap_price"><em class="ico"></em></span><span class="gap_rate"></span>
                                    </div>
                                  </div>
                            </a>
                          </li>
                          <li onclick="bgChangerKospi200()" id="bgkospi200" class="greybgstart">
                            <a href="javascript:kospiTab('tb_3_kospi', 'content_3_kospi');" id="tb_3_kospi" class="tabmenu_kospi active2">
                                  <div class="txt_area">
                                    <strong class="stock_item"></strong>
                                    <span class="stock_price"></span>
                                    <div class="gap_wrp stock_dn">
                                      <span class="gap_price"><em class="ico"></em></span><span class="gap_rate"></span>
                                    </div>
                                  </div>
                                </a>
                          </li>
                        </ul>
                        
                        <div id="content_1_kospi" class="tabcontent_kospi"> 
                          <div class="tabcontent_content_kospi">
                              <h2>코스피</h2>
                            <div class="kospi_graph">
                                <img src="" style="width:100%;" alt="">
                        </div>
                          </div>
                        </div> 
                        <div id="content_2_kospi" class="tabcontent_kospi" style="display:none;">
                          <div class="tabcontent_content2_kospi">
                            <h2>코스닥</h2>
                            <div class="kospi_graph">
                                <img src="" style="width:100%;" alt="">                 
                            </div>
                        </div>
                      </div>
                        <div id="content_3_kospi" class="tabcontent_kospi" style="display:none;">
                            <div class="tabcontent_content3_kospi">
                              <h2>코스피200</h2>
                              <div class="kospi_graph">
                                  <img src="" style="width:100%;" alt="">                 
                              </div>
                            </div>
                          </div>
                      </div> 
                </div>
                </div>
                
              <!-- (생략) 코스피,코스닥,코스피200 사이즈 줄인거 -->
              <div class="placeKospireduced_tab">
<!--                     <div class="text"> -->
<!--                       <span class="title"></span><span class="subTitle"></span> -->
<!--                   </div>    -->
                  <div class="placeKospireduced_tab_box">
                    <div class="tab_kospi_small">
                        <li>
                            <a href="#">
                                <div class="txt_area">
                                        <strong class="stock_item"></strong>
                                        <span class="stock_price"></span>
                                        <div>
                                            <span class="gap_price"></span>
                                            <span class="gap_rate"></span>
                                        </div>
                                    </div>
                                    <div class="img_area">
                                        <img class="img_chart">
                                    </div>
                                </a>
                            </li>
                      </div> 
                      <div class="tab_kospi_small">
                        <li>
                                <a href="#">
                                    <div class="txt_area">
                                        <strong class="stock_item"></strong>
                                        <span class="stock_price"></span>
                                        <div class="gap_wrp stock_dn">
                                            <span class="gap_price"></span>
                                            <span class="gap_rate"></span>
                                        </div>
                                    </div>
                                    <div class="img_area">
                                        <img class="img_chart">
                                    </div>
                                </a>
                            </li>
                      </div> 
                      <div class="tab_kospi_small">
                        <li>
                            <a href="#">
                                <div class="txt_area">
                                        <strong class="stock_item"></strong>
                                        <span class="stock_price"></span>
                                        <div class="gap_wrp stock_dn">
                                            <span class="gap_price"></span>
                                            <span class="gap_rate"></span>
                                        </div>
                                    </div>
                                    <div class="img_area">
                                        <img class="img_chart">
                                    </div>
                                </a>
                            </li>
                      </div>
                  </div>
                </div>
              <!-- 코스피 탭 모바일 버전 끝 -->
                
              <!-- 이슈종목,나의종목 탭메뉴-->
              <div class="placeIssue_tab">
                  <div class="text">
                    <span class="title"></span><span class="subTitle"></span>
                </div>    
                  <div class="chart2">
					<!-- 종목 탭 시작 -->
                    <div class="tab">
                        <ul class="tabmenu">
                          <li onclick="bgChanger1()" id="bg2"><a href="javascript:rudrSwitchTab('right_tb_1', 'right_tabContent_1');" id="right_tb_1" class="rightTabmenu active">인기 검색 종목</a></li>
                          <li onclick="bgChanger2()" id="bg1" class="greybgstart"><a href="javascript:rudrSwitchTab('right_tb_2', 'right_tabContent_2');" id="right_tb_2" class="rightTabmenu">나의 관심종목</a></li>
                        </ul>
                        <div id="right_tabContent_1" class="rightTabcontent"> 
                          <div class="tabcontent_content">
                            <table id="tbl_home"> 
                            <tbody>
                            </tbody> 
                            </table> 
                            	<button class="btn-simple-login" id="moreBtn" style="display:flex; justify-content:center;">더보기></button>
                          </div>
                        </div>
                        
                        <!-- 관심종목 수정중 --> 
                        
                        <c:if test="${empty LOGIN_ADMININFO }">
							<c:if test="${!empty LOGIN_MEMBERINFO }">
							
		                        <div id="right_tabContent_2" class="rightTabcontent" style="display:none;">
		                          <div class="tabcontent_content">
		                          	<table id="tbl_home3"> 
		                          	
			                            <tbody>
			                            <c:if test="${!empty interestItemList }">
			                            <c:forEach items="${interestItemList }" var="interestItemInfo" varStatus="status">
											<tr>
												<tr> 
													<th style='float:left;'>
														<img src='${pageContext.request.contextPath }/UI/img/no${status.count}.png'>&nbsp;
														<a href='${pageContext.request.contextPath }/stockInfo/stockDetail.do?code=${interestItemInfo.stock_item_code }'>${interestItemInfo.stock_item_name }</a>
														&nbsp;&nbsp;&nbsp;
														<button id='myDeleteBtn${status.index}' value='${interestItemInfo.stock_item_code }'>삭제</button>
													</th>
												</tr>
											</tr>
										</c:forEach>
										</c:if>
										<c:if test="${empty interestItemList }">
										<p>나의 관심종목이 없습니다.</p>
										</c:if>
			                            </tbody> 
		                            </table> 
		                          </div>
		                        </div>
	                        </c:if>
                        </c:if>
                        
                        <!-- 관심종목 -->
                        <c:if test="${empty LOGIN_ADMININFO }">
							<c:if test="${empty LOGIN_MEMBERINFO }">
		                        <div id="right_tabContent_2" class="rightTabcontent" style="display:none;">
		                          <div class="tabcontent_content2">
		                          	<table id="tbl_home3"> 
			                            <p>로그인 후 이용 가능합니다.</p>
			                            <button class="btn-simple-login" id="loginBtn">로그인</button>
		                            </table> 
		                          </div>
		                        </div>
	                        </c:if>
                        </c:if>
                        
                        
                        
                    </div> 
                    <!-- 종목탭끝 -->
                </div>
                </div>
        </section>
		<div class="padding"></div>
		<div class="padding"></div>
<!-- 나머지들 -->
		<div class="stockMainWrap2" style="display:flex;">
              <!-- 거래상위, 시가총액상위 탭메뉴-->
              <div class="placeTransactionTop_tab" style="margin: 20px;">
                  <div class="tab_transactionTop">
                    <ul class="tabmenu_transactionTop">
                      <li onclick="bgChanger3()" id="bg4"><a href="javascript:rudrSwitchTab2('tb_3', 'content_3');" id="tb_3" class="tabmenu_transactionTop active">거래상위</a></li>
                      <li onclick="bgChanger4()" id="bg3" class="greybgstart"><a href="javascript:rudrSwitchTab2('tb_4', 'content_4');" id="tb_4" class="tabmenu_transactionTop">시가총액상위</a></li>
                    </ul>
                    
                    <div id="content_3" class="tabcontent_transactionTop"> 
                      <div class="tabcontent_content_transactionTop">
                        <table id="stockTable1"> 
                        <tbody> 
                          
                        </tbody> 
                        </table> 
                      </div>
                    </div> 
                    <div id="content_4" class="tabcontent_transactionTop" style="display:none;">
                      <div class="tabcontent_content_transactionTop">
                      	<table id="stockTable2"> 
                        <tbody> 
                          
                        </tbody> 
                        </table> 
                      </div>
                    </div>
                </div> 
                </div>

              <!-- 테마상위,업종상위묶은거 -->
              <div class="containerMain_4">
                   <!-- 테마상위 -->
                    <div class="placeThemeTop"><p>테마상위</p>
                      <div class="tabcontent_content_priceTop">
                        <table id="themeTable"> 
                        <tbody>
                        <tr></tr>
                        <tr></tr>
                        <tr></tr>
                        </tbody> 
                        </table> 
                      </div>
                    </div>
                  <!-- 업종상위-->
                    <div class="placeBusinessTop"><p>업종상위</p>
                      <div class="tabcontent_content_priceTop">
                        <table id="typeTable"> 
                        <tbody> 
                        <tr></tr>
                        <tr></tr> 
                        <tr></tr>
                        </tbody> 
                        </table> 
                      </div>
                    </div>
              </div>
              
              <!-- 상한가,하한가 탭메뉴-->
              <div class="placePrice_tab">
                <div class="tab_priceTop">
                  <ul class="tabmenu_priceTop">
                    <li onclick="bgChanger5()" id="bg6"><a href="javascript:rudrSwitchTab3('tb_5', 'content_5');" id="tb_5" class="tabmenu_priceTop active">상승</a></li>
                    <li onclick="bgChanger6()" id="bg5" class="greybgstart"><a href="javascript:rudrSwitchTab3('tb_6', 'content_6');" id="tb_6" class="tabmenu_priceTop">하락</a></li>
                  </ul>
                  
                  <div id="content_5" class="tabcontent_priceTop"> 
                    <div class="tabcontent_content_priceTop">
                      <table id="stockTable3"> 
                            <tbody>
                            </tbody> 
                            </table> 
                    </div>
                  </div> 
                  <div id="content_6" class="tabcontent_priceTop" style="display:none;">
                    <div class="tabcontent_content_priceTop">
                      <table id="stockTable4"> 
                       <tbody>
                       
                       </tbody> 
                       </table> 
                    </div>
                  </div>
              </div> 
              </div>
        </div>      
    	</div>    	
</body>
</html>