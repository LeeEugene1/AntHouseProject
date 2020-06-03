package kr.or.redant.vo;
//이벤트 테이블
public class EventVO {
	private String event_id;			//이벤트 아이디
	private String event_keyword;		//키워드
	private String event_start_date;	//발생일
	private String event_end_date;		//종료일
	private String event_count;			//횟수
	private String event_rate;			//이벤트 등급
	
	public String getEvent_id() {
		return event_id;
	}
	public void setEvent_id(String event_id) {
		this.event_id = event_id;
	}
	public String getEvent_keyword() {
		return event_keyword;
	}
	public void setEvent_keyword(String event_keyword) {
		this.event_keyword = event_keyword;
	}
	public String getEvent_start_date() {
		return event_start_date;
	}
	public void setEvent_start_date(String event_start_date) {
		this.event_start_date = event_start_date;
	}
	public String getEvent_end_date() {
		return event_end_date;
	}
	public void setEvent_end_date(String event_end_date) {
		this.event_end_date = event_end_date;
	}
	public String getEvent_count() {
		return event_count;
	}
	public void setEvent_count(String event_count) {
		this.event_count = event_count;
	}
	public String getEvent_rate() {
		return event_rate;
	}
	public void setEvent_rate(String event_rate) {
		this.event_rate = event_rate;
	}
	
	
}
