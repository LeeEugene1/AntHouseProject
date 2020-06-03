package kr.or.redant.admin.businessday.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.redant.vo.BusinessDayVO;
@Repository
public class IBSDayDAOImpl implements IBSDayDAO {

	@Autowired
	private SqlMapClient client;

	@Override
	public List<BusinessDayVO> selectYear()
			throws Exception {
		return client.queryForList("businessday.selectYear");
	}

	@Override
	public List<BusinessDayVO> selectMonth(Map<String, String> params)
			throws Exception {
		return client.queryForList("businessday.selectMonth", params);
	}

	@Override
	public List<BusinessDayVO> selectDate(Map<String, String> params)
			throws Exception {
		return client.queryForList("businessday.selectDate", params);
	}


}
