<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;900&display=swap" rel="stylesheet">
<!-- summernote -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote-lite.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/UI/css/anthouse.css">
<script src="${pageContext.request.contextPath }/UI/js/anthouse.js"></script>
<script>
  $(document).ready(function(){
     $(".hamburgerIcon").click(function(){
      $(".menuResponsive").slideToggle();
    });

    $(window).resize(function(){
      if($(window).width()>900){
        $(".menuResponsive").hide();
      }
    });
  });
</script>
</head>
<body>
 <div class="container-top">
        <header id="main-header">
           <!-- 비회원 -->
           <c:if test="${empty LOGIN_MEMBERINFO }">
                <c:if test="${empty LOGIN_ADMININFO }">
                   <div class="menu">
                  <ul class="menuOriginal">
                     <li class="dropdown"><a href="${pageContext.request.contextPath }/strategy/investmentStrategy.do" class="dropbtn"><span>주식전략</span></a>
                        <div class="dropdown-content">
                           <a href="${pageContext.request.contextPath }/strategy/investmentStrategy.do"><p>투자기초</p></a>
                           <a href="${pageContext.request.contextPath }/stockPortfolio/stockPortfolioList.do"><p>포트폴리오</p></a>
                           <a href="${pageContext.request.contextPath }/stockStat/statMake.do"><p>주식스텟전략</p></a>
                           <a href="${pageContext.request.contextPath }/strategy/strategySimulator.do"><p>전략시뮬레이터</p></a>
                        </div>
                     </li>
                     <li class="dropdown"><a href="${pageContext.request.contextPath }/noticeboard/noticeboardList.do" class="dropbtn"><span>커뮤니티</span></a>
                        <div class="dropdown-content">
                           <a href="${pageContext.request.contextPath }/noticeboard/noticeboardList.do"><p>공지사항</p></a>
                           <a href="${pageContext.request.contextPath }/qnaboard/qnaboardList.do"><p>QnA</p></a>
                           <a href="${pageContext.request.contextPath }/faqboard/faqboardList.do"><p>자주하는질문</p></a>
                           <a href="${pageContext.request.contextPath }/stockForum/stockForumList.do"><p>주식토론방</p></a>
                           <a href="${pageContext.request.contextPath }/freeboard/freeboardList.do"><p>자유게시판</p></a>
                        </div>
                     </li>
                     <li class="dropdown"><a href="${pageContext.request.contextPath}/stockInfo/stockMain.do" class="dropbtn"><span>주식정보</span></a>
                        <div class="dropdown-content">
                           <a href="${pageContext.request.contextPath}/stockInfo/stockMain.do"><p>국내증시</p></a>
                           <a href="${pageContext.request.contextPath }/cloud/cloudList.do"><p>인기 검색 종목</p></a>
                           <a href="${pageContext.request.contextPath }/stockInfo/newsList.do"><p>주요 증권뉴스</p></a>
                           <a href="${pageContext.request.contextPath }/stockLecture/stockLectureList.do"><p>주식강좌</p></a>
                        </div>
                     </li>
                     <li class="dropdown"><a href="${pageContext.request.contextPath }/MockInvestment/start.do" class="dropbtn"><span>모의주식</span></a>
                     </li>
                  </ul>
               </div>
                </c:if>
            </c:if>
            <!-- 회원 -->
           <c:if test="${!empty LOGIN_MEMBERINFO }">
            <c:if test="${empty LOGIN_ADMININFO }">
               <div class="menu">
