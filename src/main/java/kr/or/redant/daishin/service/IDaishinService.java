package kr.or.redant.daishin.service;

import java.sql.SQLException;

import kr.or.redant.qualifer.service.IService;
import kr.or.redant.vo.BusinessDayVO;
import kr.or.redant.vo.DailyPriceVO;
import kr.or.redant.vo.StockItemVO;

public interface IDaishinService extends IService{
	public void daishinInsert(DailyPriceVO DaishinInfo) throws SQLException;
	public void daishinInsertCode(StockItemVO DaishinInfo) throws SQLException;
	public void insertDayCode(BusinessDayVO DaishinInfo) throws SQLException;
}
