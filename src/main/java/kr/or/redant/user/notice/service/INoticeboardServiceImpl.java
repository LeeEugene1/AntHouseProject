package kr.or.redant.user.notice.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.redant.user.notice.dao.INoticeboardDAO;
import kr.or.redant.vo.NoticeboardVO;

@Service
public class INoticeboardServiceImpl implements INoticeboardService {
	@Autowired
	private INoticeboardDAO noticeboardDAO;
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public NoticeboardVO noticeboardInfo(Map<String, String> params) throws Exception {
		NoticeboardVO noticeboardInfo = null;
		noticeboardInfo = noticeboardDAO.noticeboardInfo(params);
		return noticeboardInfo;
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public List<NoticeboardVO> noticeboardList(Map<String, String> params)
			throws Exception {
		List<NoticeboardVO> noticeboardList = null;
		noticeboardList = noticeboardDAO.noticeboardList(params);
		return noticeboardList;
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public List<NoticeboardVO> noticeboardList()
			throws Exception {
		List<NoticeboardVO> noticeboardList = null;
		noticeboardList = noticeboardDAO.noticeboardList();
		return noticeboardList;
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public String totalCount(Map<String, String> params) throws Exception {
		String totalCount = "0";
		totalCount = noticeboardDAO.totalCount(params);
		return totalCount;
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public void updateNoticeboardInfo(NoticeboardVO noticeboardInfo)
			throws Exception {
		noticeboardDAO.updateNoticeboardInfo(noticeboardInfo);
		
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public void deleteNoticeboardInfo(Map<String, String> params)
			throws Exception {
		noticeboardDAO.deleteNoticeboardInfo(params);
		
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public void insertNoticeboardInfo(NoticeboardVO noticeboardInfo)
			throws Exception {
		String notice_no = noticeboardDAO.insertNoticeboardInfo(noticeboardInfo);
		
	}



	



}
