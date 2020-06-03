package kr.or.redant.admin.pfstrategy.dao;

import java.util.List;
import java.util.Map;

import kr.or.redant.vo.PortfolioResultVO;

public interface IPFSDAO {
	public List<PortfolioResultVO> strategyList(Map<String, String> params) throws Exception;
	public List<PortfolioResultVO> strategyLowList(Map<String, String> params) throws Exception;
	public List<PortfolioResultVO> listView(Map<String, String> params) throws Exception;
	public List<PortfolioResultVO> momList() throws Exception;
	public String insertsteategy(PortfolioResultVO pfsResultInfo) throws Exception;
	public void deletePFS(Map<String, String> params) throws Exception;
}
