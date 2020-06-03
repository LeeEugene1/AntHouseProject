package kr.or.redant.admin.stockLecture.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import kr.or.redant.qualifer.service.IService;
import kr.or.redant.vo.StockLectureVO;

public interface IStockLectureService extends IService{
	public void insertStockLecturInfo(StockLectureVO stockLectureInfo, MultipartFile[] items) throws Exception;
	public List<StockLectureVO> stockLectureList(Map<String, String> params) throws Exception;
	public StockLectureVO stockLectureInfo(Map<String, String> params) throws Exception;
	public void updateStockLecturInfo(StockLectureVO stockLectureInfo) throws Exception;
	public void deleteStockLecturInfo(Map<String, String> params) throws Exception;
	public String totalCount(Map<String, String> params) throws Exception;
}
