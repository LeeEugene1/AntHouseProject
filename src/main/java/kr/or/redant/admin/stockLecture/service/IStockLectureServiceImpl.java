package kr.or.redant.admin.stockLecture.service;

import java.util.List;
import java.util.Map;

import kr.or.redant.admin.stockLecture.dao.IStockLectureDao;
import kr.or.redant.user.slimagefile.dao.ISLImageFileDAO;
import kr.or.redant.utiles.AttachFileMapper;
import kr.or.redant.vo.SLImageFileVO;
import kr.or.redant.vo.StockLectureVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service
public class IStockLectureServiceImpl implements IStockLectureService {
   
	@Autowired
	private IStockLectureDao dao;
	@Autowired
	private ISLImageFileDAO fileitemDAO;
	@Autowired
	private AttachFileMapper fileMapper;
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public void insertStockLecturInfo(StockLectureVO stockLectureInfo, MultipartFile[] items)
			throws Exception {
		String sl_no = dao.insertStockLecturInfo(stockLectureInfo);
		List<SLImageFileVO> fileItemList = this.fileMapper.slMapper(items, sl_no);
		fileitemDAO.insertSLImageFile(fileItemList);
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public List<StockLectureVO> stockLectureList(Map<String, String> params)
			throws Exception {
		List<StockLectureVO> StockLectureList = null;
		StockLectureList = dao.stockLectureList(params);
	    return StockLectureList;
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public StockLectureVO stockLectureInfo(Map<String, String> params)
			throws Exception {
		StockLectureVO stockLectureInfo = null;
		stockLectureInfo = dao.stockLectureInfo(params);
		return stockLectureInfo;
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public void updateStockLecturInfo(StockLectureVO stockLectureInfo)
			throws Exception {
		dao.updateStockLecturInfo(stockLectureInfo);
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public void deleteStockLecturInfo(Map<String, String> params)
			throws Exception {
		dao.deleteStockLecturInfo(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public String totalCount(Map<String, String> params) throws Exception {
		 String totalCount = "0";
	     totalCount = dao.totalCount(params);
	     return totalCount;
	}
	
	
}