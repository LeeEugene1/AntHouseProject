package kr.or.redant.user.faqboard.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.redant.user.faqboard.dao.IFaqboardDAO;
import kr.or.redant.vo.FAQboardVO;

@Service
public class IFaqboardServiceImpl implements IFaqboardService {
	@Autowired
	private IFaqboardDAO faqboardDAO;
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public FAQboardVO faqboardInfo(Map<String, String> params) throws Exception {
		FAQboardVO faqboardInfo = null;
		faqboardInfo = faqboardDAO.faqboardInfo(params);
		return faqboardInfo;
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public List<FAQboardVO> faqboardList(Map<String, String> params)
			throws Exception {
		List<FAQboardVO> faqboardList = null;
		faqboardList = faqboardDAO.faqboardList(params);
		return faqboardList;
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public String totalCount(Map<String, String> params) throws Exception {
		String totalCount = "0";
		totalCount = faqboardDAO.totalCount(params);
		return totalCount;
	}

	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public void updateFAQboardInfo(FAQboardVO faqboardInfo) throws Exception {
		faqboardDAO.updateFAQboardInfo(faqboardInfo);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public void deleteFAQboardInfo(Map<String, String> params) throws Exception {
		faqboardDAO.deleteFAQboardInfo(params);
	}

	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public void insertFAQboardInfo(FAQboardVO faqboardInfo) throws Exception {
		String faq_no = faqboardDAO.insertFAQboardInfo(faqboardInfo);
	}



}
