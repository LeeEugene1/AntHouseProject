package kr.or.redant.user.member.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.redant.user.join.dao.IJoinDao;
import kr.or.redant.user.member.dao.IMemberDao;
import kr.or.redant.vo.InterestItemVO;
import kr.or.redant.vo.MemberVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class IMemberServiceImpl implements IMemberService {
   
	@Autowired
	private IMemberDao dao;
	
	public MemberVO getMemberInfo(Map<String, String> params) throws SQLException{
		MemberVO memberInfo = null;
		memberInfo = dao.getMemberInfo(params);
		return memberInfo;
	}
	
	@Transactional(rollbackFor={SQLException.class})
	public String insertMemberInfo(MemberVO memberInfo) throws SQLException{
		String idPicture = null;
		idPicture = this.dao.insertMemberInfo(memberInfo);
		return idPicture;
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void updateMemberInfo(MemberVO memberInfo) throws SQLException{
		dao.updateMemberInfo(memberInfo);
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void updateMemberHp(Map<String, String> params) throws SQLException{
		dao.updateMemberHp(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
    @Override
    public void deleteMemberInfo(Map<String, String> params) throws SQLException{
		dao.deleteMemberInfo(params);
    }

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public List<InterestItemVO> interestItemList(Map<String, String> params)
			throws SQLException {
		return dao.interestItemList(params);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public int deleteInterestItemInfo(Map<String, String> params)
			throws SQLException {
		return dao.deleteInterestItemInfo(params);
		
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public void insertInterestStock(InterestItemVO interestInfo)
			throws SQLException {
		dao.insertInterestStock(interestInfo);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public String getStockName(Map<String, String> params) throws SQLException {
		return dao.getStockName(params);
	}
	
	
}