<!--                   일반메뉴 -->
                  <ul class="menuOriginal">
                     <li class="dropdown"><a href="${pageContext.request.contextPath }/strategy/investmentStrategy.do" class="dropbtn"><span>주식전략</span></a>
                        <div class="dropdown-content">
                           <a href="${pageContext.request.contextPath }/strategy/investmentStrategy.do"><p>투자기초</p></a>
                           <a href="${pageContext.request.contextPath }/stockPortfolio/stockPortfolioList.do"><p>포트폴리오</p></a>
                           <a href="${pageContext.request.contextPath }/stockStat/statMake.do"><p>주식스텟전략</p></a>
                           <a href="${pageContext.request.contextPath }/strategy/strategySimulator.do"><p>전략시뮬레이터</p></a>
                        </div>
                     </li>
                     <li class="dropdown"><a href="${pageContext.request.contextPath }/noticeboard/noticeboardList.do" class="dropbtn"><span>커뮤니티</span></a>
                        <div class="dropdown-content">
                           <a href="${pageContext.request.contextPath }/noticeboard/noticeboardList.do"><p>공지사항</p></a>
                           <a href="${pageContext.request.contextPath }/qnaboard/qnaboardList.do"><p>QnA</p></a>
                           <a href="${pageContext.request.contextPath }/faqboard/faqboardList.do"><p>자주하는질문</p></a>
                           <a href="${pageContext.request.contextPath }/stockForum/stockForumList.do"><p>주식토론방</p></a>
                           <a href="${pageContext.request.contextPath }/freeboard/freeboardList.do"><p>자유게시판</p></a>
                        </div>
                     </li>
                     <li class="dropdown"><a href="${pageContext.request.contextPath}/stockInfo/stockMain.do" class="dropbtn"><span>주식정보</span></a>
                        <div class="dropdown-content">
                           <a href="${pageContext.request.contextPath}/stockInfo/stockMain.do"><p>국내증시</p></a>
                           <a href="${pageContext.request.contextPath }/cloud/cloudList.do"><p>인기 검색 종목</p></a>
                           <a href="${pageContext.request.contextPath }/stockInfo/newsList.do"><p>주요 증권뉴스</p></a>
                           <a href="${pageContext.request.contextPath }/stockLecture/stockLectureList.do"><p>주식강좌</p></a>
                        </div>
                     </li>
                     <li class="dropdown"><a href="${pageContext.request.contextPath }/MockInvestment/start.do" class="dropbtn"><span>모의주식</span></a>
                     </li>
                  </ul>
               </div>
            </c:if>
         </c:if>
         <!-- 관리자 -->
         <c:if test="${!empty LOGIN_ADMININFO }">
            <c:if test="${empty LOGIN_MEMBERINFO }">
               <div class="menu">
                  <ul class="menuOriginal">
                     <li class="dropdown"><a href="${pageContext.request.contextPath }/strategy/investmentStrategy.do" class="dropbtnAdmin"><span>주식전략</span></a>
                        <div class="dropdown-content dropdown-content2">
                           <a href="${pageContext.request.contextPath }/strategy/investmentStrategy.do"><p>투자기초</p></a>
                           <a href="${pageContext.request.contextPath }/stockPortfolio/stockPortfolioList.do"><p>포트폴리오</p></a>
                           <a href="${pageContext.request.contextPath }/stockStat/statMake.do"><p>주식스텟전략</p></a>
                           <a href="${pageContext.request.contextPath }/strategy/strategySimulator.do"><p>전략시뮬레이터</p></a>
                        </div>
                     </li>
                     <li class="dropdown"><a href="${pageContext.request.contextPath }/noticeboard/noticeboardList.do" class="dropbtnAdmin"><span>커뮤니티</span></a>
                        <div class="dropdown-content dropdown-content2">
                           <a href="${pageContext.request.contextPath }/noticeboard/noticeboardList.do"><p>공지사항</p></a>
                           <a href="${pageContext.request.contextPath }/qnaboard/qnaboardList.do"><p>QnA</p></a>
                           <a href="${pageContext.request.contextPath }/faqboard/faqboardList.do"><p>자주하는질문</p></a>
                           <a href="${pageContext.request.contextPath }/stockForum/stockForumList.do"><p>주식토론방</p></a>
                           <a href="${pageContext.request.contextPath }/freeboard/freeboardList.do"><p>자유게시판</p></a>
                        </div>
                     </li>
                     <li class="dropdown"><a href="${pageContext.request.contextPath}/stockInfo/stockMain.do" class="dropbtnAdmin"><span>주식정보</span></a>
                        <div class="dropdown-content dropdown-content2">
                           <a href="${pageContext.request.contextPath}/stockInfo/stockMain.do"><p>국내증시</p></a>
                           <a href="${pageContext.request.contextPath }/cloud/cloudList.do"><p>인기 검색 종목</p></a>
                           <a href="${pageContext.request.contextPath }/stockInfo/newsList.do"><p>주요 증권뉴스</p></a>
                           <a href="${pageContext.request.contextPath }/stockLecture/stockLectureList.do"><p>주식강좌</p></a>
                        </div>
                     </li>
                     <li class="dropdown"><a href="${pageContext.request.contextPath }/MockInvestment/start.do" class="dropbtnAdmin"><span>모의주식</span></a>
                     </li>
                     <li class="dropdown"><a href="${pageContext.request.contextPath }/admin/userManagement.do" class="dropbtnAdmin"><span>회원관리</span></a>
                     </li>
                  </ul>
               </div>
            </c:if>
         </c:if>
         
            <div class="logo">
                <a href="${pageContext.request.contextPath }/main.do"><img src="${pageContext.request.contextPath }/UI/img/logo-red.png" alt="logo"></a>
            </div>
            <div class="icons">
               <div class="iconleft">
               
