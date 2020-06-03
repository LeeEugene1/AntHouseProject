package kr.or.redant.user.member.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.redant.vo.InterestItemVO;
import kr.or.redant.vo.MemberVO;

public interface IMemberDao {
	public MemberVO getMemberInfo(Map<String, String> params) throws SQLException;
	public String insertMemberInfo(MemberVO memberInfo) throws SQLException;
	public void updateMemberInfo(MemberVO memberInfo) throws SQLException;
	public void updateMemberHp(Map<String, String> params) throws SQLException;
	public void deleteMemberInfo(Map<String, String> params) throws SQLException;
	public List<InterestItemVO> interestItemList(Map<String, String> params) throws SQLException;
	public int deleteInterestItemInfo(Map<String, String> params) throws SQLException;
	public void insertInterestStock(InterestItemVO interestInfo) throws SQLException;
	public String getStockName(Map<String, String> params) throws SQLException;
}
