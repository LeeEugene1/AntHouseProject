package kr.or.redant.vo;
//일별 시세 테이블
public class DailyPriceVO {
	private String stock_item_code;	//종목코드
	private String close;			//종가
	private String open;			//시가
	private String high;			//고가
	private String low;				//저가
	private String diff;			//전일비
	private String fluctuation;		//등락율
	private String rr;				//수익률
	private String marcket_cap;		//시가총액
	private String bs_date;			//날짜
	private String volume;			//거래량
	private String oct;				//기관 순 매매량
	private String fct;				//외국인 순 매매량
	
	public String getStock_item_code() {
		return stock_item_code;
	}
	public void setStock_item_code(String stock_item_code) {
		this.stock_item_code = stock_item_code;
	}
	public String getClose() {
		return close;
	}
	public void setClose(String close) {
		this.close = close;
	}
	public String getOpen() {
		return open;
	}
	public void setOpen(String open) {
		this.open = open;
	}
	public String getHigh() {
		return high;
	}
	public void setHigh(String high) {
		this.high = high;
	}
	public String getLow() {
		return low;
	}
	public void setLow(String low) {
		this.low = low;
	}
	public String getDiff() {
		return diff;
	}
	public void setDiff(String diff) {
		this.diff = diff;
	}
	public String getFluctuation() {
		return fluctuation;
	}
	public void setFluctuation(String fluctuation) {
		this.fluctuation = fluctuation;
	}
	public String getRr() {
		return rr;
	}
	public void setRr(String rr) {
		this.rr = rr;
	}
	public String getMarcket_cap() {
		return marcket_cap;
	}
	public void setMarcket_cap(String marcket_cap) {
		this.marcket_cap = marcket_cap;
	}
	public String getBs_date() {
		return bs_date;
	}
	public void setBs_date(String bs_date) {
		this.bs_date = bs_date;
	}
	public String getVolume() {
		return volume;
	}
	public void setVolume(String volume) {
		this.volume = volume;
	}
	public String getOct() {
		return oct;
	}
	public void setOct(String oct) {
		this.oct = oct;
	}
	public String getFct() {
		return fct;
	}
	public void setFct(String fct) {
		this.fct = fct;
	}
	
	
}
