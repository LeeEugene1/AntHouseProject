package kr.or.redant.user.slimagefile.dao;

import java.util.List;
import java.util.Map;

import kr.or.redant.vo.SLImageFileVO;

public interface ISLImageFileDAO {
	public void insertSLImageFile(List<SLImageFileVO> fileItemList) throws Exception;
	public SLImageFileVO slImageFileInfo(Map<String, String> params) throws Exception;
}
