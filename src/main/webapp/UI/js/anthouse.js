// 크롤링 타이머
function startInterval(callback){
	callback();
	return setInterval(callback, 10000);
}

// 우편번호찾기
	    function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("sample6_extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("sample6_extraAddress").value = '';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("sample6_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
	    }

	  //tab메뉴 인기종목
	  function rudrSwitchTab(rudr_tab_id, rudr_tab_content) {
	  	// first of all we get all tab content blocks (I think the best way to get them by class names)
//	  	var x = document.getElementsByClassName("tabcontent");
	  	var y = document.getElementsByClassName("rightTabcontent");
	  	var i;
//	  	for (i = 0; i < x.length; i++) {
//	  		x[i].style.display = 'none'; // hide all tab content
//	  	}
	  	
	  	for (i = 0; i < y.length; i++) {
	  		y[i].style.display = 'none'; // hide all tab content
	  	}
	  	
	  	document.getElementById(rudr_tab_content).style.display = 'block'; // display the content of the tab we need
	  	
	  	
	  	//border-right:1px solid #F70F3C

	  	// now we get all tab menu items by class names (use the next code only if you need to highlight current tab)
//	  	var x = document.getElementsByClassName("tabmenu");
	  	var x = document.getElementsByClassName("rightTabmenu");
	  	var i;
	  	for (i = 0; i < x.length; i++) {
	  		x[i].className = 'rightTabmenu'; 
	  	}
	  	document.getElementById(rudr_tab_id).className = 'rightTabmenu active';
	  }
	  
	  function bgChanger1(){
	  	var element = document.getElementById('bg1');
	  	var element2 = document.getElementById('bg2');
	  	element.classList.remove('greybgstart');
	  	element.classList.add('greybg1');
	  	element2.classList.remove('greybg2');
	  	// document.getElementById('bg2').style='none';
	    }
	    function bgChanger2(){
	  	var element2 = document.getElementById('bg2');
	  	var element = document.getElementById('bg1');
	  	element.classList.remove('greybgstart');
	  	element2.classList.add('greybg2');
	  	element.classList.remove('greybg1');
	  	// document.getElementById('bg1').style='none';
	    }

	  //tabmenu_kospi
	  function kospiTab(rudr_tab_id, rudr_tab_content) {
	  	// first of all we get all tab content blocks (I think the best way to get them by class names)
	  	var x = document.getElementsByClassName("tabcontent_kospi");
	  	var i;
	  	for (i = 0; i < x.length; i++) {
	  		x[i].style.display = 'none'; // hide all tab content
	  	}
	  	document.getElementById(rudr_tab_content).style.display = 'block'; // display the content of the tab we need

	  	// now we get all tab menu items by class names (use the next code only if you need to highlight current tab)
	  	var x = document.getElementsByClassName("tabmenu_kospi");
	  	var i;
	  	for (i = 0; i < x.length; i++) {
	  		x[i].className = 'tabmenu_kospi'; 
	  	}
	  	document.getElementById(rudr_tab_id).className = 'tabmenu_kospi active';
	  }
	  function bgChangerKospi(){
		   var bgkospi = document.getElementById('bgkospi');
		   var bgkosdaq = document.getElementById('bgkosdaq');
		   var bgkospi200 = document.getElementById('bgkospi200');
		   bgkospi.classList.remove('greybgstart');
		   bgkosdaq.classList.add('greybg1');
		   bgkospi200.classList.add('greybg2');
		}
		function bgChangerKosdaq(){
		   var bgkospi = document.getElementById('bgkospi');
		   var bgkosdaq = document.getElementById('bgkosdaq');
		   var bgkospi200 = document.getElementById('bgkospi200');
		   bgkosdaq.classList.remove('greybgstart');
		   bgkospi.classList.add('greybg1');
		   bgkospi200.classList.add('greybg2');
		}
		function bgChangerKospi200(){
		   var bgkospi = document.getElementById('bgkospi');
		   var bgkosdaq = document.getElementById('bgkosdaq');
		   var bgkospi200 = document.getElementById('bgkospi200');
		   bgkospi200.classList.remove('greybgstart');
		   bgkospi.classList.add('greybg1');
		   bgkosdaq.classList.add('greybg2');
		}

	  //tabmenu 거래상위 시가총액상위
	  function rudrSwitchTab2(rudr_tab_id2, rudr_tab_content2) {
	  	// first of all we get all tab content blocks (I think the best way to get them by class names)
	  	var x = document.getElementsByClassName("tabcontent_transactionTop");
	  	var i;
	  	for (i = 0; i < x.length; i++) {
	  		x[i].style.display = 'none'; // hide all tab content
	  	}
	  	document.getElementById(rudr_tab_content2).style.display = 'block'; // display the content of the tab we need
	  	//border-right:1px solid #F70F3C

	  	// now we get all tab menu items by class names (use the next code only if you need to highlight current tab)
	  	var x = document.getElementsByClassName("tabmenu_transactionTop");
	  	var i;
	  	for (i = 0; i < x.length; i++) {
	  		x[i].className = 'tabmenu_transactionTop'; 
	  	}
	  	document.getElementById(rudr_tab_id2).className = 'tabmenu_transactionTop active';
	  }
	  function bgChanger3(){
	  	var element = document.getElementById('bg3');
	  	var element2 = document.getElementById('bg4');
	  	element.classList.remove('greybgstart');
	  	element.classList.add('greybg1');
	  	element2.classList.remove('greybg2');
	  	// document.getElementById('bg2').style='none';
	  }
	    function bgChanger4(){
	  	var element2 = document.getElementById('bg4');
	  	var element = document.getElementById('bg3');
	  	element.classList.remove('greybgstart');
	  	element2.classList.add('greybg2');
	  	element.classList.remove('greybg1');
	  	// document.getElementById('bg1').style='none';
	  }

	  //tabmenu 거래상위 시가총액상위
	  function rudrSwitchTab3(rudr_tab_id3, rudr_tab_content3) {
	  	// first of all we get all tab content blocks (I think the best way to get them by class names)
	  	var x = document.getElementsByClassName("tabcontent_priceTop");
	  	var i;
	  	for (i = 0; i < x.length; i++) {
	  		x[i].style.display = 'none'; // hide all tab content
	  	}
	  	document.getElementById(rudr_tab_content3).style.display = 'block'; // display the content of the tab we need
	  	//border-right:1px solid #F70F3C

	  	// now we get all tab menu items by class names (use the next code only if you need to highlight current tab)
	  	var x = document.getElementsByClassName("tabmenu_priceTop");
	  	var i;
	  	for (i = 0; i < x.length; i++) {
	  		x[i].className = 'tabmenu_priceTop'; 
	  	}
	  	document.getElementById(rudr_tab_id3).className = 'tabmenu_priceTop active';
	  }
	  function bgChanger5(){
	  	var element = document.getElementById('bg5');
	  	var element2 = document.getElementById('bg6');
	  	element.classList.remove('greybgstart');
	  	element.classList.add('greybg1');
	  	element2.classList.remove('greybg2');
	  	// document.getElementById('bg2').style='none';
	  }
	    function bgChanger6(){
	  	var element2 = document.getElementById('bg6');
	  	var element = document.getElementById('bg5');
	  	element.classList.remove('greybgstart');
	  	element2.classList.add('greybg2');
	  	element.classList.remove('greybg1');
	  	// document.getElementById('bg1').style='none';
	  }
	    
