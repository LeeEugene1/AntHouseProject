package kr.or.redant.user.qnaboard.dao;

import java.util.List;
import java.util.Map;

import kr.or.redant.vo.QNAboardVO;

public interface IQnaboardDAO {
	public QNAboardVO qnaboardInfo(Map<String, String> params) throws Exception;
	public List<QNAboardVO> qnaboardList(Map<String, String> params) throws Exception;
	public String insertQNAboardInfo(QNAboardVO qnaboardInfo) throws Exception;
	public void updateQNAboardInfo(QNAboardVO qnaboardInfo) throws Exception;
	public void deleteQNAboardInfo(Map<String, String> params) throws Exception;
	public void insertQNAboardReply(QNAboardVO qnaboardInfo) throws Exception;
	public String totalCount(Map<String, String> params) throws Exception;
}
