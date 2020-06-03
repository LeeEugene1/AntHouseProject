package kr.or.redant.user.faqboard.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.redant.vo.FAQboardVO;
@Repository
public class IFaqboardDAOImpl implements IFaqboardDAO {

	@Autowired
	private SqlMapClient client;
	

	@Override
	public FAQboardVO faqboardInfo(Map<String, String> params) throws Exception {
		FAQboardVO faqboardInfo = null;
		try {
			client.startTransaction();
			client.update("faqboard.updateHIT", params);
			faqboardInfo = (FAQboardVO) client.queryForObject("faqboard.faqboardInfo",params);
			client.commitTransaction();
		}finally{
			client.endTransaction();
		}
		return faqboardInfo;
	}

	@Override
	public List<FAQboardVO> faqboardList(Map<String, String> params)
			throws Exception {
		return client.queryForList("faqboard.faqboardList", params);
	}

	@Override
	public String totalCount(Map<String, String> params) throws Exception {
		return (String) client.queryForObject("faqboard.totalCount",params);
	}

	@Override
	public String insertFAQboardInfo(FAQboardVO faqboardInfo) throws Exception {
		return (String) client.insert("faqboard.insertFAQboard",faqboardInfo);
	}
	
	@Override
	public void updateFAQboardInfo(FAQboardVO faqboardInfo) throws Exception {
		client.update("faqboard.updateFAQboard", faqboardInfo);
	}

	@Override
	public void deleteFAQboardInfo(Map<String, String> params) throws Exception {
		client.update("faqboard.deleteFAQboard", params);
	}





}
