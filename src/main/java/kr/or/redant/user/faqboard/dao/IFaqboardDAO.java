package kr.or.redant.user.faqboard.dao;

import java.util.List;
import java.util.Map;

import kr.or.redant.vo.FAQboardVO;

public interface IFaqboardDAO {
	public FAQboardVO faqboardInfo(Map<String, String> params) throws Exception;
	public List<FAQboardVO> faqboardList(Map<String, String> params) throws Exception;
	public String insertFAQboardInfo(FAQboardVO faqboardInfo) throws Exception;
	public void updateFAQboardInfo(FAQboardVO faqboardInfo) throws Exception;
	public void deleteFAQboardInfo(Map<String, String> params) throws Exception;
	public String totalCount(Map<String, String> params) throws Exception;
}
