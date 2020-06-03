package kr.or.redant.admin.stockPortfolio.dao;

import java.util.List;
import java.util.Map;

import kr.or.redant.vo.PortfolioVO;

public interface IPortfolioDAO {
	public PortfolioVO portfolioInfo(Map<String, String> params) throws Exception;
	public List<PortfolioVO> portfolioList(Map<String, String> params) throws Exception;
	public String insertPortfolioInfo(PortfolioVO portfolioInfo) throws Exception;
	public void updatePortfolioInfo(PortfolioVO portfolioInfo) throws Exception;
	public void deletePortfolioInfo(Map<String, String> params) throws Exception;
}
