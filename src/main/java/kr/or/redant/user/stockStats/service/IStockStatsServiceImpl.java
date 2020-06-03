package kr.or.redant.user.stockStats.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.redant.user.stockStats.dao.IStockStatsDAO;
import kr.or.redant.vo.StockStatsVO;

@Service
public class IStockStatsServiceImpl implements IStockStatsService {
	@Autowired
	private IStockStatsDAO stockStatsDAO;
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public List<StockStatsVO> marcketStockStatsList(Map<String, String> params) throws Exception{
		List<StockStatsVO> stockStatsList = null;
		stockStatsList = stockStatsDAO.marcketStockStatsList(params);
		return stockStatsList;
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public List<StockStatsVO> volumeStockStatsList(Map<String, String> params) throws Exception{
		List<StockStatsVO> stockStatsList = null;
		stockStatsList = stockStatsDAO.volumeStockStatsList(params);
		return stockStatsList;
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public List<StockStatsVO> momStockStatsList(Map<String, String> params) throws Exception{
		List<StockStatsVO> stockStatsList = null;
		stockStatsList = stockStatsDAO.momStockStatsList(params);
		return stockStatsList;
	}

}
