package kr.or.redant.admin.stockLecture.dao;

import java.util.List;
import java.util.Map;

import kr.or.redant.vo.StockLectureVO;

public interface IStockLectureDao {
	public String insertStockLecturInfo(StockLectureVO stockLectureInfo) throws Exception;
	public List<StockLectureVO> stockLectureList(Map<String, String> params) throws Exception;
	public StockLectureVO stockLectureInfo(Map<String, String> params) throws Exception;
	public void updateStockLecturInfo(StockLectureVO stockLectureInfo) throws Exception;
	public void deleteStockLecturInfo(Map<String, String> params) throws Exception;
	public String totalCount(Map<String, String> params) throws Exception;
}
