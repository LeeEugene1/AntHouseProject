package kr.or.redant.user.login.dao;

import java.sql.SQLException;
import java.util.Map;

import kr.or.redant.vo.AdminVO;
import kr.or.redant.vo.MemberVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;


@Repository
public class ILoginDaoImpl implements ILoginDao {
	
	@Autowired
	private SqlMapClient client;

	@Override
	public MemberVO getMemberInfo(Map<String, String> params)
			throws SQLException {
		return (MemberVO) client.queryForObject("member.memberInfo", params);
	}
	
	@Override
	public AdminVO getAdminInfo(Map<String, String> params)
			throws SQLException {
		return (AdminVO) client.queryForObject("admin.adminInfo", params);
	}
	
	@Override
	public String insertMemberInfo(MemberVO memberInfo) throws SQLException {
		String rtnValue = (String) client.insert("member.insertMemberInfo", memberInfo);
		return rtnValue;
	}
}
