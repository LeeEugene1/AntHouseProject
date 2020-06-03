package kr.or.redant.user.join.dao;

import java.sql.SQLException;
import java.util.Map;

import kr.or.redant.vo.MemberVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;


@Repository
public class IJoinDaoImpl implements IJoinDao {
	
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
	public String getMemberId(Map<String, String> params) throws SQLException {
		String mem_id = (String) client.queryForObject("member.getMemberId",params);
		return mem_id;
	}
}
