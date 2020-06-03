package kr.or.redant.user.slimagefile.service;

import java.util.Map;

import kr.or.redant.vo.SLImageFileVO;

public interface ISLImageFileService {
	public SLImageFileVO slImageFileInfo(Map<String, String> params) throws Exception;
}
