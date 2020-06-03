package kr.or.redant.user.search.service;


import java.util.List;
import java.util.Map;

import kr.or.redant.qualifer.service.IService;
import kr.or.redant.vo.StockItemVO;



public interface ISearchService extends IService{
	public String totalCount(Map<String, String> params) throws Exception;
	public List<StockItemVO> stockItemList(Map<String, String> params) throws Exception;
	
}
