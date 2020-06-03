package kr.or.redant.daishin.dao;

import java.sql.SQLException;

import kr.or.redant.vo.BusinessDayVO;
import kr.or.redant.vo.DailyPriceVO;
import kr.or.redant.vo.StockItemVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IDaishinDaoImpl implements IDaishinDao {
	
	@Autowired
	private SqlMapClient client;
	
	@Override
	public void daishinInsert(DailyPriceVO DaishinInfo) throws SQLException {
		client.insert("daishin.insertDaishinInfo", DaishinInfo);
	}
	
	@Override
	public void daishinInsertCode(StockItemVO DaishinInfo) throws SQLException {
		client.insert("daishin.insertDaishinCode", DaishinInfo);
	}
	
	@Override
	public void insertDayCode(BusinessDayVO DaishinInfo) throws SQLException {
		client.insert("daishin.insertDaishinDay", DaishinInfo);
	}
}
