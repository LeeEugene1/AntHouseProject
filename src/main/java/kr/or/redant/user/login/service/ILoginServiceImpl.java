package kr.or.redant.user.login.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.redant.user.join.dao.IJoinDao;
import kr.or.redant.user.login.dao.ILoginDao;
import kr.or.redant.vo.AdminVO;
import kr.or.redant.vo.MemberVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ILoginServiceImpl implements ILoginService {
   
	@Autowired
	private ILoginDao dao;
	
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

	public AdminVO getAdminInfo(Map<String, String> params) throws SQLException{
		AdminVO adminInfo = null;
		adminInfo = dao.getAdminInfo(params);
		return adminInfo;
	}
}