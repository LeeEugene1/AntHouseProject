package kr.or.redant.vo;
//관심 종목
public class InterestItemVO {
	private String isi_code;		//관심종목 아이디
	private String mem_id;			//회원아이디
	private String stock_item_code;	//종목코드
	private String stock_item_name; //종목이름
	
	public String getStock_item_name() {
		return stock_item_name;
	}
	public void setStock_item_name(String stock_item_name) {
		this.stock_item_name = stock_item_name;
	}
	public String getIsi_code() {
		return isi_code;
	}
	public void setIsi_code(String isi_code) {
		this.isi_code = isi_code;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getStock_item_code() {
		return stock_item_code;
	}
	public void setStock_item_code(String stock_item_code) {
		this.stock_item_code = stock_item_code;
	}
	public void setStock_item_code2(String stock_item_code) {
		this.stock_item_code = stock_item_code;
	}
	
	
}
