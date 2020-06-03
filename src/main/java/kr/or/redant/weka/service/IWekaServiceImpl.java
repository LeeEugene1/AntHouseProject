package kr.or.redant.weka.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.redant.daishin.dao.IDaishinDao;
import kr.or.redant.vo.BusinessDayVO;
import kr.or.redant.vo.DailyPriceVO;
import kr.or.redant.vo.MemberVO;
import kr.or.redant.vo.StockItemVO;
import kr.or.redant.weka.dao.IWekaDao;

@Service
public class IWekaServiceImpl implements IWekaService {
	
	@Autowired
	private IWekaDao dao;
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
    @Override
    public List<DailyPriceVO> wekaList(Map<String, String> params) throws Exception{
       List<DailyPriceVO> wekaList = null;
       wekaList = dao.wekaList(params);
      
       return wekaList;
    }

}