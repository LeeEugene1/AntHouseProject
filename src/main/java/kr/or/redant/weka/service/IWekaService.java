package kr.or.redant.weka.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.redant.qualifer.service.IService;
import kr.or.redant.vo.BusinessDayVO;
import kr.or.redant.vo.DailyPriceVO;
import kr.or.redant.vo.StockItemVO;

public interface IWekaService extends IService{
	public List<DailyPriceVO> wekaList(Map<String, String> params) throws Exception;
}
