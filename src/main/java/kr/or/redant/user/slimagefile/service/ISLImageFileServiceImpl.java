package kr.or.redant.user.slimagefile.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.redant.user.sffileitem.dao.ISFFileItemDAO;
import kr.or.redant.user.slimagefile.dao.ISLImageFileDAO;
import kr.or.redant.vo.SFFileItemVO;
import kr.or.redant.vo.SLImageFileVO;
@Service
public class ISLImageFileServiceImpl implements ISLImageFileService {
	@Autowired
	private ISLImageFileDAO dao;
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public SLImageFileVO slImageFileInfo(Map<String, String> params)
			throws Exception {
		SLImageFileVO slImageFileInfo = null;
		slImageFileInfo = dao.slImageFileInfo(params);
		return slImageFileInfo;
	}

}
