package kr.or.redant.user.join.dao;

import java.sql.SQLException;
import java.util.Map;

import kr.or.redant.vo.MemberVO;

public interface IJoinDao {
	public MemberVO getMemberInfo(Map<String, String> params) throws SQLException;
	public String insertMemberInfo(MemberVO memberInfo) throws SQLException;
	public String getMemberId(Map<String, String> params) throws SQLException;
}
