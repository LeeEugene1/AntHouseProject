package kr.or.redant.vo;
//이벤트 가공 데이터
public class EventDataVO {
	private String event_id;		//이벤트 아이디
	private String stock_item_code;	//종목코드
	
	public String getEvent_id() {
		return event_id;
	}
	public void setEvent_id(String event_id) {
		this.event_id = event_id;
	}
	public String getStock_item_code() {
		return stock_item_code;
	}
	public void setStock_item_code(String stock_item_code) {
		this.stock_item_code = stock_item_code;
	}
	
	
}
