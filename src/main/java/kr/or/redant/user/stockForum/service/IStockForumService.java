package kr.or.redant.user.stockForum.service;

import java.util.List;
import java.util.Map;

import kr.or.redant.qualifer.service.IService;
import kr.or.redant.vo.StockForumVO;

import org.apache.commons.fileupload.FileItem;
import org.springframework.web.multipart.MultipartFile;

public interface IStockForumService extends IService{
	public void insertStockForumInfo(StockForumVO stockForumInfo, MultipartFile[] items) throws Exception;
	public void insertStockForumReply(StockForumVO stockForumInfo, MultipartFile[] items) throws Exception;
	public List<StockForumVO> stockForumList(Map<String, String> params) throws Exception;
	public StockForumVO stockForumInfo(Map<String, String> params) throws Exception;
	public void updateStockForumInfo(StockForumVO stockForumInfo) throws Exception;
	public void deleteStockForumInfo(Map<String, String> params) throws Exception;
	public String totalCount(Map<String, String> params) throws Exception;
	
}
