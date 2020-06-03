package kr.or.redant.admin.businessday.service;

import java.util.List;
import java.util.Map;




import kr.or.redant.qualifer.service.IService;
import kr.or.redant.vo.BusinessDayVO;

public interface IBSDayService extends IService{
	public List<BusinessDayVO> selectYear() throws Exception;
	public List<BusinessDayVO> selectMonth(Map<String, String> params) throws Exception;
	public List<BusinessDayVO> selectDate(Map<String, String> params) throws Exception;
}
