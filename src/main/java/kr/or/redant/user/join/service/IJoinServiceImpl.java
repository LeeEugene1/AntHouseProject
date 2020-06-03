package kr.or.redant.user.join.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.redant.user.join.dao.IJoinDao;
import kr.or.redant.vo.MemberVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class IJoinServiceImpl implements IJoinService {
   
	@Autowired
	private IJoinDao dao;
	
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

	@Override
	public String getMemberId(Map<String, String> params) throws SQLException {
		String mem_id = null;
		mem_id = this.dao.getMemberId(params);
		return mem_id;
	}

}