package kr.or.redant.vo;
// 스탯 리스트 저장용
public class StockStatsVO {
	private String stats_rnum;			//rnum
	private String stock_item_code;		//주식코드
	private String marcket_cap;		//시가총액
	private String volume;			//거래량
	private String mom;			//모멘텀
	private String rank;		//랭크
	private String stock_item_name;		//주식명
	
	public String getStock_item_name() {
		return stock_item_name;
	}
	public void setStock_item_name(String stock_item_name) {
		this.stock_item_name = stock_item_name;
	}
	public String getMom() {
		return mom;
	}
	public void setMom(String mom) {
		this.mom = mom;
	}
	public String getStats_rnum() {
		return stats_rnum;
	}
	public void setStats_rnum(String stats_rnum) {
		this.stats_rnum = stats_rnum;
	}
	public String getVolume() {
		return volume;
	}
	public void setVolume(String volume) {
		this.volume = volume;
	}
	public String getStock_item_code() {
		return stock_item_code;
	}
	public void setStock_item_code(String stock_item_code) {
		this.stock_item_code = stock_item_code;
	}
	public String getMarcket_cap() {
		return marcket_cap;
	}
	public void setMarcket_cap(String marcket_cap) {
		this.marcket_cap = marcket_cap;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	
}
