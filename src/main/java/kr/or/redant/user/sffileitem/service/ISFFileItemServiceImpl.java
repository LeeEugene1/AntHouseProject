package kr.or.redant.user.sffileitem.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.redant.user.sffileitem.dao.ISFFileItemDAO;
import kr.or.redant.vo.SFFileItemVO;
@Service
public class ISFFileItemServiceImpl implements ISFFileItemService {
	@Autowired
	private ISFFileItemDAO dao;
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public SFFileItemVO sfFileItemInfo(Map<String, String> params)
			throws Exception {
		SFFileItemVO sfFileItemInfo = null;
		sfFileItemInfo = dao.sfFileItemInfo(params);
		return sfFileItemInfo;
	}

}
