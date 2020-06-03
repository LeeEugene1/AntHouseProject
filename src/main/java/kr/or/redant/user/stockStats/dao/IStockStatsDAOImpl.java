package kr.or.redant.user.stockStats.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.redant.vo.StockStatsVO;

@Repository
public class IStockStatsDAOImpl implements IStockStatsDAO {

	@Autowired
	private SqlMapClient client;

	@Override
	public List<StockStatsVO> marcketStockStatsList(Map<String, String> params) throws Exception {
		return client.queryForList("stockStats.marcketStockStatsList", params);
	}
	
	@Override
	public List<StockStatsVO> volumeStockStatsList(Map<String, String> params) throws Exception {
		return client.queryForList("stockStats.volumeStockStatsList", params);
	}
	
	@Override
	public List<StockStatsVO> momStockStatsList(Map<String, String> params) throws Exception {
		return client.queryForList("stockStats.momStockStatsList", params);
	}

}
