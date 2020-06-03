package kr.or.redant.user.qnafileitem.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.redant.user.qnafileitem.dao.IQnaFileItemDAO;
import kr.or.redant.vo.QNAFileItemVO;
@Service
public class IQnaFileItemServiceImpl implements IQnaFileItemService {
	@Autowired
	private IQnaFileItemDAO dao;
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public QNAFileItemVO qnaFileItemInfo(Map<String, String> params)
			throws Exception {
		QNAFileItemVO qnaFileItemInfo = null;
		qnaFileItemInfo = dao.qnaFileItemInfo(params);
		return qnaFileItemInfo;
	}

}
