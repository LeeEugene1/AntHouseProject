package kr.or.redant.user.freeboard.service;

import java.util.List;
import java.util.Map;





import kr.or.redant.user.freeboard.dao.IFreeboardDao;
import kr.or.redant.user.freefileitem.dao.IFreeFileItemDAO;
import kr.or.redant.utiles.AttachFileMapper;
import kr.or.redant.vo.FreeFileItemVO;
import kr.or.redant.vo.FreeboardVO;
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
public class IFreeboardServiceImpl implements IFreeboardService {
	
	   @Autowired
	   private IFreeboardDao freeboardDAO;
	   @Autowired
	   private IFreeFileItemDAO fileitemDAO;
	   @Autowired
	   private AttachFileMapper fileMapper;
	   

	   @Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	   @Override
	   public void insertFreeboardInfo(FreeboardVO freeboardInfo, MultipartFile[] items) throws Exception{
	      String fr_bo_no = freeboardDAO.insertFreeboardInfo(freeboardInfo);
	      // 첨부파일의 파일 정보를 FileItemVO에 맵핑 및 저장
	      List<FreeFileItemVO> fileItemList = this.fileMapper.freeMapper(items, fr_bo_no);
	      fileitemDAO.insertFreeFileItem(fileItemList);
	   }
	   
	   @Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	   @Override
	   public void updateFreeboardInfo(FreeboardVO freeboardInfo) throws Exception{
		   freeboardDAO.updateFreeboardInfo(freeboardInfo);
	   }

	   @Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	   @Override
	   public void deleteFreeboardInfo(Map<String, String> params) throws Exception{
		   freeboardDAO.deleteFreeboardInfo(params);
	   }

	   @Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	   @Override
	   public FreeboardVO freeboardInfo(Map<String, String> params) throws Exception{
	      FreeboardVO freeboardInfo = null;
	      freeboardInfo = freeboardDAO.freeboardInfo(params);
	      return freeboardInfo;
	   }

	   @Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	   @Override
	   public List<FreeboardVO> freeboardList() throws Exception{
	      List<FreeboardVO> freeboardList = null;
	      freeboardList = freeboardDAO.freeboardList();
	      return freeboardList;
	   }

	   @Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	   @Override
	   public List<FreeboardVO> freeboardList(Map<String, String> params) throws Exception{
	      List<FreeboardVO> freeboardList = null;
	      freeboardList = freeboardDAO.freeboardList(params);
	      
	      return freeboardList;
	   }

	   @Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	   @Override
	   public void insertFreeboardReply(FreeboardVO freeboardInfo, MultipartFile[] items) throws Exception{
		   String fr_bo_no = freeboardDAO.insertFreeboardReply(freeboardInfo);
		   List<FreeFileItemVO> fileItemList = this.fileMapper.freeMapper(items, fr_bo_no);
		   fileitemDAO.insertFreeFileItem(fileItemList);
	   }

	   @Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	   @Override
	   public String totalCount(Map<String, String> params) throws Exception{
	      String totalCount = "0";
	      totalCount = freeboardDAO.totalCount(params);
	      return totalCount;
	   }
	   
	   @Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	   @Override
	   public void insertFreeboardInfo(FreeboardVO freeboardInfo) throws Exception{
	      String fr_bo_no = freeboardDAO.insertFreeboardInfo(freeboardInfo);
	   }

}