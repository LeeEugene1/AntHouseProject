package kr.or.redant.utiles;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.sun.org.apache.bcel.internal.generic.SIPUSH;

// TimeStamp : 년,월,일,시,분,초,플랫(밀리세컨즈)
//             플랫 : default 6자리(최대 9자리 표현 가능)
public class TimeSteampToStringConvert {
	public static String convert(Object target){
		Date date = new Date(((Timestamp)target).getTime());
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd");
		return dateFormat.format(date);
	}
}
