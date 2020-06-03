/**
 * 클라이언트 입력값 검증
   정규표현식 패턴 정의 : http://ryanswanson.com/regexp/#start
 */
//	/^[a-z][0-9]{3}$/
//"a001".validationID();
String.prototype.validationID = function(){
	//this == "a001"
	return /^[a-z0-9]{3,8}$/.test(this);
};
String.prototype.validationPWD = function(){
	return /^[a-z0-9]{4,8}$/.test(this);
}; //안맞으면 false return

String.prototype.validationNM = function(){
	return /^[가-힣]{2,5}$/.test(this);
};
String.prototype.validationCN = function(){
	return /^[가-힣]{2,10}$/.test(this);
};

String.prototype.validationHP = function(){
	return /^01[0-8]-\d{3,4}-\d{4}$/.test(this);
};

String.prototype.validationBIR = function(){
	return /^(19[0-9][0-9]|20\d{2})-(0[1-9]|1[0-2])-((0[1-9]|1[1-2][0-9]|2[0-9])|3[0-1])\s(0\d|1\d|2[0-3]]):([0-5]\d):([0-5]\d)$/.test(this);
};

String.prototype.validationMAIL = function(){
	return /^[a-z0-9]{3,8}@[a-z]+(\.[a-z]+){1,2}$/.test(this);
};
String.prototype.validationZIP = function(){
	return /^\d{3}-\d{3}$/.test(this);
};

String.prototype.validationREGNO = function(){
	// 
	var moto = this.replace('-', '');
	var magicNum = moto.substr(12, 1);
	var checkSum = '234567892345';
	var sum = 0;
	
	for(var i = 0; i<12; i++){
		sum += moto.charAt(i) * checkSum.charAt(i);
	}
	
	var finalval = (11-(sum%11))%10;
	if(finalval == parseInt(magicNum)){
		return true;
	}else{
		return false;
	};
};