<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>

$(function(){
	function crawling(){
	$.ajax({
		type : 'post',
		url : '${pageContext.request.contextPath}/crawler/stockDetail.do?${link}',
		dataType : 'json',
		error : function(result){
			console.log(result);
		},
		success:function(result){
// 			console.log(result);
			
			$("#stockName").text(result.stockName);
			$(".stitle p:eq(0)").text(result.stockCode);
			$(".stitle p:eq(2)").text(result.time);
			
			$("#myPopup").text(result.stockDesc1 + result.stockDesc2 + result.stockDesc3);
			
			$(".firstLine p strong").text(result.todayNum);
			
			$(".secondLine p:eq(2)").text(result.exdayNum2);
			
			if(result.todayStatus == "no_up"){
				$(".firstLine p strong").addClass("up");
				$(".secondLine p:eq(1)").addClass("up");
				$(".secondLine p:eq(2)").addClass("up");
				$(".secondLine p:eq(1)").text("▲ " +result.exdayNum1);
				
			}else if(result.todayStatus == "no_down"){
				$(".firstLine p strong").addClass("down");
				$(".secondLine p:eq(1)").addClass("down");
				$(".secondLine p:eq(2)").addClass("down");
				$(".secondLine p:eq(1)").text("▼ " +result.exdayNum1);
			}else{
				$(".firstLine p strong").addClass("same");
				$(".secondLine p:eq(1)").addClass("same");
				$(".secondLine p:eq(2)").addClass("same");
				$(".secondLine p:eq(1)").text("= " +result.exdayNum1);
			}
			
			$(".leftContent:eq(0) div:eq(0) p:eq(1)").text(result.noInfo1);
			$(".leftContent:eq(0) div:eq(1) p:eq(1) span:eq(0)").text(result.noInfo2);
			$(".leftContent:eq(0) div:eq(1) p:eq(1) span:eq(1)").text("(상한가 " + result.noInfo3 +")");
			$(".leftContent:eq(0) div:eq(2) p:eq(1)").text(result.noInfo4);
			
			$(".leftContent:eq(1) div:eq(0) p:eq(1)").text(result.noInfo5);
			$(".leftContent:eq(1) div:eq(1) p:eq(1) span:eq(0)").text(result.noInfo6);
			$(".leftContent:eq(1) div:eq(1) p:eq(1) span:eq(1)").text("(하한가 " + result.noInfo7 +")");
			$(".leftContent:eq(1) div:eq(2) p:eq(1)").text(result.noInfo8 +" 백만");
			
			if(result.noInfo2_Status == "no_up"){
				$(".leftContent:eq(0) div:eq(1) p:eq(1) span:eq(0)").addClass("up");
			}else if(result.noInfo2_Status == "no_down"){
				$(".leftContent:eq(0) div:eq(1) p:eq(1) span:eq(0)").addClass("down");
			}else{
				$(".leftContent:eq(0) div:eq(1) p:eq(1) span:eq(0)").addClass("same");
			}
			
			if(result.noInfo5_Status == "no_up"){
				$(".leftContent:eq(1) div:eq(0) p:eq(1)").addClass("up");
			}else if(result.noInfo5_Status == "no_down"){
				$(".leftContent:eq(1) div:eq(0) p:eq(1)").addClass("down");
			}else{
				$(".leftContent:eq(1) div:eq(0) p:eq(1)").addClass("same");
			}
			
			if(result.noInfo6_Status == "no_up"){
				$(".leftContent:eq(1) div:eq(1) p:eq(1) span:eq(0)").addClass("up");
			}else if(result.noInfo6_Status == "no_down"){
				$(".leftContent:eq(1) div:eq(1) p:eq(1) span:eq(0)").addClass("down");
			}else{
				$(".leftContent:eq(1) div:eq(1) p:eq(1) span:eq(0)").addClass("same");
			}
			
			$(".sresult span:eq(0)").text(result.dtNum1+"원");
			$(".sresult span:eq(1)").text(result.dtNum2+"원");
			$(".sresult span:eq(2)").text(result.dtNum3+"배");
			$(".sresult span:eq(3)").text(result.dtNum4);
// 			$(".sresult span:eq(4)").text(result.dtNum5+"배");
			$(".sresult span:eq(4)").text(result.dtNum6+"%");
			
			$("#sresultPopup1 p").text(result.helper1);
			$("#sresultPopup2 p").text(result.helper2);
			$("#sresultPopup3 p:eq(0)").text(result.helper3_1);
			$("#sresultPopup3 p:eq(1)").text(result.helper3_2);
			
			
			$("#content_1 img").attr("src",result.chartImg1);
			$("#content_2 img").attr("src",result.chartImg2);
			$("#content_3 img").attr("src",result.chartImg3);
			$("#content_4 img").attr("src",result.chartImg4);
			$("#content_5 img").attr("src",result.chartImg5);
			$("#content_6 img").attr("src",result.chartImg6);
			$("#content_7 img").attr("src",result.chartImg7);
			$("#content_8 img").attr("src",result.chartImg8);
			$("#content_9 img").attr("src",result.chartImg9);
			$("#content_10 img").attr("src",result.chartImg10);
			
			$('#content3_1 .lefttop tr:eq(0) td:eq(1)').text(result.comDesc);
			$('#content3_1 .lefttop tr:eq(1) td:eq(1)').text(result.comDesc1);
			$('#content3_1 .lefttop tr:eq(2) td:eq(1) a').text(result.comDesc2);
			$('#content3_1 .lefttop tr:eq(2) td:eq(1) a').attr("href",result.comDesc2);
			$('#content3_1 .lefttop tr:eq(3) td:eq(1)').text(result.comDesc3);
			$('#content3_1 .lefttop tr:eq(4) td:eq(1)').text(result.comDesc4);
			$('#content3_1 .lefttop tr:eq(5) td:eq(1)').text(result.comDesc5);
			$('#content3_1 .lefttop tr:eq(6) td:eq(1)').text(result.comDesc6);
			$('#content3_1 .lefttop tr:eq(7) td:eq(1)').text(result.comDesc7);
			$('#content3_1 .lefttop tr:eq(8) td:eq(1)').text(result.comDesc8);
			
			$('#content3_1 .righttop tr:eq(0) td:eq(1) span:eq(0)').text(result.comSise1);
			$('#content3_1 .righttop tr:eq(0) td:eq(1) span:eq(1)').text(result.comSise2);
			$('#content3_1 .righttop tr:eq(0) td:eq(1) span:eq(2)').text(result.comSise3);
			$('#content3_1 .righttop tr:eq(1) td:eq(1)').text(result.comSise4 +" / " + result.comSise5);
			$('#content3_1 .righttop tr:eq(2) td:eq(1)').text(result.comSise6);
			$('#content3_1 .righttop tr:eq(3) td:eq(1)').text(result.comSise7 +" / " + result.comSise8);
			$('#content3_1 .righttop tr:eq(4) td:eq(1)').text(result.comSise9);
			$('#content3_1 .righttop tr:eq(5) td:eq(1)').text(result.comSise10);
			$('#content3_1 .righttop tr:eq(6) td:eq(1)').text(result.comSise11 +" / " + result.comSise12);
			$('#content3_1 .righttop tr:eq(7) td:eq(1)').text(result.comSise13);
			$('#content3_1 .righttop tr:eq(8) td:eq(1) span:eq(0)').text(result.comSise14);
			$('#content3_1 .righttop tr:eq(8) td:eq(1) span:eq(1)').text(result.comSise15);
			$('#content3_1 .righttop tr:eq(8) td:eq(1) span:eq(2)').text(result.comSise16);
			$('#content3_1 .righttop tr:eq(8) td:eq(1) span:eq(3)').text(result.comSise17);
			
			if(result.comSise2_1 == "cUp"){
				$('#content3_1 .righttop tr:eq(0) td:eq(1) span:eq(1)').addClass("up");
			}else if(result.comSise2_1 == "cDn"){
				$('#content3_1 .righttop tr:eq(0) td:eq(1) span:eq(1)').addClass("down");
			}else{
				$('#content3_1 .righttop tr:eq(0) td:eq(1) span:eq(1)').addClass("same");
			}
			
			if(result.comSise3_1 == "cUp"){
				$('#content3_1 .righttop tr:eq(0) td:eq(1) span:eq(2)').addClass("up");
			}else if(result.comSise3_1 == "cDn"){
				$('#content3_1 .righttop tr:eq(0) td:eq(1) span:eq(2)').addClass("down");
			}else{
				$('#content3_1 .righttop tr:eq(0) td:eq(1) span:eq(2)').addClass("same");
			}
			
			if(result.comSise14_1 == "cUp"){
				$('#content3_1 .righttop tr:eq(8) td:eq(1) span:eq(0)').addClass("up");
			}else if(result.comSise14_1 == "cDn"){
				$('#content3_1 .righttop tr:eq(8) td:eq(1) span:eq(0)').addClass("down");
			}else{
				$('#content3_1 .righttop tr:eq(8) td:eq(1) span:eq(0)').addClass("same");
			}
			if(result.comSise15_1 == "cUp"){
				$('#content3_1 .righttop tr:eq(8) td:eq(1) span:eq(1)').addClass("up");
			}else if(result.comSise15_1 == "cDn"){
				$('#content3_1 .righttop tr:eq(8) td:eq(1) span:eq(1)').addClass("down");
			}else{
				$('#content3_1 .righttop tr:eq(8) td:eq(1) span:eq(1)').addClass("same");
			}
			if(result.comSise16_1 == "cUp"){
				$('#content3_1 .righttop tr:eq(8) td:eq(1) span:eq(2)').addClass("up");
			}else if(result.comSise16_1 == "cDn"){
				$('#content3_1 .righttop tr:eq(8) td:eq(1) span:eq(2)').addClass("down");
			}else{
				$('#content3_1 .righttop tr:eq(8) td:eq(1) span:eq(2)').addClass("same");
			}
			if(result.comSise17_1 == "cUp"){
				$('#content3_1 .righttop tr:eq(8) td:eq(1) span:eq(3)').addClass("up");
			}else if(result.comSise17_1 == "cDn"){
				$('#content3_1 .righttop tr:eq(8) td:eq(1) span:eq(3)').addClass("down");
			}else{
				$('#content3_1 .righttop tr:eq(8) td:eq(1) span:eq(3)').addClass("same");
			}
			
			$("#content3_1 .leftbottom ul").empty();
			if(result.newsChk == "y"){
				$(result.newsList).each(function(i, data){
					var link = data.newsLink.split('?');
					$("#content3_1 .leftbottom ul").append("<li><a href='${pageContext.request.contextPath }/stockInfo/newsView.do?"+link[1]+"'>"+data.newsTitle+"</a></li>");
				});	
			}else{
				$("#content3_1 .leftbottom ul").append("<li>최근 1년 내 검색된 관련뉴스가 없습니다.</li>");
			}
			
			$("#content3_1 .rightbottom ul").empty();
			if(result.forumChk == "y"){
				$(result.forumList).each(function(i, data){
					var link = data.forumLink.split('?');
					$("#content3_1 .rightbottom ul").append("<li><a href='${pageContext.request.contextPath }/stockInfo/forumView.do?"+link[1]+"'>"+data.forumTitle+"</a></li>");
				});	
			}else{
				$("#content3_1 .rightbottom ul").append("<li>최근 1년 내 등록된 종목토론이 없습니다.</li>");
			}
			
			
			// 관심종목 등록
			$('#interestBtn').click(function(){
				var con = confirm("관심종목 추가하시겠습니까?");
				var mem_id = '${LOGIN_MEMBERINFO.mem_id}';
				var stock_item_name = $('#stockName').text();
				if(con == false){
					return false;
				}else{
	       		 	location.href = "${pageContext.request.contextPath}/member/interestAdd.do?${link}&mem_id="+mem_id+"&stock_item_name="+stock_item_name;
				}
        	});
			
			$("#contentforeigner_1 img").attr("src",result.graphImg1);
			$("#contentforeigner_2 img").attr("src",result.graphImg2);
			$("#contentforeigner_3 img").attr("src",result.graphImg3);
			$("#contentforeigner_4 img").attr("src",result.graphImg4);
			$("#contentforeignCompany_1 img").attr("src",result.graphImg5);
			$("#contentforeignCompany_2 img").attr("src",result.graphImg6);
			$("#contentforeignCompany_3 img").attr("src",result.graphImg7);
			$("#contentforeignCompany_4 img").attr("src",result.graphImg8);
			
			if(result.investChk == "y"){
				$("#content3_3 .firstLine table tr:eq(0) span:eq(0)").attr("style","top:-13px; position: absolute;left:"+result.investPoint);
				$("#content3_3 .firstLine table tr:eq(1) td:eq(0)").text(result.investNum1);
				$("#content3_3 .firstLine table tr:eq(1) td:eq(1)").text(result.investNum2);
				$("#content3_3 .firstLine table tr:eq(1) td:eq(2)").text(result.investNum3);
				$("#content3_3 .firstLine table tr:eq(1) td:eq(3)").text(result.investNum4);
				$("#content3_3 .firstLine table tr:eq(1) td:eq(4)").text(result.investNum5);
				
				$("#content3_3 .secondLine table tr:eq(1) td:eq(0)").text(result.investNum6_1);
				$("#content3_3 .secondLine table tr:eq(1) td:eq(1)").text(result.investNum6_2);
				$("#content3_3 .secondLine table tr:eq(1) td:eq(2)").text(result.investNum6_3);
				$("#content3_3 .secondLine table tr:eq(1) td:eq(3)").text(result.investNum6_4);
				$("#content3_3 .secondLine table tr:eq(1) td:eq(4)").text(result.investNum6_5);
				$("#content3_3 .secondLine table tr:eq(1) td:eq(5)").text(result.investNum6_6);
				$("#content3_3 .secondLine table tr:eq(1) td:eq(6)").text(result.investNum6_7);
				
				$("#content3_3 .secondLine table tr:eq(2) td:eq(0)").text(result.investNum7_1);
				$("#content3_3 .secondLine table tr:eq(2) td:eq(1)").text(result.investNum7_2);
				$("#content3_3 .secondLine table tr:eq(2) td:eq(2)").text(result.investNum7_3);
				$("#content3_3 .secondLine table tr:eq(2) td:eq(3)").text(result.investNum7_4);
				$("#content3_3 .secondLine table tr:eq(2) td:eq(4)").text(result.investNum7_5);
				$("#content3_3 .secondLine table tr:eq(2) td:eq(5)").text(result.investNum7_6);
				$("#content3_3 .secondLine table tr:eq(2) td:eq(6)").text(result.investNum7_7);
				
				$("#content3_3 .secondLine table tr:eq(3) td:eq(0)").text(result.investNum8_1);
				$("#content3_3 .secondLine table tr:eq(3) td:eq(1)").text(result.investNum8_2);
				$("#content3_3 .secondLine table tr:eq(3) td:eq(2)").text(result.investNum8_3);
				$("#content3_3 .secondLine table tr:eq(3) td:eq(3)").text(result.investNum8_4);
				$("#content3_3 .secondLine table tr:eq(3) td:eq(4)").text(result.investNum8_5);
				$("#content3_3 .secondLine table tr:eq(3) td:eq(5)").text(result.investNum8_6);
				$("#content3_3 .secondLine table tr:eq(3) td:eq(6)").text(result.investNum8_7);
			}
			
		}
	});
	// ajax==>
	}
	// crawlig ==>
	
	startInterval(crawling);
});

