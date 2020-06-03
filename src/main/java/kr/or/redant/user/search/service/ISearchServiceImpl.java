package kr.or.redant.user.search.service;

import java.util.List;
import java.util.Map;

import kr.or.redant.user.search.dao.ISearchDao;
import kr.or.redant.vo.FreeboardVO;
import kr.or.redant.vo.StockItemVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;



@Service
public class ISearchServiceImpl implements ISearchService {
	@Autowired
	   private ISearchDao searchDAO;
	
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
    @Override
    public String totalCount(Map<String, String> params) throws Exception{
       String totalCount = "0";
       totalCount = searchDAO.totalCount(params);
       return totalCount;
    }
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
    @Override
    public List<StockItemVO> stockItemList(Map<String, String> params) throws Exception{
       List<StockItemVO> stockItemList = null;
       stockItemList = searchDAO.stockItemList(params);
       return stockItemList;
    }
}