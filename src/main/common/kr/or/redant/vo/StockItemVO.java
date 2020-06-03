package kr.or.redant.vo;
//종목테이블
public class StockItemVO {
	private String stock_item_code;	//종목코드
	private String stock_item_name;	//종목이름
	private String thema_code;		//테마코드
	private String stock_Item_rnum;
	
	public String getStock_Item_rnum() {
		return stock_Item_rnum;
	}
	public void setStock_Item_rnum(String stock_Item_rnum) {
		this.stock_Item_rnum = stock_Item_rnum;
	}
	public String getStock_item_code() {
		return stock_item_code;
	}
	public void setStock_item_code(String stock_item_code) {
		this.stock_item_code = stock_item_code;
	}
	public String getStock_item_name() {
		return stock_item_name;
	}
	public void setStock_item_name(String stock_item_name) {
		this.stock_item_name = stock_item_name;
	}
	public String getThema_code() {
		return thema_code;
	}
	public void setThema_code(String thema_code) {
		this.thema_code = thema_code;
	}
	
	
}