//주식정보 기업개요 팝업
function spopup(){
   var popup = document.getElementById("myPopup");
     popup.classList.toggle("show");
}

function sresultpopup(t){
	if($(t.children[2]).hasClass("show") == true){
		$(t.children[2]).removeClass("show");
		return;
	}
	
	$(t.children[2]).addClass("show");
}

</script>
</head>
<body>
	<div class="wrap">
	        <div class="headerSubandContent">
	            <content>
	                <div class="wrap2">
	                    <div class="stockInfo">
	                        <h1 id="stockName" style="margin-bottom: 5px;"></h1>
	                        <div class="stitle">
	                            <p></p>
	                            <!-- 코스피혹은 코스닥이미지 -->
	                            <p><img src="${pageContext.request.contextPath }/UI/img/kospi.png" alt="" style="width:100%;"></p>
	                            <p></p>
	                            <!-- 실시간이미지 -->
	                            <p><img src="${pageContext.request.contextPath }/UI/img/update.png" alt="" style="width:100%;"></p>
	                            <div class="popup" onclick="spopup();" style="cursor:pointer;"><img src="${pageContext.request.contextPath }/UI/img/company.png" alt="" style="width:100%;">
	                                <p class="popuptext" id="myPopup"></p>
	                            </div>
	                            <button class="btn-simple-login" id="interestBtn" style="display:flex; justify-content:center;align-items: center;font-size: 12px;margin-left: 10px;">관심종목 등록</button>
	
	                        </div>
	                        <div class="sprice">
	                            <table>
	                                <tr>
	                                    <td class="rightContent" rowspan="2">
	                                        <div class="firstLine">
	                                            <p><Strong style="font-size:1.5em;"></Strong></p>
	                                        </div>
	                                        <div class="secondLine">
	                                            <p>전일대비</p>
	                                            <p></p>
	                                            <p></p>
	                                        </div>
	                                    </td>
	                                    <td class="leftContent">
	                                        <div>
	                                            <p>전일</p>
	                                            <p></p>
	                                        </div>
	                                        <div>
	                                            <p>고가</p>
	                                            <p><span></span>&nbsp;&nbsp;<span></span></p>
	                                        </div>
	                                        <div>
	                                            <p>거래량</p>
	                                            <p></p>
	                                        </div>
	                                    </td>
	                                </tr>
	                                <tr>
	                                    <td class="leftContent">
	                                        <div>
	                                            <p>시가</p>
	                                            <p></p>
	                                        </div>
	                                        <div>
	                                            <p>저가</p>
	                                            <p><span></span>&nbsp;&nbsp;<span></span></p>
	                                        </div>
	                                        <div>
	                                            <p>거래대금</p>
	                                            <p></p>
	                                        </div>
	                                    </td>
	                                </tr>
	                            </table>
	                        </div>
	                        
	                        <div class="padding"></div>
	
	                        <div class="sresult">
	                            <div onclick="sresultpopup(this);" style="cursor: pointer;">
	                                <strong>EPS&nbsp;</strong><span></span>&nbsp;&nbsp;
									<div class="popuptext" id="sresultPopup1"><p></p></div>
	                            </div>
	                            <div onclick="sresultpopup(this);" style="cursor: pointer;">
	                                <strong>BPS&nbsp;</strong><span></span>&nbsp;&nbsp;
	                                <div class="popuptext" id="sresultPopup2"><p></p></div>
	                            </div>
	                            <div>
	                                <strong>PER&nbsp;</strong><span></span>&nbsp;&nbsp;
	                            </div>
	                            <div>
	                                <strong>업종&nbsp;</strong><span></span>&nbsp;&nbsp;
	                            </div>
	                            <div>
