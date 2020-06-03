package kr.or.redant.admin.pfstrategy.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.redant.vo.PortfolioResultVO;
@Repository
public class IPFSDAOImpl implements IPFSDAO {

	@Autowired
	private SqlMapClient client;

	@Override
	public List<PortfolioResultVO> strategyList(Map<String, String> params)
			throws Exception {
		return client.queryForList("pfstrategy.strategyList", params);
	}

	@Override
	public String insertsteategy(PortfolioResultVO pfsResultInfo)
			throws Exception {
		return (String) client.insert("pfstrategy.insertsteategy",pfsResultInfo);
	}

	@Override
	public List<PortfolioResultVO> momList()
			throws Exception {
		return client.queryForList("pfstrategy.momList");
	}

	@Override
	public List<PortfolioResultVO> strategyLowList(Map<String, String> params)
			throws Exception {
		return client.queryForList("pfstrategy.strategyLowList", params);
	}

	@Override
	public List<PortfolioResultVO> listView(Map<String, String> params)
			throws Exception {
		return client.queryForList("pfstrategy.listView", params);
	}

	@Override
	public void deletePFS(Map<String, String> params) throws Exception {
		client.delete("pfstrategy.deletePFS",params);
		
	}

}
