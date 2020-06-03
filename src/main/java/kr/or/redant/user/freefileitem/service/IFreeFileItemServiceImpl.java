package kr.or.redant.user.freefileitem.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.redant.user.freefileitem.dao.IFreeFileItemDAO;
import kr.or.redant.user.qnafileitem.dao.IQnaFileItemDAO;
import kr.or.redant.vo.FreeFileItemVO;
import kr.or.redant.vo.QNAFileItemVO;
@Service
public class IFreeFileItemServiceImpl implements IFreeFileItemService {
	@Autowired
	private IFreeFileItemDAO dao;
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public FreeFileItemVO freeFileItemInfo(Map<String, String> params)
			throws Exception {
		FreeFileItemVO freeFileItemInfo = null;
		freeFileItemInfo = dao.freeFileItemInfo(params);
		return freeFileItemInfo;
	}

}
