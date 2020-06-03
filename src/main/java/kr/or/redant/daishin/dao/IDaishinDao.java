package kr.or.redant.daishin.dao;

import java.sql.SQLException;

import kr.or.redant.vo.BusinessDayVO;
import kr.or.redant.vo.DailyPriceVO;
import kr.or.redant.vo.StockItemVO;

public interface IDaishinDao {
	public void daishinInsert(DailyPriceVO DaishinInfo) throws SQLException;
	public void daishinInsertCode(StockItemVO DaishinInfo) throws SQLException;
	public void insertDayCode(BusinessDayVO DaishinInfo) throws SQLException;
}
