package kr.or.redant.user.qnaboard.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import kr.or.redant.qualifer.service.IService;
import kr.or.redant.vo.QNAboardVO;

public interface IQnaboardService extends IService{
	public QNAboardVO qnaboardInfo(Map<String, String> params) throws Exception;
	public List<QNAboardVO> qnaboardList(Map<String, String> params) throws Exception;
	public void insertQNAboardInfo(QNAboardVO qnaboardInfo, MultipartFile[] items) throws Exception;
	public void insertQNAboardInfo(QNAboardVO qnaboardInfo) throws Exception;
	public void updateQNAboardInfo(QNAboardVO qnaboardInfo) throws Exception;
	public void deleteQNAboardInfo(Map<String, String> params) throws Exception;
	public void insertQNAboardReply(QNAboardVO qnaboardInfo) throws Exception;
	public String totalCount(Map<String, String> params) throws Exception;
}
