package kr.or.redant.user.stockForum.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;



import kr.or.redant.user.sffileitem.dao.ISFFileItemDAO;
import kr.or.redant.user.stockForum.dao.IStockForumDao;
import kr.or.redant.utiles.AttachFileMapper;
import kr.or.redant.vo.SFFileItemVO;
import kr.or.redant.vo.StockForumVO;

import org.apache.commons.fileupload.FileItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


@Service
public class IStockForumServiceImpl implements IStockForumService {
   
   @Autowired
   private IStockForumDao stockForumDAO;
   @Autowired
   private ISFFileItemDAO fileitemDAO;
   @Autowired
   private AttachFileMapper fileMapper;
   

   @Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
   @Override
   public void insertStockForumInfo(StockForumVO stockForumInfo, MultipartFile[] items) throws Exception{
	   String sf_no = stockForumDAO.insertStockForumInfo(stockForumInfo);
	   List<SFFileItemVO> fileItemList = this.fileMapper.sfMapper(items, sf_no);
	   fileitemDAO.insertSFFileItem(fileItemList);
   }
   
   @Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
   @Override
   public void insertStockForumReply(StockForumVO stockForumInfo, MultipartFile[] items) throws Exception{
	   String sf_no = stockForumDAO.insertStockForumReply(stockForumInfo);
	   List<SFFileItemVO> fileItemList = this.fileMapper.sfMapper(items, sf_no);
	   fileitemDAO.insertSFFileItem(fileItemList);
   }
   
   @Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
   @Override
   public void updateStockForumInfo(StockForumVO stockForumInfo) throws Exception{
	   stockForumDAO.updateStockForumInfo(stockForumInfo);
   }

   @Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
   @Override
   public void deleteStockForumInfo(Map<String, String> params) throws Exception{
	   stockForumDAO.deleteStockForumInfo(params);
   }

   @Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
   @Override
   public StockForumVO stockForumInfo(Map<String, String> params) throws Exception{
      StockForumVO stockForumInfo = null;
      stockForumInfo = stockForumDAO.stockForumInfo(params);
      return stockForumInfo;
   }

   @Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
   @Override
   public List<StockForumVO> stockForumList(Map<String, String> params) throws Exception{
      List<StockForumVO> stockForumList = null;
      stockForumList = stockForumDAO.stockForumList(params);
      
      return stockForumList;
   }


   @Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
   @Override
   public String totalCount(Map<String, String> params) throws Exception{
      String totalCount = "0";
      totalCount = stockForumDAO.totalCount(params);
      return totalCount;
   }
   
}