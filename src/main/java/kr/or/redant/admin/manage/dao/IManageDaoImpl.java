package kr.or.redant.admin.manage.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.redant.vo.MemberVO;
import kr.or.redant.vo.StockForumVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;


@Repository
public class IManageDaoImpl implements IManageDao {
	
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
	public void updateMemberInfo(MemberVO memberInfo) throws Exception {
		client.update("member.updateMember", memberInfo);
	}
	
	@Override
	public void updateMemberHp(Map<String, String> params) throws Exception {
		client.update("member.updateHp", params);
	}
	
	@Override
	public List<MemberVO> memberList() throws Exception {
		return client.queryForList("member.memberList");
	}
	
	@Override
	public List<MemberVO> memberList(Map<String, String> params) throws Exception {
		return client.queryForList("member.memberList", params);
	}
	
	@Override
	public String totalCount(Map<String, String> params) throws Exception {
		return (String) client.queryForObject("member.totalCount",params);
	}
	
	@Override
	public void deleteMemberInfo(Map<String, String> params)
			throws Exception {
		client.update("member.deleteMember", params);
	}
}
