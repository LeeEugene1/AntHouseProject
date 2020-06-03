package kr.or.redant.user.qnaboard.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.redant.vo.QNAboardVO;
@Repository
public class IQnaboardDAOImpl implements IQnaboardDAO {

	@Autowired
	private SqlMapClient client;
	

	@Override
	public QNAboardVO qnaboardInfo(Map<String, String> params) throws Exception {
		QNAboardVO qnaboardInfo = null;
		try {
			client.startTransaction();
			client.update("qnaboard.updateHIT", params);
			qnaboardInfo = (QNAboardVO) client.queryForObject("qnaboard.qnaboardInfo",params);
			client.commitTransaction();
		}finally{
			client.endTransaction();
		}
		return qnaboardInfo;
	}

	@Override
	public List<QNAboardVO> qnaboardList(Map<String, String> params)
			throws Exception {
		return client.queryForList("qnaboard.qnaboardList", params);
	}

	@Override
	public String totalCount(Map<String, String> params) throws Exception {
		return (String) client.queryForObject("qnaboard.totalCount",params);
	}

	@Override
	public String insertQNAboardInfo(QNAboardVO qnaboardInfo) throws Exception {
		return (String) client.insert("qnaboard.insertQNAboard",qnaboardInfo);
	}
	
	@Override
	public void updateQNAboardInfo(QNAboardVO qnaboardInfo) throws Exception {
		client.update("qnaboard.updateQNAboard", qnaboardInfo);
	}

	@Override
	public void deleteQNAboardInfo(Map<String, String> params) throws Exception {
		client.update("qnaboard.deleteQNAboard", params);
	}

	@Override
	public void insertQNAboardReply(QNAboardVO qnaboardInfo) throws Exception {
		try {
			client.startTransaction();
			
			String qna_g_seq;
			if("0".intern() == qnaboardInfo.getQna_g_seq().intern()){
				qna_g_seq = (String) client.queryForObject("qnaboard.incrementSEQ",qnaboardInfo);
			}else{
				client.update("qnaboard.updateSEQ", qnaboardInfo);
				qna_g_seq = String.valueOf(Integer.parseInt(qnaboardInfo.getQna_g_seq())+1);
			}
			qnaboardInfo.setQna_g_seq(qna_g_seq);
			
			String qna_depth = String.valueOf(Integer.parseInt(qnaboardInfo.getQna_depth())+1);
			qnaboardInfo.setQna_depth(qna_depth);
			
			client.insert("qnaboard.insertQNAboardReply", qnaboardInfo);
			
			client.commitTransaction();
		} finally {
			client.endTransaction();
		}
	}




}
