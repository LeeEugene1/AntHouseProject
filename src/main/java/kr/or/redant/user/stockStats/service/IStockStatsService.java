package kr.or.redant.user.stockStats.service;

import java.util.List;
import java.util.Map;

import kr.or.redant.qualifer.service.IService;
import kr.or.redant.vo.StockStatsVO;

public interface IStockStatsService extends IService{
	public List<StockStatsVO> marcketStockStatsList(Map<String, String> params) throws Exception;
	public List<StockStatsVO> volumeStockStatsList(Map<String, String> params) throws Exception;
	public List<StockStatsVO> momStockStatsList(Map<String, String> params) throws Exception;
}
