package kr.or.redant.user.search.dao;

import java.util.List;
import java.util.Map;





import kr.or.redant.vo.StockItemVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class ISearchDaoImpl implements ISearchDao {
	
	@Autowired
	private SqlMapClient client; 
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public String totalCount(Map<String, String> params) throws Exception {
		return (String) client.queryForObject("stockItem.totalCount",params);
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public List<StockItemVO> stockItemList(Map<String, String> params) throws Exception {
		return client.queryForList("stockItem.stockItemList", params);
	}
	
}
