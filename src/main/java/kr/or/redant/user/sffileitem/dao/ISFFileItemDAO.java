package kr.or.redant.user.sffileitem.dao;

import java.util.List;
import java.util.Map;

import kr.or.redant.vo.SFFileItemVO;

public interface ISFFileItemDAO {
	public void insertSFFileItem(List<SFFileItemVO> fileItemList) throws Exception;
	public SFFileItemVO sfFileItemInfo(Map<String, String> params) throws Exception;
}
