package kr.or.redant.user.freeboard.service;

import java.util.List;
import java.util.Map;

import kr.or.redant.qualifer.service.IService;
import kr.or.redant.vo.FreeboardVO;

import org.apache.commons.fileupload.FileItem;
import org.springframework.web.multipart.MultipartFile;


public interface IFreeboardService extends IService{
	public FreeboardVO freeboardInfo(Map<String, String> params) throws Exception;
	public List<FreeboardVO> freeboardList(Map<String, String> params) throws Exception;
	public List<FreeboardVO> freeboardList() throws Exception;
	public void insertFreeboardInfo(FreeboardVO freeboardInfo, MultipartFile[] items) throws Exception;
	public void insertFreeboardInfo(FreeboardVO freeboardInfo) throws Exception;
	public void insertFreeboardReply(FreeboardVO freeboardInfo, MultipartFile[] items) throws Exception;
	public void updateFreeboardInfo(FreeboardVO freeboardInfo) throws Exception;
	public void deleteFreeboardInfo(Map<String, String> params) throws Exception;
	public String totalCount(Map<String, String> params) throws Exception;
	
}
