package kr.or.redant.user.freeboard.dao;

import java.util.List;
import java.util.Map;

import kr.or.redant.vo.FreeboardVO;

public interface IFreeboardDao {
	public FreeboardVO freeboardInfo(Map<String, String> params) throws Exception;
	public List<FreeboardVO> freeboardList(Map<String, String> params) throws Exception;
	public List<FreeboardVO> freeboardList() throws Exception;
	public String insertFreeboardInfo(FreeboardVO freeboardInfo) throws Exception;
	public String insertFreeboardReply(FreeboardVO freeboardInfo) throws Exception;
	public void updateFreeboardInfo(FreeboardVO freeboardInfo) throws Exception;
	public void deleteFreeboardInfo(Map<String, String> params) throws Exception;
	public String totalCount(Map<String, String> params) throws Exception;
}
