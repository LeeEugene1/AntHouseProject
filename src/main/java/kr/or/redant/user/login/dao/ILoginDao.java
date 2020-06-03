package kr.or.redant.user.login.dao;

import java.sql.SQLException;
import java.util.Map;

import kr.or.redant.vo.AdminVO;
import kr.or.redant.vo.MemberVO;

public interface ILoginDao {
	public MemberVO getMemberInfo(Map<String, String> params) throws SQLException;
	public AdminVO getAdminInfo(Map<String, String> params) throws SQLException;
	public String insertMemberInfo(MemberVO memberInfo) throws SQLException;
}