<!--       반응형비회원 -->
         <c:if test="${empty LOGIN_MEMBERINFO }">
            <c:if test="${empty LOGIN_ADMININFO }">
               <div class="hamburgerIcon"><img src="${pageContext.request.contextPath }/UI/img/hamburger.png" alt=""></div>
                   <ul class="menuResponsive">
                     <li class="dropdown"><span style="color:black;">주식전략</span>
                       <div style="margin-bottom:10px;">
                         <a href="${pageContext.request.contextPath }/strategy/investmentStrategy.do"><p>투자기초</p></a>
                         <a href="${pageContext.request.contextPath }/stockPortfolio/stockPortfolioList.do"><p>포트폴리오</p></a>
                         <a href="${pageContext.request.contextPath }/stockStat/statMake.do"><p>주식스텟전략</p></a>
                         <a href="${pageContext.request.contextPath }/strategy/strategySimulator.do"><p>전략시뮬레이터</p></a>
                       </div>
                     </li>
                     <li class="dropdown"><span style="color:black;">커뮤니티</span>
                       <div style="margin-bottom:10px;">
                         <a href="${pageContext.request.contextPath }/noticeboard/noticeboardList.do"><p>공지사항</p></a>
                         <a href="${pageContext.request.contextPath }/qnaboard/qnaboardList.do"><p>QnA</p></a>
                         <a href="${pageContext.request.contextPath }/faqboard/faqboardList.do"><p>자주찾는질문</p></a>
                         <a href="${pageContext.request.contextPath }/stockForum/stockForumList.do"><p>주식토론방</p></a>
                         <a href="${pageContext.request.contextPath }/freeboard/freeboardList.do"><p>자유게시판</p></a>
                       </div>
                     </li>
                     <li class="dropdown"><span style="color:black;">주식정보</span>
                       <div style="margin-bottom:10px;">
                         <a href="#"><p>국내증시</p></a>
                         <a href="${pageContext.request.contextPath }/cloud/cloudList.do"><p>인기 검색 종목</p></a>
                         <a href="${pageContext.request.contextPath }/stockInfo/newsList.do"><p>주요 증권뉴스</p></a>
                         <a href="${pageContext.request.contextPath }/stockLecture/stockLectureList.do"><p>주식강좌</p></a>
                       </div>
                     </li>
                     <li class="dropdown"><a href="${pageContext.request.contextPath }/MockInvestment/start.do"><span style="color:black;">모의주식</span></a>
         
                     </li>
                   </ul>
            </c:if>
         </c:if>
