package kr.or.redant.admin.businessday.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.redant.admin.businessday.dao.IBSDayDAO;
import kr.or.redant.vo.BusinessDayVO;

@Service
public class IBSDayServiceImpl implements IBSDayService {
	@Autowired
	private IBSDayDAO businessdayDAO;
	

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public List<BusinessDayVO> selectYear() throws Exception {
		List<BusinessDayVO> selectYear = null;
		selectYear = businessdayDAO.selectYear();
		return selectYear;
	}


	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public List<BusinessDayVO> selectMonth(Map<String, String> params)
			throws Exception {
		List<BusinessDayVO> selectMonth = null;
		selectMonth = businessdayDAO.selectMonth(params);
		return selectMonth;
	}


	@Override
	public List<BusinessDayVO> selectDate(Map<String, String> params)
			throws Exception {
		List<BusinessDayVO> selectDate = null;
		selectDate = businessdayDAO.selectDate(params);
		return selectDate;
	}



}