<!-- 	                                <strong>PBR&nbsp;</strong><span></span>&nbsp;&nbsp; -->
	                            </div>
	                            <div onclick="sresultpopup(this);" style="cursor: pointer;">
	                                <strong>배당수익률&nbsp;</strong><span></span>&nbsp;&nbsp;
	                                <div class="popuptext" id="sresultPopup3"><p></p><p></p></div>
	                            </div>
	                            <div>
	                                <p>&nbsp;&nbsp;&nbsp;12월 결산</p>
	                            </div>
	                        </div>
	                        <div class="padding"></div>
	
	                        <div class="stabmenu10">
	                                <ul class="tabmenu">
	                                  <li><a class="tabmenu"><strong>선차트</strong></a></li>
	                                  <li><a href="javascript:sTabmenu10('tb10_1', 'content_1');" id="tb10_1" class="tabmenu active">1일</a></li>
	                                  <li><a href="javascript:sTabmenu10('tb10_2', 'content_2');" id="tb10_2" class="tabmenu">일주일</a></li>
	                                  <li><a href="javascript:sTabmenu10('tb10_3', 'content_3');" id="tb10_3" class="tabmenu">3개월</a></li>
	                                  <li><a href="javascript:sTabmenu10('tb10_4', 'content_4');" id="tb10_4" class="tabmenu">1년</a></li>
	                                  <li><a href="javascript:sTabmenu10('tb10_5', 'content_5');" id="tb10_5" class="tabmenu">3년</a></li>
	                                  <li><a href="javascript:sTabmenu10('tb10_6', 'content_6');" id="tb10_6" class="tabmenu">5년</a></li>
	                                  <li><a href="javascript:sTabmenu10('tb10_7', 'content_7');" id="tb10_7" class="tabmenu">10년</a></li>
	                                  <li><a class="tabmenu"><strong>봉차트</strong></a></li>
	                                  <li><a href="javascript:sTabmenu10('tb10_8', 'content_8');" id="tb10_8" class="tabmenu">1봉</a></li>
	                                  <li><a href="javascript:sTabmenu10('tb10_9', 'content_9');" id="tb10_9" class="tabmenu">주봉</a></li>
	                                  <li><a href="javascript:sTabmenu10('tb10_10', 'content_10');" id="tb10_10" class="tabmenu">월봉</a></li>
	                                </ul>
	                                
	                                <div id="content_1" class="tabcontent"> 
	                                  <div class="tabcontent_content">
	                                      <img style="width:100%;">
	                                  </div>
	                                </div> 
	                                <div id="content_2" class="tabcontent" style="display:none;">
	                                  <div class="tabcontent_content2">
	                                      <img style="width:100%;">
	                                  </div>
	                                </div>
	                                <div id="content_3" class="tabcontent" style="display:none;">
	                                  <div class="tabcontent_content3">
	                                      <img style="width:100%;">
	                                  </div>
	                                </div>
	                                <div id="content_4" class="tabcontent" style="display:none;">
	                                  <div class="tabcontent_content4">
	                                      <img style="width:100%;">
	                                  </div>
	                                </div>
	                                <div id="content_5" class="tabcontent" style="display:none;">
	                                  <div class="tabcontent_content5">
	                                      <img style="width:100%;">
	                                  </div>
	                                </div>
	                                <div id="content_6" class="tabcontent" style="display:none;">
	                                    <div class="tabcontent_content6">
	                                        <img style="width:100%;">
	                                    </div>
	                                </div>
	                                <div id="content_7" class="tabcontent" style="display:none;">
	                                    <div class="tabcontent_content7">
	                                        <img style="width:100%;">
	                                    </div>
	                                </div>
	                                <div id="content_8" class="tabcontent" style="display:none;">
	                                    <div class="tabcontent_content8">
	                                        <img style="width:100%;">
	                                    </div>
	                                </div>
	                                <div id="content_9" class="tabcontent" style="display:none;">
	                                    <div class="tabcontent_content9">
	                                        <img style="width:100%;">
	                                    </div>
	                                </div>
	                                <div id="content_10" class="tabcontent" style="display:none;">
	                                    <div class="tabcontent_content10">
	                                        <img style="width:100%;">
	                                    </div>
	                                </div>
	                        </div>
	                        <div class="padding"></div>
	                        <div class="padding"></div>
	
	                        <div class="stabmenu3">
	                            <ul class="tab3menu">
	                                <li><a href="javascript:sTabmenu3('tb3_1','content3_1');" id="tb3_1" class="tab3menu active">종합정보</a></li>
	                                <li><a href="javascript:sTabmenu3('tb3_2','content3_2');" id="tb3_2" class="tab3menu">투자자별 매매동향</a></li>
	                                <li><a href="javascript:sTabmenu3('tb3_3','content3_3');" id="tb3_3" class="tab3menu">투자의견</a></li>
	                            </ul>
	                            <div id="content3_1" class="tab3content">
	                                <div class="firstLine">
	                                        <div class="lefttop">
	                                                <p style="font-size:1.25em;">기본정보</p>
	                                                <table>
	                                                    <tr>
	                                                        <td style="background-color: lightgrey; padding:5px;">업종</td>
	                                                        <td style="text-align: right;"></td>
	                                                    </tr>
	                                                    <tr>
	                                                        <td style="background-color: lightgrey; padding:5px;">본사주소</td>
	                                                        <td style="text-align: right;"></td>
	                                                    </tr>
	                                                    <tr>
	                                                        <td style="background-color: lightgrey; padding:5px;">홈페이지</td>
	                                                        <td style="text-align: right;"><a target="_blank"></a></td>
	                                                    </tr>
	                                                    <tr>
	                                                        <td style="background-color: lightgrey; padding:5px;">대표전화</td>
	                                                        <td style="text-align: right;"></td>
	                                                    </tr>
	                                                    <tr>
	                                                        <td style="background-color: lightgrey; padding:5px;">설립일</td>
	                                                        <td style="text-align: right;"></td>
	                                                    </tr>
	                                                    <tr>
	                                                        <td style="background-color: lightgrey; padding:5px;">대표이사</td>
	                                                        <td style="text-align: right;"></td>
	                                                    </tr>
	                                                    <tr>
	                                                        <td style="background-color: lightgrey; padding:5px;">계열</td>
	                                                        <td style="text-align: right;"></td>
	                                                    </tr>
	                                                    <tr>
	                                                        <td style="background-color: lightgrey; padding:5px;">종업원수</td>
	                                                        <td style="text-align: right;"></td>
	                                                    </tr>
	                                                    <tr>
	                                                        <td style="background-color: lightgrey; padding:5px;">주거래 은행</td>
	                                                        <td style="text-align: right;"></td>
	                                                    </tr>
	                                                </table>
	                                        </div>
	                                        <div class="righttop">
	                                            <p style="font-size:1.25em;">시세 및 주주현황</p>
	                                        <table>
	                                            <tr>
	                                                <td style="background-color: lightgrey; padding:5px;">주가/전일대비/수익률</td>
	                                                <td style="text-align: right;"><span style="font-weight:bold;"></span> / <span></span> / <span></span></td>
	                                                </tr>
	                                            <tr>
	                                                <td style="background-color: lightgrey; padding:5px;">52Weeks 최고/최저</td>
	                                                <td style="text-align: right;"></td>
	                                            </tr>
	                                            <tr>
	                                                <td style="background-color: lightgrey; padding:5px;">액면가</td>
	                                                <td style="text-align: right;"></td>
	                                            </tr>
	                                            <tr>
	                                                <td style="background-color: lightgrey; padding:5px;">거래량/거래대금</td>
	                                                <td style="text-align: right;"></td>
	                                            </tr>
	                                            <tr>
	                                                <td style="background-color: lightgrey; padding:5px;">시가총액</td>
	                                                <td style="text-align: right;"></td>
	                                            </tr>
	                                            <tr>
	                                                <td style="background-color: lightgrey; padding:5px;">52주베타</td>
	                                                <td style="text-align: right;"></td>
	                                            </tr>
	                                            <tr>
	                                                <td style="background-color: lightgrey; padding:5px;">발행주식수/유동비율</td>
	                                                <td style="text-align: right;"></td>
	                                            </tr>
	                                            <tr>
	                                                <td style="background-color: lightgrey; padding:5px;">외국인지분율</td>
	                                                <td style="text-align: right;"></td>
	                                            </tr>
	                                            <tr>
	                                                <td style="background-color: lightgrey; padding:5px;">수익률 (1M/3M/6M/1Y)</td>
	                                                <td style="text-align: right;"><span></span>/ <span></span>/ <span></span>/ <span></span></td>
	                                            </tr>
	                                        </table>
	                                        </div>
	                                    </div>
	                                    <div class="secondLine">
	                                        <div class="leftbottom">
	                                            <p style="font-size:1.25em;margin-bottom:10px;">증권뉴스</p>
	                                                <ul>
	                                                </ul>
	                                        </div>
	                                        <div class="rightbottom">
	                                            <p style="font-size:1.25em;margin-bottom:10px;">주식토론방</p>
	                                                <ul>
	                                                </ul>
	                                        </div>
	                                    </div>
	                                </div>
	                              <div id="content3_2" class="tab3content graphTab" style="display:none;text-align: center;">
	                                <div class="lefttop">
	                                    <div class="title">
	                                        <p style="font-size:1.25em;margin-bottom:10px;">외국인 매매동향</p>
	                                    </div>
	                                    <div class="tab" style="width:100%">
	                                        <ul class="tabmenu">
	                                            <li onclick="bgChangerforeignerTab1()" id="fbg1"><a href="javascript:foreignerTab('tb_1', 'contentforeigner_1');" id="tb_1" class="tabmenuforeignerTab active">1개월</a></li>
	                                            <li onclick="bgChangerforeignerTab2()" id="fbg2" class="greybgstart"><a href="javascript:foreignerTab('tb_2', 'contentforeigner_2');" id="tb_2" class="tabmenuforeignerTab">3개월</a></li>
	                                            <li onclick="bgChangerforeignerTab3()" id="fbg3" class="greybgstart"><a href="javascript:foreignerTab('tb_3', 'contentforeigner_3');" id="tb_3" class="tabmenuforeignerTab">6개월</a></li>
	                                            <li onclick="bgChangerforeignerTab4()" id="fbg4" class="greybgstart"><a href="javascript:foreignerTab('tb_4', 'contentforeigner_4');" id="tb_4" class="tabmenuforeignerTab">1년</a></li>
	                                    
	                                        </ul>
	                                        
	                                        <div id="contentforeigner_1" class="tabcontentforeignerTab"> 
	                                            <img style="width:100%;">
	                                        </div> 
	                                        <div id="contentforeigner_2" class="tabcontentforeignerTab" style="display:none;">
	                                            <img style="width:100%;">
	                                        </div>
	                                        <div id="contentforeigner_3" class="tabcontentforeignerTab" style="display:none;">
	                                            <img style="width:100%;">
	                                        </div>
	                                        <div id="contentforeigner_4" class="tabcontentforeignerTab" style="display:none;">
	                                            <img style="width:100%;">
	                                        </div>
	                                      </div>
	                                </div>
	                                <div class="righttop">
	                                    <div class="title">
	                                        <p style="font-size:1.25em;margin-bottom:10px;">기관 매매동향</p>
	                                    </div>
	                                    <div class="tab" style="width:100%">
	                                        <ul class="tabmenu">
	                                            <li onclick="bgChangerforeignCompanyTab1()" id="fcbg1"><a href="javascript:foreignCompanyTab('tb_1', 'contentforeignCompany_1');" id="tb_1" class="tabmenuforeignCompanyTab active">1개월</a></li>
	                                            <li onclick="bgChangerforeignCompanyTab2()" id="fcbg2" class="greybgstart"><a href="javascript:foreignCompanyTab('tb_2', 'contentforeignCompany_2');" id="tb_2" class="tabmenuforeignCompanyTab">3개월</a></li>
	                                            <li onclick="bgChangerforeignCompanyTab3()" id="fcbg3" class="greybgstart"><a href="javascript:foreignCompanyTab('tb_3', 'contentforeignCompany_3');" id="tb_3" class="tabmenuforeignCompanyTab">6개월</a></li>
	                                            <li onclick="bgChangerforeignCompanyTab4()" id="fcbg4" class="greybgstart"><a href="javascript:foreignCompanyTab('tb_4', 'contentforeignCompany_4');" id="tb_4" class="tabmenuforeignCompanyTab">1년</a></li>
	                                    
	                                        </ul>
	                                        
	                                        <div id="contentforeignCompany_1" class="tabcontentforeignCompanyTab"> 
	                                            <img style="width:100%;">
	                                        </div> 
	                                        <div id="contentforeignCompany_2" class="tabcontentforeignCompanyTab" style="display:none;">
	                                            <img style="width:100%;">
	                                        </div>
	                                        <div id="contentforeignCompany_3" class="tabcontentforeignCompanyTab" style="display:none;">
	                                            <img style="width:100%;">
	                                        </div>
	                                        <div id="contentforeignCompany_4" class="tabcontentforeignCompanyTab" style="display:none;">
	                                            <img style="width:100%;">
	                                        </div>
	                                      </div>
	                                </div>
	  
	                            </div>
	                              <div id="content3_3" class="tab3content" style="display:none;">
	                                <div class="title" style="display:flex; align-items: flex-end; justify-content: space-between;">
	                                    <p style="font-size:1.25em;">투자의견 컨센서스</p>
