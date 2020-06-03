package kr.or.redant.user.stockForum.dao;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import kr.or.redant.vo.StockForumVO;

public interface IStockForumDao {
	public String insertStockForumInfo(StockForumVO stockForumInfo) throws Exception;
	public String insertStockForumReply(StockForumVO stockForumInfo) throws Exception;
	public List<StockForumVO> stockForumList(Map<String, String> params) throws Exception;
	public StockForumVO stockForumInfo(Map<String, String> params) throws Exception;
	public void updateStockForumInfo(StockForumVO stockForumInfo) throws Exception;
	public void deleteStockForumInfo(Map<String, String> params) throws Exception;
	public String totalCount(Map<String, String> params) throws Exception;
}
