<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="wrap">
        <div class="headerSubandContent">
           <content>
                <div class="wrap2">
                <c:forEach items="${faqboardList }" var="faqboardInfo">
                	<input type="hidden" name="faq_no" value= "${faqboardInfo.faq_no }" />
                    <button class="accordion"><p>Q. ${faqboardInfo.faq_title}.</p><img src="${pageContext.request.contextPath }/UI/img/arrow.png" id="arrowbtn" alt=""></button>
                    <div class="panel">
	                    <p>A. ${faqboardInfo.faq_content} 
	                    <div class="submitBtn">
							<input id="${faqboardInfo.faq_no }" class="btn-simple" type="button" name="updateView" value="수정"> 
							<input id="${faqboardInfo.faq_no }" class="btn-simple" name="deleteBtn" type="button" value="삭제">
						</div>
                    </div>
                </c:forEach> 

                    <!-- page_navi start -->
                    <!-- <div class="page_navi">
                        <a href="#" class="prev"><span>이전</span></a>
                        <span>
                            <strong>1</strong>
                            <a href="#">2</a>
                            <a href="#">3</a>
                            <a href="#">4</a>
                            <a href="#">5</a>
                            <a href="#">6</a>
                        </span>                    
                        <a href="#" class="next"><span>다음</span></a>
                    </div> -->
                    <!-- page_navi end -->
                    ${paginationHtmls }
                     <div class="writeBtn" id="insertBtn">
                         <input class="btn-simple" type="submit" name="" value="글쓰기"> 
                     </div>
                    
                </div>
            
            </content>
        </div>

        
    </div>
    <script>
    $(function(){
    	$('#insertBtn').click(function(){
    		if('${LOGIN_ADMININFO}'!=""){
    			location.href = '${pageContext.request.contextPath}/faqboard/faqboardForm.do';
    		}else{
    			alert("관리자 권한입니다.");
    		}
    		
    	});
    	
    	$('input[name=deleteBtn]').click(function(){
    		var faq_no = this.getAttribute("id");
    		location.href='${pageContext.request.contextPath}/faqboard/deleteFAQboard.do?faq_no='+ faq_no;
    	});
    	
    	$('input[name=updateView]').click(function(){
    		var faq_no = this.getAttribute("id");
    		location.href='${pageContext.request.contextPath}/faqboard/faqboardViewUpdate.do?faq_no='+ faq_no;
    	});
    	
    	if('${LOGIN_ADMININFO}'==""){
            $('input[name=updateView]').hide();
            $('input[name=deleteBtn]').hide();
            $('#insertBtn').hide();
            
        } else {
            $('input[name=updateView]').show();
            $('input[name=deleteBtn]').show();
            $('#insertBtn').show();
        }
    });
        var acc = document.getElementsByClassName("accordion");
   		var i;
   		for (i = 0; i < acc.length; i++) {
      		acc[i].addEventListener("click", function() {
	         	this.classList.toggle("active");
	         	var panel = this.nextElementSibling;
				
	         	if (panel.style.display === "block") {
	         		panel.style.display = "none";
	            // arr.style.transform = 'rotate(360deg)';
	         	} else {
	         		panel.style.display = "block";
	            // panel.style.transform = 'transform 1s linear';
	         	}
      		});
    	var arr = document.getElementById("arrowbtn");
   		}
    </script>
</body>
</html>