<!--       반응형회원 -->
         <c:if test="${!empty LOGIN_MEMBERINFO }">
            <c:if test="${empty LOGIN_ADMININFO }">
               <div class="hamburgerIcon"><img src="${pageContext.request.contextPath }/UI/img/hamburger.png" alt=""></div>
                   <ul class="menuResponsive">
                     <li class="dropdown"><span style="color:black;">주식전략</span>
                       <div style="margin-bottom:10px;">
                         <a href="${pageContext.request.contextPath }/strategy/investmentStrategy.do"><p>투자기초</p></a>
                         <a href="${pageContext.request.contextPath }/stockPortfolio/stockPortfolioList.do"><p>포트폴리오</p></a>
                         <a href="${pageContext.request.contextPath }/stockStat/statMake.do"><p>주식스텟전략</p></a>
                         <a href="${pageContext.request.contextPath }/strategy/strategySimulator.do"><p>전략시뮬레이터</p></a>
                       </div>
                     </li>
                     <li class="dropdown"><span style="color:black;">커뮤니티</span>
                       <div style="margin-bottom:10px;">
                         <a href="${pageContext.request.contextPath }/noticeboard/noticeboardList.do"><p>공지사항</p></a>
                         <a href="${pageContext.request.contextPath }/qnaboard/qnaboardList.do"><p>QnA</p></a>
                         <a href="${pageContext.request.contextPath }/faqboard/faqboardList.do"><p>자주찾는질문</p></a>
                         <a href="${pageContext.request.contextPath }/stockForum/stockForumList.do"><p>주식토론방</p></a>
                         <a href="${pageContext.request.contextPath }/freeboard/freeboardList.do"><p>자유게시판</p></a>
                       </div>
                     </li>
                     <li class="dropdown"><span style="color:black;">주식정보</span>
                       <div style="margin-bottom:10px;">
                         <a href="#"><p>국내증시</p></a>
                         <a href="${pageContext.request.contextPath }/cloud/cloudList.do"><p>인기 검색 종목</p></a>
                         <a href="${pageContext.request.contextPath }/stockInfo/newsList.do"><p>주요 증권뉴스</p></a>
                         <a href="${pageContext.request.contextPath }/stockLecture/stockLectureList.do"><p>주식강좌</p></a>
                       </div>
                     </li>
                     <li class="dropdown"><a href="${pageContext.request.contextPath }/MockInvestment/start.do"><span style="color:black;">모의주식</span></a>
         
                     </li>
                   </ul>
            </c:if>
         </c:if>
<!--       반응형관리자 -->
         <c:if test="${!empty LOGIN_ADMININFO }">
            <c:if test="${empty LOGIN_MEMBERINFO }">
               <div class="hamburgerIcon"><img src="${pageContext.request.contextPath }/UI/img/hamburger-white.png" alt=""></div>
                   <ul class="menuResponsive">
                     <li class="dropdown"><span style="color:white;">주식전략</span>
                       <div style="margin-bottom:10px;">
                         <a href="${pageContext.request.contextPath }/strategy/investmentStrategy.do"><p>투자기초</p></a>
                         <a href="${pageContext.request.contextPath }/stockPortfolio/stockPortfolioList.do"><p>포트폴리오</p></a>
                         <a href="${pageContext.request.contextPath }/stockStat/statMake.do"><p>주식스텟전략</p></a>
                         <a href="${pageContext.request.contextPath }/strategy/strategySimulator.do"><p>전략시뮬레이터</p></a>
                       </div>
                     </li>
                     <li class="dropdown"><span style="color:white;">커뮤니티</span>
                       <div style="margin-bottom:10px;">
                         <a href="${pageContext.request.contextPath }/noticeboard/noticeboardList.do"><p>공지사항</p></a>
                         <a href="${pageContext.request.contextPath }/qnaboard/qnaboardList.do"><p>QnA</p></a>
                         <a href="${pageContext.request.contextPath }/faqboard/faqboardList.do"><p>자주찾는질문</p></a>
                         <a href="${pageContext.request.contextPath }/stockForum/stockForumList.do"><p>주식토론방</p></a>
                         <a href="${pageContext.request.contextPath }/freeboard/freeboardList.do"><p>자유게시판</p></a>
                       </div>
                     </li>
                     <li class="dropdown"><span style="color:white;">주식정보</span>
                       <div style="margin-bottom:10px;">
                         <a href="#"><p>국내증시</p></a>
                         <a href="${pageContext.request.contextPath }/cloud/cloudList.do"><p>인기 검색 종목</p></a>
                         <a href="${pageContext.request.contextPath }/stockInfo/newsList.do"><p>주요 증권뉴스</p></a>
                         <a href="${pageContext.request.contextPath }/stockLecture/stockLectureList.do"><p>주식강좌</p></a>
                       </div>
                     </li>
                     <li class="dropdown"><a href="${pageContext.request.contextPath }/MockInvestment/start.do"><span style="color:white;">모의주식</span></a>
         
                     </li>
                   </ul>
            </c:if>
         </c:if>

               
               
