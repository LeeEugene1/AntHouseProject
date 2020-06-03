package kr.or.redant.user.join.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.redant.vo.MemberVO;

public interface IJoinService {
	public MemberVO getMemberInfo(Map<String, String> params) throws SQLException;
	public String insertMemberInfo(MemberVO memberInfo) throws SQLException;
	public String getMemberId(Map<String, String> params) throws SQLException;
}
