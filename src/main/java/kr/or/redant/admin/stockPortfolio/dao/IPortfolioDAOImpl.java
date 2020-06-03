package kr.or.redant.admin.stockPortfolio.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.redant.vo.FAQboardVO;
import kr.or.redant.vo.PortfolioVO;
@Repository
public class IPortfolioDAOImpl implements IPortfolioDAO {

	@Autowired
	private SqlMapClient client;
	

	@Override
	public PortfolioVO portfolioInfo(Map<String, String> params) throws Exception {
		PortfolioVO portfolioInfo = null;
		try {
			client.startTransaction();
			portfolioInfo = (PortfolioVO) client.queryForObject("portfolio.portfolioInfo",params);
			client.commitTransaction();
		}finally{
			client.endTransaction();
		}
		return portfolioInfo;
	}

	@Override
	public List<PortfolioVO> portfolioList(Map<String, String> params)
			throws Exception {
		return client.queryForList("portfolio.portfolioList", params);
	}


	@Override
	public String insertPortfolioInfo(PortfolioVO portfolioInfo) throws Exception {
		return (String) client.insert("portfolio.insertPortfolio",portfolioInfo);
	}
	
	@Override
	public void updatePortfolioInfo(PortfolioVO faqboardInfo) throws Exception {
		client.update("portfolio.updatePortfolio", faqboardInfo);
	}

	@Override
	public void deletePortfolioInfo(Map<String, String> params) throws Exception {
		client.update("portfolio.deletePortfolio", params);
	}





}
