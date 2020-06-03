package kr.or.redant.vo;
//포트폴리오 지표
public class PortfolioIndexVO {
	private String portfolio_code;		//포트폴리오 코드
	private String initial_date;		//초기날짜
	private String last_date;			//마지막날짜
	private String annualized_return;	//연평균 수익률
	private String volatility;			//변동성
	private String winning_rate;		//승률
	private String mdd;					//최대손실폭
	
	public String getPortfolio_code() {
		return portfolio_code;
	}
	public void setPortfolio_code(String portfolio_code) {
		this.portfolio_code = portfolio_code;
	}
	public String getInitial_date() {
		return initial_date;
	}
	public void setInitial_date(String initial_date) {
		this.initial_date = initial_date;
	}
	public String getLast_date() {
		return last_date;
	}
	public void setLast_date(String last_date) {
		this.last_date = last_date;
	}
	public String getAnnualized_return() {
		return annualized_return;
	}
	public void setAnnualized_return(String annualized_return) {
		this.annualized_return = annualized_return;
	}
	public String getVolatility() {
		return volatility;
	}
	public void setVolatility(String volatility) {
		this.volatility = volatility;
	}
	public String getWinning_rate() {
		return winning_rate;
	}
	public void setWinning_rate(String winning_rate) {
		this.winning_rate = winning_rate;
	}
	public String getMdd() {
		return mdd;
	}
	public void setMdd(String mdd) {
		this.mdd = mdd;
	}
	
	
}
