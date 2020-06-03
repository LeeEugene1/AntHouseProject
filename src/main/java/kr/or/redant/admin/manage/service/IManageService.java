package kr.or.redant.admin.manage.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.redant.vo.MemberVO;

public interface IManageService {
	public MemberVO getMemberInfo(Map<String, String> params) throws SQLException;
	public String insertMemberInfo(MemberVO memberInfo) throws SQLException;
	public void updateMemberInfo(MemberVO memberInfo) throws Exception;
	public void updateMemberHp(Map<String, String> params) throws Exception;
	public List<MemberVO> memberList() throws Exception;
	public List<MemberVO> memberList(Map<String, String> params) throws Exception;
	public String totalCount(Map<String, String> params) throws Exception;
	public void deleteMemberInfo(Map<String, String> params) throws Exception;
}
