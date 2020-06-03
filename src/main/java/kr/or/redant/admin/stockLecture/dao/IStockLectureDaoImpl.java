package kr.or.redant.admin.stockLecture.dao;

import java.util.List;
import java.util.Map;

import kr.or.redant.vo.StockLectureVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IStockLectureDaoImpl implements IStockLectureDao {
	
	@Autowired
	private SqlMapClient client;

	@Override
	public String insertStockLecturInfo(StockLectureVO stockLectureInfo)
			throws Exception {
		return (String) client.insert("stockLecture.insertStockLecture", stockLectureInfo);
	}

	@Override
	public List<StockLectureVO> stockLectureList(Map<String, String> params)
			throws Exception {
		return client.queryForList("stockLecture.getStockLectureList", params);
	}

	@Override
	public StockLectureVO stockLectureInfo(Map<String, String> params)
			throws Exception {
		StockLectureVO stockLectureInfo = null;
		
		try {
			client.startTransaction();
			client.update("stockLecture.plusHits", params);
			stockLectureInfo = (StockLectureVO) client.queryForObject("stockLecture.getStockLectureInfo",params);
			client.commitTransaction();
		}finally{
			client.endTransaction();
		}
		
       return stockLectureInfo;
	}

	@Override
	public void updateStockLecturInfo(StockLectureVO stockLectureInfo)
			throws Exception {
		client.update("stockLecture.updateStockLecture", stockLectureInfo);
	}

	@Override
	public void deleteStockLecturInfo(Map<String, String> params)
			throws Exception {
		client.update("stockLecture.deleteStockLecture", params);
	}

	@Override
	public String totalCount(Map<String, String> params) throws Exception {
		return (String) client.queryForObject("stockLecture.totalCount",params);
	}

	
}
