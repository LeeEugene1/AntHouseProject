package kr.or.redant.user.member.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.redant.vo.InterestItemVO;
import kr.or.redant.vo.MemberVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.ibatis.sqlmap.client.SqlMapClient;


@Repository
public class IMemberDaoImpl implements IMemberDao {
	
	@Autowired
	private SqlMapClient client;

	@Override
	public MemberVO getMemberInfo(Map<String, String> params)
			throws SQLException {
		return (MemberVO) client.queryForObject("member.memberInfo", params);
	}
	
	@Override
	public String insertMemberInfo(MemberVO memberInfo) throws SQLException {
		String rtnValue = (String) client.insert("member.insertMemberInfo", memberInfo);
		return rtnValue;
	}
	
	@Override
	public void updateMemberInfo(MemberVO memberInfo) throws SQLException {
		client.update("member.updateMember", memberInfo);
	}
	
	@Override
	public void updateMemberHp(Map<String, String> params) throws SQLException {
		client.update("member.updateHp", params);
	}
	
	@Override
	public void deleteMemberInfo(Map<String, String> params) 
		throws SQLException {
		client.update("member.PleaseOut", params);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public List<InterestItemVO> interestItemList(Map<String, String> params)
			throws SQLException {
		System.out.println("-------------mem_id는?????? "+params.get("mem_id"));
		return client.queryForList("interestItem.interestItemList", params);
	}

	@Override
	public int deleteInterestItemInfo(Map<String, String> params)
			throws SQLException {
		return client.delete("interestItem.deleteItem", params);
		
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public void insertInterestStock(InterestItemVO interestInfo)
			throws SQLException {
		client.insert("interestItem.insertItem", interestInfo);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public String getStockName(Map<String, String> params) throws SQLException {
		return (String) client.queryForObject("interestItem.getStockName", params);
	}
	
	
}
