<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	#leftMenu h2 {margin-top: 0px;margin-bottom: 20px;}
	#leftMenu a{border-bottom: 1px solid lightgrey;margin-bottom: 10px; color:gray;display:block;padding-bottom: 5px;font-size: 1.1rem; transition:all 0.5s ease;}
	#leftMenu .active {color:var(--background-color);border-color:var(--background-color);}
</style>
<script type="text/javascript">
	$(function(){
		var url_1 = window.location.href.split("/")[4];
		var url_2 = window.location.href.split("/")[5].split(".")[0];
		
		if(url_1 == "stockInfo" || url_1 == "cloud" || url_1 == "stockLecture"){
			$("#leftMenu h2").text("주식정보");
			$("#leftMenu div").append("<a href='${pageContext.request.contextPath }/stockInfo/stockMain.do'>국내증시</a>");
			$("#leftMenu div").append("<a href='${pageContext.request.contextPath }/cloud/cloudList.do'>인기 검색 종목</a>");
			$("#leftMenu div").append("<a href='${pageContext.request.contextPath }/stockInfo/newsList.do'>주요 증권뉴스</a>");
			$("#leftMenu div").append("<a href='${pageContext.request.contextPath }/stockLecture/stockLectureList.do'>주식강좌</a>");
			
			if(url_2 == "forumView" || url_2 == "stockDetail" || url_2 == "stockMain"){
				$("#leftMenu div a:eq(0)").addClass("active");
			}
			if(url_2 == "cloudList"){
				$("#leftMenu div a:eq(1)").addClass("active");	
			}
			if(url_2 == "newsList" || url_2 == "newsView"){
				$("#leftMenu div a:eq(2)").addClass("active");	
			}
			if(url_2 == "stockLectureList" || url_2 == "stockLectureForm" || url_2 == "stockLectureView" || url_2 == "stockLectureViewUpdate"){
				$("#leftMenu div a:eq(3)").addClass("active");
			}
		}
		
		if(url_1 == "noticeboard" || url_1 == "qnaboard" || url_1 == "faqboard" || url_1 == "stockForum" || url_1 == "freeboard"){
			$("#leftMenu h2").text("커뮤니티");
			$("#leftMenu div").append("<a href='${pageContext.request.contextPath }/noticeboard/noticeboardList.do'>공지사항</a>");
			$("#leftMenu div").append("<a href='${pageContext.request.contextPath }/qnaboard/qnaboardList.do'>QnA</a>");
			$("#leftMenu div").append("<a href='${pageContext.request.contextPath }/faqboard/faqboardList.do'>자주하는 질문</a>");
			$("#leftMenu div").append("<a href='${pageContext.request.contextPath }/stockForum/stockForumList.do'>주식토론방</a>");
			$("#leftMenu div").append("<a href='${pageContext.request.contextPath }/freeboard/freeboardList.do'>자유게시판</a>");
			
			if(url_2 == "noticeboardForm" || url_2 == "noticeboardList" || url_2 == "noticeboardView" || url_2 == "noticeboardViewUpdate"){
				$("#leftMenu div a:eq(0)").addClass("active");
			}
			if(url_2 == "qnaboardForm" || url_2 == "qnaboardList" || url_2 == "qnaboardView" || url_2 == "qnaboardViewUpdate" || url_2 == "qnaboardReplyForm"){
				$("#leftMenu div a:eq(1)").addClass("active");	
			}
			if(url_2 == "faqboardForm" || url_2 == "faqboardList" || url_2 == "faqboardViewUpdate"){
				$("#leftMenu div a:eq(2)").addClass("active");	
			}
			if(url_2 == "stockForumForm" || url_2 == "stockForumList" || url_2 == "stockForumView" || url_2 == "stockForumViewUpdate" || url_2 == "stockForumReplyForm"){
				$("#leftMenu div a:eq(3)").addClass("active");	
			}
			if(url_2 == "freeboardForm" || url_2 == "freeboardList" || url_2 == "freeboardView" || url_2 == "freeboardViewUpdate" || url_2 == "freeboardReplyForm"){
				$("#leftMenu div a:eq(4)").addClass("active");
			}
		}
		
		if(url_1 == "stockPortfolio" || url_1 == "stockStat" || url_1 == "strategy"){
			$("#leftMenu h2").text("주식전략");
			$("#leftMenu div").append("<a href='${pageContext.request.contextPath }/strategy/investmentStrategy.do'>투자기초</a>");
			$("#leftMenu div").append("<a href='${pageContext.request.contextPath }/stockPortfolio/stockPortfolioList.do'>포트폴리오</a>");
			$("#leftMenu div").append("<a href='${pageContext.request.contextPath }/stockStat/statMake.do'>주식스텟전략</a>");
			$("#leftMenu div").append("<a href='${pageContext.request.contextPath }/strategy/strategySimulator.do'>전략시뮬레이터</a>");
			
			if(url_2 == "investmentStrategy"){
				$("#leftMenu div a:eq(0)").addClass("active");	
			}
			if(url_2 == "PFSForm" || url_2 == "portfolioForm" || url_2 == "portfolioInsertForm" || url_2 == "portfolioViewUpdate" || url_2 == "stockPortfolioList"){
				$("#leftMenu div a:eq(1)").addClass("active");	
			}
			if(url_2 == "statMake" || url_2 == "statList"){
				$("#leftMenu div a:eq(2)").addClass("active");
			}
			if(url_2 == "strategySimulator"){
				$("#leftMenu div a:eq(3)").addClass("active");	
			}
			
		}
		
	})
</script>
</head>
<body>
	<div class="content_left">
		<div id="leftMenu">
            <h2></h2>
            <div>
            </div>
		</div>
       </div>
</body>
</html>