//---------------------------------------------주식정보----------------------------------------------------//
	  //stabmenu10
	    function sTabmenu10(rudr_tab_id, rudr_tab_content) {
	       // first of all we get all tab content blocks (I think the best way to get them by class names)
	       var x = document.getElementsByClassName("tabcontent");
	       var i;
	       for (i = 0; i < x.length; i++) {
	          x[i].style.display = 'none'; // hide all tab content
	       }
	       document.getElementById(rudr_tab_content).style.display = 'block'; // display the content of the tab we need
	       //border-right:1px solid #F70F3C

	       // now we get all tab menu items by class names (use the next code only if you need to highlight current tab)
	       var x = document.getElementsByClassName("tabmenu");
	       var i;
	       for (i = 0; i < x.length; i++) {
	          x[i].className = 'tabmenu'; 
	       }
	       document.getElementById(rudr_tab_id).className = 'tabmenu active';
	    }

	    function sTabmenu3(tid,tcontent){
	       var x = document.getElementsByClassName('tab3content');
	       var i;
	       for(i=0; i<x.length; i++){
	          x[i].style.display = 'none'; //hide all tab content
	       }
	       document.getElementById(tcontent).style.display='block'; 
	       //display the content of the tab we need 

	       var x = document.getElementsByClassName("tab3menu");
	       var i;
	       for(i=0; i<x.length; i++){
	          x[i].className = 'tab3menu';
	       }
	       document.getElementById(tid).className = 'tab3menu active';

	    }

	    //foreignerTab
	    function foreignerTab(rudr_tab_id, rudr_tab_content) {
	       // first of all we get all tab content blocks (I think the best way to get them by class names)
	       var x = document.getElementsByClassName("tabcontentforeignerTab");
	       var i;
	       for (i = 0; i < x.length; i++) {
	          x[i].style.display = 'none'; // hide all tab content
	       }
	       document.getElementById(rudr_tab_content).style.display = 'block'; // display the content of the tab we need
	       //border-right:1px solid #F70F3C

	       // now we get all tab menu items by class names (use the next code only if you need to highlight current tab)
	       var x = document.getElementsByClassName("tabmenuforeignerTab");
	       var i;
	       for (i = 0; i < x.length; i++) {
	          x[i].className = 'tabmenuforeignerTab'; 
	       }
	       document.getElementById(rudr_tab_id).className = 'tabmenuforeignerTab active';
	    }
	    function bgChangerforeignerTab1(){
	       var element = document.getElementById('fbg1');
	       var element2 = document.getElementById('fbg2');
	       var element3 = document.getElementById('fbg3');
	       var element4 = document.getElementById('fbg4');
	       element2.classList.remove('greybgstart');
	       element.classList.remove('greybg1');
	       element2.classList.add('greybg2');
	       element3.classList.add('greybg3');
	       element4.classList.add('greybg4');
	       // document.getElementById('bg2').style='none';
	      }
	      function bgChangerforeignerTab2(){
	       var element2 = document.getElementById('fbg2');
	       var element = document.getElementById('fbg1');
	       var element3 = document.getElementById('fbg3');
	       var element4 = document.getElementById('fbg4');
	       element2.classList.remove('greybgstart');
	       element2.classList.remove('greybg2');
	       element.classList.add('greybg1');
	       element3.classList.add('greybg3');
	       element4.classList.add('greybg4');   // document.getElementById('bg1').style='none';
	      }
	      function bgChangerforeignerTab3(){
	       var element2 = document.getElementById('fbg2');
	       var element = document.getElementById('fbg1');
	       var element3 = document.getElementById('fbg3');
	       var element4 = document.getElementById('fbg4');

	       element3.classList.remove('greybgstart');
	       element3.classList.remove('greybg3');
	       element.classList.add('greybg1');
	       element2.classList.add('greybg2');
	       element4.classList.add('greybg4');

	       // document.getElementById('bg1').style='none';
	      }
	      function bgChangerforeignerTab4(){
	       var element2 = document.getElementById('fbg2');
	       var element = document.getElementById('fbg1');
	       var element3 = document.getElementById('fbg3');
	       var element4 = document.getElementById('fbg4');

	       element4.classList.remove('greybgstart');
	       element4.classList.remove('greybg4');
	       element.classList.add('greybg1');
	       element2.classList.add('greybg2');
	       element3.classList.add('greybg3');
	       // document.getElementById('bg1').style='none';
	      }

	      //foreignCompanyTab
	    function foreignCompanyTab(rudr_tab_id, rudr_tab_content) {
	       // first of all we get all tab content blocks (I think the best way to get them by class names)
	       var x = document.getElementsByClassName("tabcontentforeignCompanyTab");
	       var i;
	       for (i = 0; i < x.length; i++) {
	          x[i].style.display = 'none'; // hide all tab content
	       }
	       document.getElementById(rudr_tab_content).style.display = 'block'; // display the content of the tab we need
	       //border-right:1px solid #F70F3C

	       // now we get all tab menu items by class names (use the next code only if you need to highlight current tab)
	       var x = document.getElementsByClassName("tabmenuforeignCompanyTab");
	       var i;
	       for (i = 0; i < x.length; i++) {
	          x[i].className = 'tabmenuforeignCompanyTab'; 
	       }
	       document.getElementById(rudr_tab_id).className = 'tabmenuforeignCompanyTab active';
	    }
	    function bgChangerforeignCompanyTab1(){
	       var element2 = document.getElementById('fcbg2');
	       var element = document.getElementById('fcbg1');
	       var element3 = document.getElementById('fcbg3');
	       var element4 = document.getElementById('fcbg4');
	       element2.classList.remove('greybgstart');
	       element.classList.remove('greybg1');
	       element2.classList.add('greybg2');
	       element3.classList.add('greybg3');
	       element4.classList.add('greybg4');
	       // document.getElementById('bg2').style='none';
	      }
	      function bgChangerforeignCompanyTab2(){
	       var element2 = document.getElementById('fcbg2');
	       var element = document.getElementById('fcbg1');
	       var element3 = document.getElementById('fcbg3');
	       var element4 = document.getElementById('fcbg4');
	       element2.classList.remove('greybgstart');
	       element2.classList.remove('greybg2');
	       element.classList.add('greybg1');
	       element3.classList.add('greybg3');
	       element4.classList.add('greybg4');   // document.getElementById('bg1').style='none';
	      }
	      function bgChangerforeignCompanyTab3(){
	       var element2 = document.getElementById('fcbg2');
	       var element = document.getElementById('fcbg1');
	       var element3 = document.getElementById('fcbg3');
	       var element4 = document.getElementById('fcbg4');

	       element3.classList.remove('greybgstart');
	       element3.classList.remove('greybg3');
	       element.classList.add('greybg1');
	       element2.classList.add('greybg2');
	       element4.classList.add('greybg4');

	       // document.getElementById('bg1').style='none';
	      }
	      function bgChangerforeignCompanyTab4(){
	       var element2 = document.getElementById('fcbg2');
	       var element = document.getElementById('fcbg1');
	       var element3 = document.getElementById('fcbg3');
	       var element4 = document.getElementById('fcbg4');

	       element4.classList.remove('greybgstart');
	       element4.classList.remove('greybg4');
	       element.classList.add('greybg1');
	       element2.classList.add('greybg2');
	       element3.classList.add('greybg3');
	       // document.getElementById('bg1').style='none';
	      }	   