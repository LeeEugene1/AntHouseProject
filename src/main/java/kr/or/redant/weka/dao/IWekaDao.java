package kr.or.redant.weka.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.redant.vo.BusinessDayVO;
import kr.or.redant.vo.DailyPriceVO;
import kr.or.redant.vo.MemberVO;
import kr.or.redant.vo.StockItemVO;

public interface IWekaDao {
	public List<DailyPriceVO> wekaList(Map<String, String> params) throws Exception;
}
