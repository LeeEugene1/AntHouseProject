<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/UI/css/jqcloud.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath }/UI/js/jqcloud-1.0.4.js"></script>
    <script type="text/javascript">
    $(function() {
    	function crawling(){
		$.ajax({
			type : 'post',
			url : '${pageContext.request.contextPath}/crawler/cloud.do',
			dataType : 'json',
			error : function(result){
				console.log(result);
			},
			success:function(result){
		    	var wordWeight = 100;
		    	var temp = 1;
		    	var word_array = new Array();
				$(result.cloudList).each(function(i,data){
					word_array.push({text: data.stockName, weight: wordWeight, link:'${pageContext.request.contextPath }/stockInfo/stockDetail.do?code='+data.stockCode});
					temp = temp*0.96;
					wordWeight = wordWeight-temp;
				});
				
				$("#div_cloud").empty();
		        $("#div_cloud").jQCloud(word_array,{
		        	autoResize: true
		        });
			}
		});// ajax==>
		}// crawlig ==>
	
		startInterval(crawling);
      });
    </script>
  </head>
  <body>
  	<div class="wrap">
  		<div class="headerSubandContent">
		    <div id="div_cloud" style="max-height: 800px; width: 1097px; height: 800px; "></div>
  		</div>
  	</div>
  </body>
</html>