package kr.or.redant.user.stockStats.dao;

import java.util.List;
import java.util.Map;

import kr.or.redant.vo.StockStatsVO;

public interface IStockStatsDAO {
	public List<StockStatsVO> marcketStockStatsList(Map<String, String> params) throws Exception;
	public List<StockStatsVO> volumeStockStatsList(Map<String, String> params) throws Exception;
	public List<StockStatsVO> momStockStatsList(Map<String, String> params) throws Exception;
}
