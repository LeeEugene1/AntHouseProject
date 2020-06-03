package kr.or.redant.admin.stockPortfolio.service;

import java.util.List;
import java.util.Map;



import kr.or.redant.qualifer.service.IService;
import kr.or.redant.vo.PortfolioVO;

public interface IPortfolioService extends IService{
	public PortfolioVO portfolioInfo(Map<String, String> params) throws Exception;
	public List<PortfolioVO> portfolioList(Map<String, String> params) throws Exception;
	public void insertPortfolioInfo(PortfolioVO portfolioInfo) throws Exception;
	public void updatePortfolioInfo(PortfolioVO portfolioInfo) throws Exception;
	public void deletePortfolioInfo(Map<String, String> params) throws Exception;
}
