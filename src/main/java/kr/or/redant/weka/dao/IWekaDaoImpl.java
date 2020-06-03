package kr.or.redant.weka.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.redant.vo.BusinessDayVO;
import kr.or.redant.vo.DailyPriceVO;
import kr.or.redant.vo.StockItemVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IWekaDaoImpl implements IWekaDao {
	
	@Autowired
	private SqlMapClient client;

	@Override
	public List<DailyPriceVO> wekaList(Map<String, String> params)
			throws Exception {
		return client.queryForList("weka.wekaList", params);
	}
	
	
	
}