<!-- 	                                    <p style="font-size:0.75em;">[기준:2020.05.20]</p> -->
	                                </div>
	                                    <div class="firstLine">
	                                        <table>
	                                            <tr>
	                                                <td rowspan="2">
	                                                    <div style="width:314px; position:relative; margin:10px auto;">
	                                                        <span>▼</span> 
	                                                        <span>
	                                                            <img src="${pageContext.request.contextPath }/UI/img/graph_bar.gif" alt="" style="width:100%;">
	                                                        </span>
	                                                    </div>
	                                                </td>
	                                                <td style="background-color: #fee7e8;">투자의견</td>
	                                                <td style="background-color: #fee7e8;">목표주가(원)</td>
	                                                <td style="background-color: #fee7e8;">EPS(원)</td>
	                                                <td style="background-color: #fee7e8;">PER(배)</td>
	                                                <td style="background-color: #fee7e8;">추정기관수</td>
	                                            </tr>
	                                            <tr>
	                                                <td style="color: red;">최근 3개월 이내에 제시된 의견이 없습니다.</td>
	                                                <td></td>
	                                                <td></td>
	                                                <td></td>
	                                                <td></td>
	                                            </tr>
	                                        </table>
	                                    </div>
	                                    <div class="secondLine">
	                                        <table>
	                                            <tr>
	                                                <td style="background-color:#fee7e8;">제공처</td>
	                                                <td style="background-color:#fee7e8;">최종일자</td>
	                                                <td style="background-color:#fee7e8;">목표가</td>
	                                                <td style="background-color:#fee7e8;">직전목표가</td>
	                                                <td style="background-color:#fee7e8;">변동률(%)</td>
	                                                <td style="background-color:#fee7e8;">투자의견</td>
	                                                <td style="background-color:#fee7e8;">직전투자의견</td>
	                                            </tr>
	                                            <tr>
	                                                <td></td>
	                                                <td></td>
	                                                <td></td>
	                                                <td></td>
	                                                <td></td>
	                                                <td>최근 3개월 이내에 제시된 의견이 없습니다.</td>
	                                                <td></td>
	                                            </tr>
	                                            <tr>
	                                                <td></td>
	                                                <td></td>
	                                                <td></td>
	                                                <td></td>
	                                                <td></td>
	                                                <td></td>
	                                                <td></td>
	                                            </tr>
	                                            <tr>
	                                                <td></td>
	                                                <td></td>
	                                                <td></td>
	                                                <td></td>
	                                                <td></td>
	                                                <td></td>
	                                                <td></td>
	                                            </tr>
	                                        </table>
	                                    </div>
	                              </div>
	                        </div>
	                    </div>
	                </div>
	            
	            </content>
	        </div>
	
	        
	    </div>
<!-- 	</div> -->
</body>
</html>