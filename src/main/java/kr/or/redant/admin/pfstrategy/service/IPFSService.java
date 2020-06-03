package kr.or.redant.admin.pfstrategy.service;

import java.util.List;
import java.util.Map;






import kr.or.redant.qualifer.service.IService;
import kr.or.redant.vo.PortfolioResultVO;

public interface IPFSService extends IService{
	public List<PortfolioResultVO> strategyList(Map<String, String> params) throws Exception;
	public List<PortfolioResultVO> strategyLowList(Map<String, String> params) throws Exception;
	public List<PortfolioResultVO> listView(Map<String, String> params) throws Exception;
	public List<PortfolioResultVO> momList() throws Exception;
	public void insertsteategy(PortfolioResultVO pfsResultInfo) throws Exception;
	public void deletePFS(Map<String, String> params) throws Exception;
}
