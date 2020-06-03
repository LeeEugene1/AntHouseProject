package kr.or.redant.user.freeboard.dao;

import java.util.List;
import java.util.Map;

import kr.or.redant.vo.FreeboardVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

@Repository
public class IFreeboardDaoImpl implements IFreeboardDao {
	
	@Autowired
	private SqlMapClient client; 
	
	@Override
    public FreeboardVO freeboardInfo(Map<String, String> params) throws Exception {
		FreeboardVO freeboardInfo = null;
		
		try {
			client.startTransaction();
			client.update("freeboard.updateHIT", params);
			freeboardInfo = (FreeboardVO) client.queryForObject("freeboard.freeboardInfo",params);
			client.commitTransaction();
		}finally{
			client.endTransaction();
		}
		
       return freeboardInfo;
    }

	@Override
	public List<FreeboardVO> freeboardList(Map<String, String> params) throws Exception {
		return client.queryForList("freeboard.freeboardList", params);
	}

	@Override
	public List<FreeboardVO> freeboardList() throws Exception {
		return client.queryForList("freeboard.freeboardList");
	}
	
	@Override
	public String insertFreeboardInfo(FreeboardVO freeboardInfo)
			throws Exception {
		return (String) client.insert("freeboard.insertFreeboard", freeboardInfo);
	}

	@Override
	public void updateFreeboardInfo(FreeboardVO freeboardInfo)
			throws Exception {
		client.update("freeboard.updateFreeboard", freeboardInfo);
	}

	@Override
	public void deleteFreeboardInfo(Map<String, String> params)
			throws Exception {
		client.update("freeboard.deleteFreeboard", params);
	}

	@Override
	public String insertFreeboardReply(FreeboardVO freeboardInfo)
			throws Exception {
		try{
			client.startTransaction();
			
			String Fr_bo_seq;
			if("0".intern() == freeboardInfo.getFr_bo_seq().intern()){
				Fr_bo_seq = (String) client.queryForObject("freeboard.incrementSEQ", freeboardInfo);
			}else{
				// insert대상 게시글의 부모가 댓글 또는 대댓글 또는 대대댓글 .....
				client.update("freeboard.updateSEQ", freeboardInfo);
				Fr_bo_seq = String.valueOf(Integer.parseInt(freeboardInfo.getFr_bo_seq())+1);
			}
			freeboardInfo.setFr_bo_seq(Fr_bo_seq);
			
			String Fr_bo_depth = String.valueOf(Integer.parseInt(freeboardInfo.getFr_bo_depth())+1);
			freeboardInfo.setFr_bo_depth(Fr_bo_depth);
			
			client.commitTransaction();
			
		}finally{
			client.endTransaction();
		}
		
		return (String) client.insert("freeboard.insertFreeboardReply",freeboardInfo);
	}
	
	@Override
	public String totalCount(Map<String, String> params) throws Exception {
		return (String) client.queryForObject("freeboard.totalCount",params);
	}


}
