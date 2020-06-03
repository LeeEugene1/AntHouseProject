package kr.or.redant.user.faqboard.service;

import java.util.List;
import java.util.Map;


import kr.or.redant.qualifer.service.IService;
import kr.or.redant.vo.FAQboardVO;

public interface IFaqboardService extends IService{
	public FAQboardVO faqboardInfo(Map<String, String> params) throws Exception;
	public List<FAQboardVO> faqboardList(Map<String, String> params) throws Exception;
	public void insertFAQboardInfo(FAQboardVO faqboardInfo) throws Exception;
	public void updateFAQboardInfo(FAQboardVO faqboardInfo) throws Exception;
	public void deleteFAQboardInfo(Map<String, String> params) throws Exception;
	public String totalCount(Map<String, String> params) throws Exception;
}
