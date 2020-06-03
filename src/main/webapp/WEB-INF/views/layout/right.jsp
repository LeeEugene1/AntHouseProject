<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	$(function(){
		function crawling(){
		$.ajax({
			type : 'post',
			url : '${pageContext.request.contextPath}/crawler/side.do',
			dataType : 'json',
			error : function(result){
// 				console.log(result);
			},
			success:function(result){
// 				console.log(result.stockList);
				$(".stock_item:eq(0)").text(result.kospiTitle);
				$(".stock_price:eq(0)").text(result.kospiNum1);
				$(".gap_rate:eq(0)").text(result.kospiNum3);
				$(".img_chart:eq(0)").attr("src",result.kospiImg);
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
				$(".img_chart:eq(1)").attr("src",result.kosdaqImg);
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
				$(".img_chart:eq(2)").attr("src",result.kospi200Img);
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
				
			}
		});
		// ajax ==>
		};
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
<div class="content_right">
                <div>
                    <div class="tab_kospi_small">
                        <li>
                            <a href="${pageContext.request.contextPath}/stockInfo/stockMain.do">
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
                                <a href="${pageContext.request.contextPath}/stockInfo/stockMain.do">
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
                            <a href="${pageContext.request.contextPath}/stockInfo/stockMain.do">
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
        <!-- 종목 탭 시작 -->
                    <div class="tab" style="margin-top: 15px;">
                        <ul class="rightTabmenu">
                          <li onclick="bgChanger1()" id="bg2"><a href="javascript:rudrSwitchTab('right_tb_1', 'right_tabContent_1');" id="right_tb_1" class="rightTabmenu active">인기 검색 종목</a></li>
                          <li onclick="bgChanger2()" id="bg1" class="greybgstart"><a href="javascript:rudrSwitchTab('right_tb_2', 'right_tabContent_2');" id="right_tb_2" class="rightTabmenu">나의 관심종목</a></li>
                        </ul>
                        
                        <div id="right_tabContent_1" class="rightTabcontent"> 
                          <div class="tabcontent_content">
                            <table id="tbl_home" width=100%> 
                            <tbody>
                            </tbody> 
                            </table> 
                            <div style="text-align:right;">
	                            <button class="btn-simple-login" id="moreBtn">더보기</button>
                            </div>
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

           </div> 
 </div>
</body>
</html>