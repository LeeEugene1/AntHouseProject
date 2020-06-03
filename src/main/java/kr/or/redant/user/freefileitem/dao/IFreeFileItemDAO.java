package kr.or.redant.user.freefileitem.dao;

import java.util.List;
import java.util.Map;

import kr.or.redant.vo.FreeFileItemVO;

public interface IFreeFileItemDAO {
	public void insertFreeFileItem(List<FreeFileItemVO> fileItemList) throws Exception;
	public FreeFileItemVO freeFileItemInfo(Map<String, String> params) throws Exception;
}
