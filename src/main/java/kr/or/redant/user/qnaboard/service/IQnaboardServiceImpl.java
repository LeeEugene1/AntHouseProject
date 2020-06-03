package kr.or.redant.user.qnaboard.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.or.redant.user.qnaboard.dao.IQnaboardDAO;
import kr.or.redant.user.qnafileitem.dao.IQnaFileItemDAO;
import kr.or.redant.utiles.AttachFileMapper;
import kr.or.redant.vo.QNAFileItemVO;
import kr.or.redant.vo.QNAboardVO;

@Service
public class IQnaboardServiceImpl implements IQnaboardService {
	@Autowired
	private IQnaboardDAO qnaboardDAO;
	@Autowired
	private IQnaFileItemDAO fileitemDAO;
	@Autowired
	private AttachFileMapper fileMapper;
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public QNAboardVO qnaboardInfo(Map<String, String> params) throws Exception {
		QNAboardVO qnaboardInfo = null;
		qnaboardInfo = qnaboardDAO.qnaboardInfo(params);
		return qnaboardInfo;
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public List<QNAboardVO> qnaboardList(Map<String, String> params)
			throws Exception {
		List<QNAboardVO> qnaboardList = null;
		qnaboardList = qnaboardDAO.qnaboardList(params);
		return qnaboardList;
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public String totalCount(Map<String, String> params) throws Exception {
		String totalCount = "0";
		totalCount = qnaboardDAO.totalCount(params);
		return totalCount;
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public void insertQNAboardInfo(QNAboardVO qnaboardInfo, MultipartFile[] items) throws Exception {
		String qna_no = qnaboardDAO.insertQNAboardInfo(qnaboardInfo);
		List<QNAFileItemVO> fileItemList = this.fileMapper.qnaMapper(items, qna_no);
		fileitemDAO.insertQnaFileItem(fileItemList);
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public void updateQNAboardInfo(QNAboardVO qnaboardInfo) throws Exception {
		qnaboardDAO.updateQNAboardInfo(qnaboardInfo);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public void deleteQNAboardInfo(Map<String, String> params) throws Exception {
		qnaboardDAO.deleteQNAboardInfo(params);
	}

	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public void insertQNAboardReply(QNAboardVO qnaboardInfo) throws Exception {
		qnaboardDAO.insertQNAboardReply(qnaboardInfo);
	}
	
	@Transactional(propagation=Propagation.REQUIRES_NEW, readOnly=true)
	@Override
	public void insertQNAboardInfo(QNAboardVO qnaboardInfo) throws Exception {
		String qna_no = qnaboardDAO.insertQNAboardInfo(qnaboardInfo);
	}



}
