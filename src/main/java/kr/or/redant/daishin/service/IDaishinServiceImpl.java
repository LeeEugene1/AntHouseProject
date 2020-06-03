package kr.or.redant.daishin.service;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.redant.daishin.dao.IDaishinDao;
import kr.or.redant.vo.BusinessDayVO;
import kr.or.redant.vo.DailyPriceVO;
import kr.or.redant.vo.StockItemVO;

@Service
public class IDaishinServiceImpl implements IDaishinService {
	
	@Autowired
	private IDaishinDao dao;
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public void daishinInsert(DailyPriceVO DaishinInfo) throws SQLException{
		this.dao.daishinInsert(DaishinInfo);
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public void daishinInsertCode(StockItemVO DaishinInfo) throws SQLException{
		this.dao.daishinInsertCode(DaishinInfo);
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public void insertDayCode(BusinessDayVO DaishinInfo) throws SQLException{
		this.dao.insertDayCode(DaishinInfo);
	}

}