<!--                iconleft end -->
               </div>
               
               <div class="iconright">
                  <c:if test="${!empty LOGIN_MEMBERINFO }">
                      <div class="radio">
	                       <a id="radioA">
	                           <img id="radioBtn1" src="${pageContext.request.contextPath }/UI/img/radio-off-bk.png" alt="radio">
	                       </a>
                           <img id="radioBtn2" style="display:none;" src="${pageContext.request.contextPath }/UI/img/radio-on-bk.png" alt="radio">
                       </div>
                   </c:if>
                   <div class="dropdown">
                       <img src="${pageContext.request.contextPath }/UI/img/mypage-bk.png" alt="mypage">
                       <c:if test="${!empty LOGIN_MEMBERINFO }">
                          <c:if test="${empty LOGIN_ADMININFO }">
                             <div class="dropdown-content">
                                 <a href="${pageContext.request.contextPath }/member/memberView.do"><p>마이페이지</p></a>
                                 <a href="${pageContext.request.contextPath }/login/logout.do"><p>로그아웃</p></a>

                             </div>
                          </c:if>
                       </c:if>
                       <c:if test="${!empty LOGIN_ADMININFO }">
                          <c:if test="${empty LOGIN_MEMBERINFO }">
                             <div class="dropdown-content" style="top:45px;">
                           <!-- <a href="#"><p>[관리자]</p></a> -->
                                 <a href="${pageContext.request.contextPath }/login/logout.do"><p>로그아웃</p></a>
                             
                             </div>
                          </c:if>
                       </c:if>
                       <c:if test="${empty LOGIN_MEMBERINFO }">
                          <c:if test="${empty LOGIN_ADMININFO }">
                             <div class="dropdown-content">
                                 <a href="${pageContext.request.contextPath }/login/login.do"><p>로그인</p></a>
                                 <a href="${pageContext.request.contextPath }/join/joinCheck.do"><p>회원가입</p></a>
                             </div>
                          </c:if>
                       </c:if>
                   </div>
                   <div class="search" id="search"><img src="${pageContext.request.contextPath }/UI/img/search-bk.png" alt="search"></div>
               </div>
            </div>
            
         <!--         
         <div class="hamburger"><img src="img/hamburger.png" alt="hamburgerIcon"></div> 

            <div class="logo"><img src="img/logo.png" alt="mainlogo"></div>
            <div class="icons">
                <div class="radio"><img src="img/radio.png" alt="radioIcon"></div>
                <div class="mypage"><img src="img/mypage.png" alt="mypageIcon"></div>
            </div> 
            -->
            
            
        </header>
    </div>

    <script src="${pageContext.request.contextPath }/UI/js/bottomJS.js"></script>
    <script type="text/javascript">
   //          관리자 로그인 시 header 색 변경    
          var main = document.getElementById('main-header');
          var drop = document.getElementsByClassName('dropdown-content');
          if('${LOGIN_ADMININFO.admin_id}' == 'admin' ){
             $('.logo img').attr("src",'${pageContext.request.contextPath }/UI/img/logo.png');
             $('.dropdown img').attr("src",'${pageContext.request.contextPath }/UI/img/mypage.png');
             $('.search img').attr("src", '${pageContext.request.contextPath}/UI/img/search.png');
             main.id = "admin-content";
             for(i=0;i<drop.length;i++){
                drop[i].id="admin-content";
             }
          }
//           console.log('${RADIO_INFO}')

   $(function(){
	   var new_popup;
	   
      $('#search').click(function(){
         location.href='${pageContext.request.contextPath}/search/searchList.do';
      });
      
      $('#radioBtn1').click(function() {
 	      $('#radioBtn1').attr("style","display:none;");
 	      $('#radioBtn2').attr("style","display:inline;");
 	      new_popup = window.open('${pageContext.request.contextPath }/member/radioPopup.do','_blank', 'width=550, height=500,top=250,left=700, scrollbars=no');
       });
       
       $('#radioBtn2').click(function() {
 	      $('#radioBtn1').attr("style","display:inline;");
 	      $('#radioBtn2').attr("style","display:none;");
 	      if(new_popup != undefined){
 	    	  new_popup.close();
 	      }
       }); 
   });
    </script>
</body>
</html>