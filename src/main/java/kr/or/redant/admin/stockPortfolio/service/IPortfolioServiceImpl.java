package kr.or.redant.admin.stockPortfolio.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.redant.admin.stockPortfolio.dao.IPortfolioDAO;
import kr.or.redant.vo.PortfolioVO;

@Service
public class IPortfolioServiceImpl implements IPortfolioService {
	@Autowired
	private IPortfolioDAO portfolioDAO;
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public PortfolioVO portfolioInfo(Map<String, String> params) throws Exception {
		PortfolioVO portfolioInfo = null;
		portfolioInfo = portfolioDAO.portfolioInfo(params);
		return portfolioInfo;
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public List<PortfolioVO> portfolioList(Map<String, String> params)
			throws Exception {
		List<PortfolioVO> portfolioList = null;
		portfolioList = portfolioDAO.portfolioList(params);
		return portfolioList;
	}


	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public void updatePortfolioInfo(PortfolioVO portfolioInfo) throws Exception {
		portfolioDAO.updatePortfolioInfo(portfolioInfo);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public void deletePortfolioInfo(Map<String, String> params) throws Exception {
		portfolioDAO.deletePortfolioInfo(params);
	}

	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public void insertPortfolioInfo(PortfolioVO portfolioInfo) throws Exception {
		String portfolio_code = portfolioDAO.insertPortfolioInfo(portfolioInfo);
	}



}
