package kr.or.redant.user.search.dao;

import java.util.List;
import java.util.Map;

import kr.or.redant.vo.StockItemVO;


public interface ISearchDao {
	public String totalCount(Map<String, String> params) throws Exception;
	public List<StockItemVO> stockItemList(Map<String, String> params) throws Exception;
}
