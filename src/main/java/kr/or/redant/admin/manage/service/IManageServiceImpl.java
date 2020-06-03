package kr.or.redant.admin.manage.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.redant.admin.manage.dao.IManageDao;
import kr.or.redant.user.join.dao.IJoinDao;
import kr.or.redant.user.member.dao.IMemberDao;
import kr.or.redant.vo.MemberVO;
import kr.or.redant.vo.StockForumVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class IManageServiceImpl implements IManageService {
   
	@Autowired
	private IManageDao dao;
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
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

	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void updateMemberInfo(MemberVO memberInfo) throws Exception{
		dao.updateMemberInfo(memberInfo);
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, rollbackFor={Exception.class})
	@Override
	public void updateMemberHp(Map<String, String> params) throws Exception{
		dao.updateMemberHp(params);
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public List<MemberVO> memberList() throws Exception{
		List<MemberVO> memberList = null;
		memberList = dao.memberList();
		return memberList;
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
    @Override
    public List<MemberVO> memberList(Map<String, String> params) throws Exception{
       List<MemberVO> memberList = null;
       memberList = dao.memberList(params);
      
       return memberList;
    }
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
    @Override
    public String totalCount(Map<String, String> params) throws Exception{
       String totalCount = "0";
       totalCount = dao.totalCount(params);
       return totalCount;
    }
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
    @Override
    public void deleteMemberInfo(Map<String, String> params) throws Exception{
		dao.deleteMemberInfo(params);
    }

}